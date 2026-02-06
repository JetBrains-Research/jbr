FROM eclipse-temurin:21-jre-alpine

LABEL author="Oleg Shpynov"
LABEL email="os@jetbrains.com"

RUN apk --no-cache add curl fontconfig ttf-dejavu

RUN curl -o jbr.jar -L https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-2.0.6765.jar

# JBR sessions should be located here
RUN set -e && mkdir /jbr_sessions
VOLUME ["/jbr_sessions"]

# JBR log folder
RUN set -e && mkdir -p /jbr_logs
VOLUME ["/jbr_logs"]

EXPOSE 5000

# JBR in server mode
ENTRYPOINT exec java -Xmx3G --add-modules=jdk.incubator.vector \
     -Djdk.attach.allowAttachSelf -Djol.magicFieldOffset=true -XX:+EnableDynamicAgentLoading \
     -ea -XX:+UseCompressedOops \
     -XX:+HeapDumpOnOutOfMemoryError \
     -XX:ErrorFile=/jbr_logs/jbr_java_error%p.log \
     -XX:HeapDumpPath=/jbr_logs/jbr_java_error.hprof \
     -Djava.awt.headless=true -jar jbr.jar --server --port 5000 --sessions /jbr_sessions --logs /jbr_logs
