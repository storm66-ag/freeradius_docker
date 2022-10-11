#
FROM ubuntu:20.04
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt -y  update && apt -y  upgrade
RUN apt -y install \
       git \
       apt-utils \
       devscripts \
       logrotate \
       freeradius \
       freeradius-postgresql \
       freeradius-mysql

#COPY freeradius-entrypoint.sh /usr/sbin/freeradius-entrypoint.sh
#RUN chmod 755 /sbin/freeradius-entrypoint.sh
EXPOSE 1812/udp 1813/udp 18120/udp
CMD freeradius -xX
#ENTRYPOINT ["/sbin/freeradius-entrypoint.sh"]
