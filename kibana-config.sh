#/bin/bash

INDEX="*metadata*"
TIME_FIELD="@timestamp"
KIBANA_VERSION="5.1.1"

curl -X PUT http://localhost:9200/.kibana/index-pattern/$INDEX -d '{"title" : "$INDEX",  "timeFieldName": "$TIME_FIELD"}'
curl -X PUT http://localhost:9200/.kibana/config/$KIBANA_VERSION -d '{"defaultIndex" : "$INDEX"}'
