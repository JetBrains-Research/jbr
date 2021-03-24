LABEL author = "Oleg Shpynov"
LABEL email = "os@jetbrains.com"

FROM ubuntu:20.04

RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-1.0.beta.5318.jar  --quiet -O jbr.jar

RUN set -e && mkdir /jbr_session

# JBR sessions should be located here
VOLUME ["/jbr_session"]

EXPOSE 5000

# JBR in server mode
ENTRYPOINT java -Xmx8G -jar jbr.jar --server --port 5000 --sessions /jbr_sessions
