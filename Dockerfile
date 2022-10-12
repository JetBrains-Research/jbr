# On Dockerhub, Ubuntu 20.04 LTS image is now the new Minimal Ubuntu image.
FROM ubuntu:20.04

LABEL author = "Oleg Shpynov"
LABEL email = "os@jetbrains.com"

# Install required packages and cleanup
RUN apt-get update && apt-get install -y wget openjdk-11-jre \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-1.0.5574.jar  --quiet -O jbr.jar

# JBR sessions should be located here
RUN set -e && mkdir /jbr_session
VOLUME ["/jbr_session"]

# JBR log folder
RUN set -e && mkdir -p /jbr_logs
VOLUME ["/jbr_logs"]

EXPOSE 5000

# JBR in server mode
ENTRYPOINT java -Xmx8G -jar jbr.jar --server --port 5000 --sessions /jbr_sessions --logs /jbr_logs
