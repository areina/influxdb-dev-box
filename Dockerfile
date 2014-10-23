FROM ubuntu

RUN apt-get -y -q update && apt-get -y -q install mercurial bzr \
    protobuf-compiler flex bison valgrind g++ make autoconf libtool libz-dev \
    libbz2-dev curl rpm build-essential git wget gawk openssh-server augeas-tools

RUN mkdir /var/run/sshd
RUN augtool --autosave "set /files/etc/ssh/sshd_config/PermitEmptyPasswords yes"

RUN groupadd vagrant
RUN useradd vagrant -m -g vagrant -s /bin/bash
RUN sed -i "s/vagrant\:\!/vagrant\:U6aMy0wojraho/" /etc/shadow #empty password for vagrant

USER vagrant

RUN ["/bin/bash", "-c", "bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)"]
RUN ["/bin/bash", "-c", "source /home/vagrant/.gvm/scripts/gvm && gvm install go1.3"]
RUN ["/bin/bash", "-c", "source /home/vagrant/.gvm/scripts/gvm && gvm use go1.3 --default"]
RUN echo "export GOPATH=$HOME/gocodez" >> /home/vagrant/.bashrc

USER root
