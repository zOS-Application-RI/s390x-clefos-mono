FROM docker.io/s390x/clefos:latest

#Update OS Packages
ENV         container docker

RUN        yum install -y --setopt=tsflags=nodocs systemd && \
    yum clean all && \
    rm -rf /var/cache/yum/* /tmp/* /var/log/yum.log

RUN         (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME         ["/sys/fs/cgroup"]

CMD         ["/usr/sbin/init"]

#RUN yum remove -y gunzip gzip zcat 
#RUN yum check-update
RUN sudo yum install deltarpm
RUN sudo yum upgrade -y 