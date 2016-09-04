FROM shuoshuo/gitbook-builder:latest
MAINTAINER Yan Fei <sksycribe.yf@gmail.com>

# Install build essential
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential protobuf-compiler wget curl

# Add plugin for protc-doc-gen
RUN wget http://download.opensuse.org/repositories/home:estan:protoc-gen-doc/Debian_8.0/Release.key && \
    apt-key add - < Release.key && \
    echo 'deb http://download.opensuse.org/repositories/home:/estan:/protoc-gen-doc/Debian_8.0/ /' >> /etc/apt/sources.list.d/protoc-gen-doc.list && \
    apt-get update && apt-get install protoc-gen-doc 

# Tune nodejs and npm to latest version
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - &&
    apt-get install -y nodejs

# Upgrade gitbook package to latest
RUN npm update -g gitbook-cli

RUN java -version
RUN make --version
RUN gitbook --version
RUN node --version
RUN protoc --version
RUN echo "done! "
