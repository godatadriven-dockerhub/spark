FROM openjdk:8-jre-slim

ARG BUILD_DATE
ARG SPARK_VERSION=2.4.5

LABEL org.label-schema.name="Apache Spark ${SPARK_VERSION}" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$SPARK_VERSION      
      
ENV SPARK_HOME /usr/spark
ENV PATH="/usr/spark/bin:/usr/spark/sbin:${PATH}"
  
RUN apt-get update && \
    apt-get install -y wget netcat procps libpostgresql-jdbc-java && \
    wget -q "http://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop2.7.tgz" && \
    tar xzf "spark-${SPARK_VERSION}-bin-hadoop2.7.tgz" && \
    rm "spark-${SPARK_VERSION}-bin-hadoop2.7.tgz" && \
    mv "spark-${SPARK_VERSION}-bin-hadoop2.7" /usr/spark && \
    ln -s /usr/share/java/postgresql-jdbc4.jar /usr/spark/jars/postgresql-jdbc4.jar && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean

COPY entrypoint.sh /scripts/
RUN chmod +x /scripts/entrypoint.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["--help"]