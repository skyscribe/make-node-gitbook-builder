FROM shuoshuo/gitbook-builder:latest
MAINTAINER Yan Fei <sksycribe.yf@gmail.com>

# Install build essential
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential protobuf-compiler wget

# Add plugin for protc-doc-gen
RUN wget http://download.opensuse.org/repositories/home:estan:protoc-gen-doc/Debian_8.0/Release.key && \
    apt-key add - < Release.key && \
    echo 'deb http://download.opensuse.org/repositories/home:/estan:/protoc-gen-doc/Debian_8.0/ /' >> /etc/apt/sources.list.d/protoc-gen-doc.list && \
    apt-get update && apt-get install protoc-gen-doc

RUN java -version
RUN make --version
RUN gitbook --version
RUN protoc --version
RUN echo "done! "
