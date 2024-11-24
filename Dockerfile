FROM node:22

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y less nano neovim && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/*

RUN npm install --verbose -g hexo@7.3 && \
    mkdir /hexosite

COPY container-scripts/* /root
COPY HOWTO.md /root

RUN ln -s /root/HOWTO.md /root/README.md && \
    chmod 0755 /root/*.sh && \
    rm -rf /root/.npm/_logs/*

EXPOSE 4000/tcp

WORKDIR /hexosite

CMD [ "/bin/bash" ]
