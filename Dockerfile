FROM centos:8
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install httpd wget unzip -y
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip -O /var/www/html/oxer.zip
WORKDIR /var/www/html
RUN unzip oxer.zip
RUN cp -rvf oxer-html/* .
RUN rm -rf MACOSX oxer-html oxer.zip 
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
