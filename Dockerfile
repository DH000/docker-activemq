FROM registry.cn-hangzhou.aliyuncs.com/dthan/debian-jre8u151:1.8.151

# install activemq
ADD http://archive.apache.org/dist/activemq/5.15.2/apache-activemq-5.15.2-bin.tar.gz /usr/local/
RUN cd /usr/local && tar -zxvf apache-activemq-5.15.2-bin.tar.gz && rm -f apache-activemq-5.15.2-bin.tar.gz && mv apache-activemq-5.15.2/ activemq/

ENV ACTIVEMQ_HOME /usr/local/activemq
ENV ACTIVEMQ_DATA ${ACTIVEMQ_HOME}/data

RUN /usr/local/activemq/bin/activemq status

VOLUME /usr/local/activemq/conf
VOLUME /usr/local/activemq/data
EXPOSE 61616 8161
CMD ["/usr/local/activemq/bin/activemq", "console"]
