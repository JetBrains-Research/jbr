FROM amazoncorretto:21-alpine

LABEL author="Oleg Shpynov"
LABEL email="os@jetbrains.com"

RUN apk --no-cache add curl

RUN curl -o jbr.jar -L https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-2.0.6632.jar

# JBR sessions should be located here
RUN set -e && mkdir /jbr_sessions
VOLUME ["/jbr_sessions"]

# JBR log folder
RUN set -e && mkdir -p /jbr_logs
VOLUME ["/jbr_logs"]

EXPOSE 5000

# JBR in server mode
ENTRYPOINT java -jar jbr.jar --server --port 5000 --sessions /jbr_sessions --logs /jbr_logs
