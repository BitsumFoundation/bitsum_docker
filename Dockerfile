FROM ubuntu:18.04
LABEL Author="Dmitry Tarasov <4egod@bitsum.uz>"

ENV NODE_VERSION=1.18.11.5
ENV NODE_ZIP=node_linux.zip
ENV NODE_SRC=https://github.com/BitsumFoundation/bitsum_core/releases/download/v${NODE_VERSION}/${NODE_ZIP}

RUN apt-get -yq update && \
    apt-get -y upgrade && \
    apt-get autoclean autoremove -yq && \
    apt-get clean -yq

RUN apt-get -y install wget unzip

RUN mkdir -p /root/.bitsum/ && \
    cd /root/.bitsum/ && \
    wget -q ${NODE_SRC} && \
    unzip ${NODE_ZIP} && \
    chmod +x bitsumd && \
    rm -f ${NODE_ZIP}

WORKDIR /root/.bitsum
VOLUME ["/root/.bitsum"]    
EXPOSE  28080 28081
CMD ["bitsumd"]
ENTRYPOINT ./bitsumd --daemon-rpc-bind-address=0.0.0.0:28081