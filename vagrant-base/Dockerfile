FROM ubuntu:14.04

# Install dev tools: jdk, git, etc...
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y -q build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config libmysqlclient-dev libpq-dev make wget unzip git vim nano nodejs mysql-client mysql-server gawk libgdbm-dev libffi-dev

# jdk7 is the default jdk
#RUN ln -fs /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java /etc/alternatives/java

# install vertx
#RUN \
#	mkdir -p /usr/local/vertx && cd /usr/local/vertx && \
#	wget https://bintray.com/artifact/download/vertx/downloads/vert.x-2.1.5.tar.gz -qO - | tar -xz

# Add vertx to the path
#ENV PATH /usr/local/vertx/vert.x-2.1.5/bin:$PATH

#RUN mkdir -p /usr/local/src
#WORKDIR /usr/local/src

CMD ["bash"]