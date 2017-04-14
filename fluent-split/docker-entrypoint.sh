#!/bin/bash
#//==============================================
#// docker-entrypoint.sh
#//==============================================

MAPPING_FILE=/fluentd/etc/mapping/twitter_mapping.json

echo "Sleep 30s"
sleep 30
echo "MAPPING : $MAPPING_FILE"
curl -X PUT elasticsearch:9200/_template/twitter --data @$MAPPING_FILE
curl -X GET elasticsearch:9200/_template/twitter

#//==============================================
#// start fluentd
#//==============================================
exec "$@"