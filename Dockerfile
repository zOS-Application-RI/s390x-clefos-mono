# FROM docker.io/s390x/clefos:latest

# #Update OS Packages
# ENV         container docker

# RUN        yum install -y --setopt=tsflags=nodocs systemd && \
#     yum clean all && \
#     rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

# RUN         (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#     rm -f /lib/systemd/system/multi-user.target.wants/*;\
#     rm -f /etc/systemd/system/*.wants/*;\
#     rm -f /lib/systemd/system/local-fs.target.wants/*; \
#     rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#     rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#     rm -f /lib/systemd/system/basic.target.wants/*;\
#     rm -f /lib/systemd/system/anaconda.target.wants/*;

# VOLUME         ["/sys/fs/cgroup"]

# CMD         ["/usr/sbin/init"]

# #RUN yum remove -y gunzip gzip zcat 
# #RUN yum check-update
# RUN yum install -y
# RUN yum upgrade -y 
FROM debian:stretch-slim

# MAINTAINER Jo Shields <jo.shields@xamarin.com>
# MAINTAINER Alexander Köplinger <alkpli@microsoft.com>

ENV MONO_VERSION 6.8.0.96

RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg dirmngr \
    && rm -rf /var/lib/apt/lists/* \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && gpg --batch --export --armor 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF > /etc/apt/trusted.gpg.d/mono.gpg.asc \
    && gpgconf --kill all \
    && rm -rf "$GNUPGHOME" \
    && apt-key list | grep Xamarin \
    && apt-get purge -y --auto-remove gnupg dirmngr

RUN echo "deb http://download.mono-project.com/repo/debian stable-stretch/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official-vs.list \
    && apt-get update \
    && apt-get install -y mono-runtime \
    && rm -rf /var/lib/apt/lists/* /tmp/*