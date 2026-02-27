FROM eclipse-temurin:21-jre-alpine

LABEL author="Oleg Shpynov"
LABEL email="os@jetbrains.com"

RUN apk --no-cache add curl fontconfig ttf-dejavu

# Create non-root user and group
RUN addgroup -g 1000 jbr && \
    adduser -D -u 1000 -G jbr jbr

# Set working directory
WORKDIR /home/jbr

# Download JAR as root
RUN curl -o jbr.jar -L https://download.jetbrains.com/biolabs/jbr_browser/jar/jbr-2.0.6785.jar

# JBR sessions should be located here
RUN set -e && mkdir /jbr_sessions && chown jbr:jbr /jbr_sessions
VOLUME ["/jbr_sessions"]

# JBR log folder
RUN set -e && mkdir -p /jbr_logs && chown jbr:jbr /jbr_logs
VOLUME ["/jbr_logs"]

# JBR gemomes folder
RUN set -e && mkdir -p /home/jbr/.jbr_browser/genomes && chown jbr:jbr /home/jbr/.jbr_browser/genomes
VOLUME ["/home/jbr/.jbr_browser/genomes"]


# Change ownership of application files
RUN chown -R jbr:jbr /home/jbr

# Switch to non-root user
USER jbr

EXPOSE 5000

# JBR in server mode
ENTRYPOINT exec java -Xmx3G --add-modules=jdk.incubator.vector \
     -ea -XX:+UseCompressedOops \
     -XX:+HeapDumpOnOutOfMemoryError \
     -XX:ErrorFile=/jbr_logs/jbr_java_error%p.log \
     -XX:HeapDumpPath=/jbr_logs/jbr_java_error.hprof \
     -Djava.awt.headless=true \
     -jar jbr.jar --server --port 5000 --sessions /jbr_sessions --logs /jbr_logs
