FROM docker.io/s390x/clefos:latest

#Update OS Packages
RUN yum remove -y gunzip gzip zcat 
RUN yum clean packages && yum check-update
RUN yum upgrade -y 