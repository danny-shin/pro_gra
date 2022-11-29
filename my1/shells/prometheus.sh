#!/usr/bin/env bash
set -e

source /vagrant/utils/version.sh
source /vagrant/utils/helpers.sh

check_requirements curl tar

ARCHIVE="prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz"
if ! check_cache "${ARCHIVE}"; then
  get_archive "https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/${ARCHIVE}"
fi

if ! id prometheus > /dev/null 2>&1 ; then
  useradd --system prometheus
fi

TMPD=$(mktemp -d)
tar zxf "${CACHE_PATH}/${ARCHIVE}" -C $TMPD --strip-components=1

### install - copy files and set attributes
# -d, --directory : treat all arguments as directory names; create all components of the specified directories
# -D : create all leading components of DEST except the last, or all components of --target-directory, then  copy    
# -g, --group=GROUP : set group ownership, instead of process' current group
# -m, --mode=MODE : set permission mode (as in chmod), instead of rwxr-xr-x
# -o, --owner=OWNER : set ownership (super-user only)
# -t, --target-directory=DIRECTORY : copy all SOURCE arguments into DIRECTORY
install -m 0644 -D -t /usr/share/prometheus/consoles $TMPD/consoles/*
install -m 0644 -D -t /usr/share/prometheus/console_libraries $TMPD/console_libraries/*
install -m 0755 $TMPD/prometheus $TMPD/promtool /usr/bin/
install -d -o prometheus -g prometheus /var/lib/prometheus
install -m 0644 /vagrant/configs/prometheus/prometheus.service /etc/systemd/system/
install -m 0644 -D /vagrant/configs/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
# install -m 0644 -D /vagrant/configs/prometheus/first_rules.yml /etc/prometheus/first_rules.yml

systemctl daemon-reload
systemctl enable prometheus
systemctl start prometheus
