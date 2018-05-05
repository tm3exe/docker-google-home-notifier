FROM armhf/debian
RUN apt-get update
RUN apt-get -y install\
               git-core\
               libnss-mdns\
               libavahi-compat-libdnssd-dev\
               gnupg2\
               curl\
               gcc\
               g++\
               python\
               make
RUN apt-get purge nodejs
RUN curl -sL https://deb.nodesource.com/setup_7.x | /bin/bash -
RUN apt-get install -y nodejs

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT /usr/local/bin/entrypoint.sh
EXPOSE 8091
