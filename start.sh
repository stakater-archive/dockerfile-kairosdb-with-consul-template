#!/bin/bash

# We just start the kairosdb service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a kaisrodb.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in /opt/kairosdb/conf/kairosdb.properties
# where kairosdb will be able to read from.
# KairosDB is restarted after config is changed, consul updates
# the configuration file and KairosDB reads it.
consul-template -consul=$CONSUL_URL -template="/templates/kairosdb.ctmpl:/opt/kairosdb/conf/kairosdb.properties:/opt/kairosdb/bin/kairosdb.sh run &"
