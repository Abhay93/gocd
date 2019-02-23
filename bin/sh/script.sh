#!/bin/sh
if (( $( echo {"projectStatus":{"status":"ERROR","conditions":[{"status":"ERROR","metricKey":"vulnerabilities","comparator":"GT","warninold":"0","errorThreshold":"0","actualValue":"1"}],"periods":[{"index":1,"mode":"previous_version","date":"2019-02-21T10:05:20+0000"}],"ignoredConditions":false}} | cut -d '{' -f 2 | cut -d ':' -f 3 | cut -d '}' -f 1 | grep -c "ERROR" ) ==1 )) ; then echo "PASSED"; else echo "failed"; fi

if (( $( curl -X POST -u admin:admin 'http://10.210.54.201:9000/api/qualitygates/project_status?projectKey=Mule_Project' | cut -d '{' -f 2 | cut -d ':' -f 3 | cut -d '}' -f 1 | grep -c "ERROR" ) ==1 )) ; then exit 1; else exit 0; fi
