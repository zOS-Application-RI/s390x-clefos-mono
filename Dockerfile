FROM docker.io/s390x/clefos:latest

# #Update OS Packages
RUN yum remove gzip-1.10-3.68.el7.s390x

# ENV         container docker
# RUN yum update -y --assumeyes --skip-broken && \
#     yum clean all

# RUN rpmkeys --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x3fa7e0328081bff6a14da29aa6a19b38d3d831ef"
# RUN su -c 'curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo'
# RUN yum install mono-devel
