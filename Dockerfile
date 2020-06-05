FROM docker.io/s390x/clefos:latest

#Update OS Packages
RUN yum upgrade -y && yum update -y && yum clean packages