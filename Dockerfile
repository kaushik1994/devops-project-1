FROM devopsedu/webapp
RUN rm -rf /var/www/html/*
COPY website /var/www/html
CMD apachectl -D FOREGROUND