## Prometheus Tutorial  Monitoring with Prometheus And Grafana  Prometheus Grafana Tutorial  Edureka

### [01:35] Agenda
### [01:55] 01.What is Prometheus?
- Application for event monitoring and alerting
- It records real-time metrics in a time series database built using a HTTP pull model
### [02:54] 02.Why Prometheus?
- Prometheus is a Pull-Based Tool
- Node Exporter, App Exporter
### [04:50] 03.Continuous Monitoring 
- Applications Exception, Memory Usage, Server CPU, Storage Spikes
### [05:50] 04.Prometheus Architecture
- ![architecture](Edureka_img/04.01.architecture.png)
- Push Gatewate
- Retrival: Pulls Metric Data, Data Retrieval Worker
- Storage: Stores Metric Data, Time Series Database
- HTTP Server: Accepts Queries, Accepts PromQL Queries
- Prometheus Web GUI
- Alet Manager

### [08:59] 05.Prometheus Metrics & Types
- Counters: Record a value that only goes up
  - Query how fast the value is increasing. 
- Gauges: Record a value that only goes up and down
  - You do not have to Query its rate
- Histogram: Take many measurements of a value, to later calculate averages or percentiles
  - You know what the range of values will be up front, so you can define your own
- Summary: Take many measurements of a value, to later calculate averages or percentiles
  - You don't know what the range of values will be up front, so you cannot use histograms
### [11:40] 06.Installation
1. mkdir & cd prome
2. https://prometheus.io/download/#prometheus
3. prometheus-2.40.3.linux-amd64.tar.gz -> "Copy link address"
4. wget https://github.com/prometheus/prometheus/releases/download/v2.40.3/prometheus-2.40.3.linux-amd64.tar.gz
5. tar -xvf prometheus-2.40.3.linux-amd64.tar.gz
6. cd prometheus-2.40.3.linux-amd64
7. vi prometheus.yml
8. ./prometheus	# Run Prometheus
9. http://192.168.56.51:9090
### [16:28] Create Service
1. sudo cp -r . /usr/local/bin/prometheus
2. sudo vi /etc/systemd/system/prometheus.service
```
[Unit]
Description=The Prometheus monitoring system and time series database.
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/prometheus/prometheus \
    --config.file=/etc/prometheus/prometheus.yml
[Install]
WantedBy=multi-user.target
```
3. sudo systemctl daemon-reload
4. sudo systemctl enable prometheus
5. sudo systemctl start prometheus
4. sudo systemctl status prometheus
-	ERROR

- vagrant up
- http://192.168.56.51:9090

### [18:58] User Interface
- http://192.168.56.51:9090
- http://192.168.56.51:9090/graph
- http://192.168.56.51:9090/alerts
- http://192.168.56.51:9090/tsdb-status

### [25:51] Metrics
- http://192.168.56.51:9090/metrics
