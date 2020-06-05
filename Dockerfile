FROM docker.io/s390x/clefos:latest

# #Update OS Packages
ENV         container docker
RUN yum update --assumeyes --skip-broken && \
    yum install --assumeyes centos-release-SCL gettext tar which && \
    yum install --assumeyes ruby193 ruby193-ruby-devel \
    gcc-c++ automake autoconf curl-devel openssl-devel \
    zlib-devel libxslt-devel libxml2-devel \
    mysql-libs mysql-devel postgresql-devel sqlite-devel \
    nodejs010-nodejs && \
    yum clean all




RUN rpmkeys --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x3fa7e0328081bff6a14da29aa6a19b38d3d831ef"
RUN su -c 'curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo'
RUN yum install mono-devel
