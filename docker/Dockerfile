FROM ubuntu:16.04

MAINTAINER homer

RUN mkdir -p /home

WORKDIR /opt

RUN echo && cd /home  \
    && apt-get update \
    && apt-get install -y python2.7 curl git vim \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python2.7 get-pip.py \
    && pip install oss2 \
    && pip install robotframework==3.0.4 \
    && pip install pymysql requests PyExecJS PyChromeDevTools bs4\
    && pip install robotframework-selenium2library==3.0.0 robotframework-seleniumlibrary==3.2.0 \
    && apt-get install -y wget curl libxss1 libappindicator1 libindicator7 fonts-liberation libasound2 libnspr4 libnss3 lsb-release xdg-utils \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && apt-get -y install fontconfig xfonts-utils \
    && apt-get install -y fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming

RUN mkdir -p ~/.ssh && mkdir -p /usr/share/zoneinfo/Asia

COPY /chromedriver /usr/local/bin
COPY /run_develop_in_docker.sh /opt/
COPY /run_master_in_docker.sh /opt/
COPY /run_release_in_docker.sh /opt/
COPY /id_rsa /root/.ssh/id_rsa
COPY /known_hosts /root/.ssh/known_hosts
COPY /Shanghai /usr/share/zoneinfo/Asia/Shanghai

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["sh", "-c", "/opt/run_in_docker.sh"]