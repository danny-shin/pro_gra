### Node-exporter
- https://prometheus.io/download/
- wget https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.linux-amd64.tar.gz
- tar xzf node_exporter-1.4.0.linux-amd64.tar.gz
- ls node_exporter-1.4.0.linux-amd64
- sudo cp node_exporter-1.4.0.linux-amd64/node_exporter /usr/local/bin
- ls /usr/local/bin
- sudo vi /etc/systemd/system/node-exporter.service
- sudo systemctl daemon-reload
- sudo systemctl start node-exporter
- http://192.168.56.51:9100
- cd /usr/local/bin
- cd prometheus
- sudo vi prometheus.yml 
```
  - job_name: 'node'
    static_configs:
    - targets:
      - 'prometheus:9100' 
```		
### docker-compose 	
- prometheus_http_requests_total
- prometheus_http_request_duration_seconds_count
### https://prometheus.io/docs/prometheus/latest/getting_started/
# Start Prometheus.
# By default, Prometheus stores its database in ./data (flag --storage.tsdb.path).
./prometheus --config.file=prometheus.yml

### [Add targets](https://prometheus.io/docs/prometheus/latest/getting_started/#starting-up-some-sample-targets)
tar -xzvf node_exporter-*.*.tar.gz
cd node_exporter-*.*

# Start 3 example targets in separate terminals:
./node_exporter --web.listen-address 127.0.0.1:8080
./node_exporter --web.listen-address 127.0.0.1:8081
./node_exporter --web.listen-address 127.0.0.1:8082


- [prom/node-exporter](https://hub.docker.com/r/prom/node-exporter)

- Windows docker Cannot start service Ports are not available: exposing port TCP
- ERROR: for node_export  Cannot start service node_export: Ports are not available: exposing port TCP 0.0.0.0:9100 -> 0.0.0.0:0: listen tcp 0.0.0.0:9100: b
- net stop winnat
- net start winnat
- Prometheus http://localhost:9090/
- Node-Exporter http://localhost:8080/metrics

### [Configure Prometheus to monitor the sample targets](https://prometheus.io/docs/prometheus/latest/getting_started/#configure-prometheus-to-monitor-the-sample-targets)
- prometheus.yml
```
scrape_configs:
  - job_name:       'node'

    # Override the global default and scrape targets from this job every 5 seconds.
    scrape_interval: 5s

    static_configs:
      - targets: ['localhost:8080', 'localhost:8081']
        labels:
          group: 'production'

      - targets: ['localhost:8082']
        labels:
          group: 'canary'
```
### [Configure rules for aggregating scraped data into new time series](https://prometheus.io/docs/prometheus/latest/getting_started/#configure-rules-for-aggregating-scraped-data-into-new-time-series)
- avg by (job, instance, mode) (rate(node_cpu_seconds_total[5m]))
- prometheus.rules.yml:
```
groups:
- name: cpu-node
  rules:
  - record: job_instance_mode:node_cpu_seconds:avg_rate5m
    expr: avg by (job, instance, mode) (rate(node_cpu_seconds_total[5m]))
```		
- job_instance_mode:node_cpu_seconds:avg_rate5m

### prometheus Get /metrics: dial tcp connect: connection refused
You need to access them through the host private IP or by replacing localhost with host.docker.internal.