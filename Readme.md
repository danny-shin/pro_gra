# Prometheus & Grafana
## HANDS-ON INFRASTRUCTURE MONITORING WITH PROMETHEUS - Packt 2019
- git clone https://github.com/PacktPublishing/Hands-On-Infrastructure-Monitoring-with-Prometheus.git

## Ch.03 
- vagrant status
- vagrant status NAME
- vagrant destroy
- vagrant destroy -f
- vagrant up --no-provision

- vagrant ssh prometheus 
- sudo -i 

- Prometheus: http://192.168.56.51:9090/targets
- Grafana: http://192.168.56.52:3000
  - admin / 123456
- Alertmanater: http://192.168.56.53:9093

### [node-exporter](https://prometheus.io/docs/guides/node-exporter/)



---------------------------------------------------------
## [Grafana](https://grafana.com/)
- [Download](https://grafana.com/grafana/download)
- [Document](https://grafana.com/docs/grafana/latest/)

## Ubuntu 
- sudo apt-get install -y adduser libfontconfig1
- wget https://dl.grafana.com/enterprise/release/grafana-enterprise_9.2.5_amd64.deb
- sudo dpkg -i grafana-enterprise_9.2.5_amd64.deb

- Docker(Alpine base image): Lightweight Docker container image using an Alpine base image.
  - docker run -d --name=grafana -p 3000:3000 grafana/grafana-enterprise
- Docker(Ubuntu base image): Alternative Docker container image for those who prefer an Ubuntu base image.
  - docker run -d --name=grafana -p 3000:3000 grafana/grafana-enterprise:9.2.5-ubuntu

### init user/pw admin/admin
- admin / 123456

### Config file
- /etc/grafana/grafana.ini 

### Paths 
- data /var/lib/grafana
- logs /var/log/grafana
- plugins /var/lib/grafana/plugins
- provisioning /etc/grafana/provisioning

### Environment variable 
- GF_<SectionName>_<KeyName>

-----------------------------------------------
- MQTT
- InfluxDB vs OpenTSDB