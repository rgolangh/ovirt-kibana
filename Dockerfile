FROM docker.io/sebp/elk:5.1.1

MAINTAINER rgolan@redhat.com

# logstash config
COPY ovirt-logstash.conf /etc/logstash/conf.d/10-ovirt-logstash.conf
