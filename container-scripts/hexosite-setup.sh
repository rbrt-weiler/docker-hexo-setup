#!/bin/sh

cd /hexosite && \
hexo init . && \
npm install --verbose --save hexo-deployer-ftpsync && \
npm install --verbose --save hexo-deployer-shell && \
npm install --verbose --save hexo-feed && \
npm install --verbose --save hexo-generator-readtime && \
npm install --verbose --save hexo-generator-sitemap && \
npm install --verbose --save hexo-insert-toc && \
npm install --verbose --save hexo-nanoid

# Configure Hexo FTP Deployer --> https://hexo.io/docs/one-command-deployment#FTPSync
# Configure Hexo Shell Deployer --> https://github.com/HakurouKen/hexo-deployer-shell
# Configure Hexo Feed --> https://github.com/sergeyzwezdin/hexo-feed
# Configure and use Hexo Readtime --> https://github.com/AsemAlhaidary/hexo-generator-readtime
# Configure Hexo Sitemap --> https://github.com/hexojs/hexo-generator-sitemap
# Configure and use Hexo Insert TOC --> https://github.com/bennycode/hexo-insert-toc
# Configure and use Hexo NanoID --> https://github.com/cowsay-blog/hexo-nanoid
