FROM eclipse-temurin:17-jdk

RUN apt-get update \
 && apt-get install -y curl unzip zip ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ARG GRAILS_VERSION=7.0.4

RUN curl -fsSL -o /tmp/grails.zip \
      "https://downloads.apache.org/grails/core/${GRAILS_VERSION}/distribution/apache-grails-${GRAILS_VERSION}-bin.zip" \
 && unzip -q /tmp/grails.zip -d /opt \
 && rm /tmp/grails.zip \
 && GRAILS_HOME="$(find /opt -maxdepth 1 -type d -name '*grails*' | grep "${GRAILS_VERSION}" | head -n 1)" \
 && ln -s "$GRAILS_HOME" /opt/grails

ENV PATH="/opt/grails/bin:${PATH}"

WORKDIR /work

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
