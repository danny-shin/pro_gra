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
- https://prometheus.io/download/
- wget https://github.com/prometheus/prometheus/releases/download/v2.40.3/prometheus-2.40.3.darwin-amd64.tar.gz