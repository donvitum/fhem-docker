FROM nginx

# RUN rm -rf /etc/nginx
# COPY ./conf /etc/nginx
COPY nginx.conf /etc/nginx/
COPY nginx-secure.conf /etc/nginx/

COPY dhparams.pem /etc/nginx/

COPY start.sh /

CMD /start.sh


