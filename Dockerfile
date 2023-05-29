FROM --platform=linux/amd64 amazonlinux:2 AS base

RUN yum install -y gcc openssl11-devel bzip2-devel libffi-devel tar gzip wget make
RUN wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tgz && \
    tar xzf Python-3.9.13.tgz && \
    cd Python-3.9.13 && \
    ./configure --enable-optimizations && \
    make install
    
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV --copies
RUN cp -r /usr/local/lib/python3.9/* $VIRTUAL_ENV/lib/python3.9/

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install venv-pack==0.2.0

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"] 
