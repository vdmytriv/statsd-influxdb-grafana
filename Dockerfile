FROM ubuntu:16.04

# prerequisites dependencies
RUN     apt-get -y update
RUN     apt-get upgrade -y
RUN     apt-get -y install software-properties-common
RUN     add-apt-repository -y -r ppa:chris-lea/node.js
RUN     rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list
RUN     apt-get -y update
RUN     apt-get -y install supervisor nginx-light nodejs git wget sudo adduser libfontconfig curl npm 
RUN     apt-get -y install tcpdump ngrep

RUN npm install --production
RUN mv ./node_modules ./node_modules.tmp && mv ./node_modules.tmp ./node_modules && npm install
# RUN cd $(npm root -g)/npm && npm install fs-extra && sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

# install grafana
RUN     wget https://grafanarel.s3.amazonaws.com/builds/grafana_4.1.2-1486989747_amd64.deb
RUN     dpkg -i grafana_4.1.2-1486989747_amd64.deb

# install influxdb
RUN 	wget https://dl.influxdata.com/influxdb/releases/influxdb_1.2.0_amd64.deb
RUN 	sudo dpkg -i influxdb_1.2.0_amd64.deb

# install statsd
RUN 	git clone https://github.com/etsy/statsd.git /src/statsd   && \
        cd /src/statsd                                             && \
        git checkout v0.8.0
RUN     npm install https://github.com/vdmytriv/statsd-influxdb-backend -d


#EXPOSE 8083
#EXPOSE 8086
EXPOSE 8125/udp
#EXPOSE 8126
#EXPOSE 3000

# configure
ADD ./influxdb/influxdb.conf /etc/influxdb/influxdb-custom.conf
ADD ./influxdb/create-metrics-db.sh /src/create-metrics-db.sh
ADD ./statsd/config.js /src/statsd/config.js
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
