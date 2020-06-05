FROM docker.io/s390x/clefos:latest

#Update OS Packages
RUN yum update -y && yum upgrade -y && yum clean packages