FROM busybox
MAINTAINER 李盼庚 <lipg@outlook.com>

ENV SKYWALKING_VERSION 8.0.1
ENV SKYWALKING_HOME=/usr/local/skywalking \
    AGENT_HOME=/opt/skywalking

RUN set -ex; \
    \
    mkdir -pv ${SKYWALKING_HOME} \
    \
    ; wget -O skywalking.tar.gz https://downloads.apache.org/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-${SKYWALKING_VERSION}.tar.gz \
    ; tar -tf skywalking.tar.gz \
    ; tar -zxvf skywalking.tar.gz --strip-components 2 -C ${SKYWALKING_HOME} apache-skywalking-apm-bin/agent/ \
    \
    ; cp -av ${SKYWALKING_HOME}/optional-plugins/* ${SKYWALKING_HOME}/plugins/ \
    \
    ; rm -rf skywalking.tar.gz \
    \
    ; ls -la ${SKYWALKING_HOME} 

CMD cp -av ${SKYWALKING_HOME}/* ${AGENT_HOME}/