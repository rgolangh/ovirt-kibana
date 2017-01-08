FROM docker.io/sebp/elk

MAINTAINER rgolan@redhat.com

# logstash config
COPY ovirt-logstash.conf /etc/logstash/conf.d/10-ovirt-logstash.conf
