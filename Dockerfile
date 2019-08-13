FROM docker.mxnavi.com:5000/mx-nginx
MAINTAINER devops-plugin daigong@meixing.com
ADD docker/start.sh /
RUN chmod +x /start.sh
COPY dist/* /usr/share/nginx/mx-web/
COPY docker/mx-nginx.conf /etc/nginx/sites-enabled/
EXPOSE 80
