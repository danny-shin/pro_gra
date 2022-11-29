FROM prom/prometheus
# ADD ../configs/prometheus/prometheus.yml /etc/prometheus/
COPY ../configs/prometheus/prome1.yml /etc/prometheus/prometheus.yml
