### [mysqld_exporter](https://github.com/prometheus/mysqld_exporter)
```
CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'XXXXXXXX' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
```
### [Install and Configure Prometheus MySQL Exporter](https://www.devopsschool.com/blog/install-and-configure-prometheus-mysql-exporter/)

### [prom/mysqld-exporter](https://registry.hub.docker.com/r/prom/mysqld-exporter/)
```
CREATE USER 'exporter'@'localhost' IDENTIFIED BY '12345_Abc';
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'localhost';
GRANT SELECT ON performance_schema.* TO 'exporter'@'localhost';
FLUSH PRIVILEGES;
```
```
  mysql8: 
    image: prom/mysqld-exporter
    environment:
      - DATA_SOURCE_NAME=exporter:12345_Abc@(host.docker.internal:3306)/
    #  - DATA_SOURCE_NAME='exporter:12345_Abc@(192.168.0.15:3306)/'
    ports:
      - 9104:9104
    container_name: mysql_container
```
- https://github.com/prometheus/mysqld_exporter
```
    - job_name: mysql # To get metrics about the mysql exporter’s targets
      params:
        # Not required. Will match value to child in config file. Default value is `client`.
        auth_module: client.servers
      static_configs:
        - targets:
          # All mysql hostnames to monitor.
          - server1:3306
          - server2:3306
      relabel_configs:
        - source_labels: [__address__]
          target_label: __param_target
        - source_labels: [__param_target]
          target_label: instance
        - target_label: __address__
          # The mysqld_exporter host:port
          replacement: localhost:9104
```
## [mysql-exporter example rule](https://github.com/prometheus/mysqld_exporter/tree/main/mysqld-mixin)
$ go get github.com/monitoring-mixins/mixtool/cmd/mixtool
$ go get github.com/google/go-jsonnet/cmd/jsonnetfmt

## [Prometheus Monitoring Mixins](https://github.com/monitoring-mixins/docs)

mysql db size 
table size 

select count(*) from information_schema.tables;

SELECT	
	table_schema as db_name, 
	table_name as table_name,
	table_rows, 
  round((data_length + index_length) / 1024 / 1024) as size_mb
FROM	information_schema.tables
WHERE	table_schema like 'gpsv3_%'
ORDER BY table_rows DESC;

select * from information_schema.tables;

SELECT * 
FROM	information_schema.TABLES
WHERE	table_schema like 'gpsv3_%';