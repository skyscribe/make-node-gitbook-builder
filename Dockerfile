FROM shuoshuo/gitbook-builder:latest
MAINTAINER Yan Fei <sksycribe.yf@gmail.com>

# Install build essential
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential

RUN echo "done!"
