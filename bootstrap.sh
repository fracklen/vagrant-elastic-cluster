#!/usr/bin/env bash
if [ ! -f '/usr/share/elasticsearch/bin/elasticsearch' ]; then
    apt-get update
    apt-get upgrade
    # install openjdk-7
    #apt-get purge openjdk*
    apt-get -y install openjdk-7-jdk
    # install ES
    wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
    echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" > /etc/apt/sources.list.d/elasticsearch-2.x.list
    apt-get update && apt-get install -y elasticsearch
    update-rc.d elasticsearch defaults 95 10
    /etc/init.d/elasticsearch start
fi

cat > /etc/elasticsearch/elasticsearch.yml <<EOF
network.bind_host: _eth1_
network.publish_host: _eth1_
network.host: _eth1_
cluster.name: vagrant-es-cluster
node.name: $(hostname)
discovery.zen.ping.multicast.enabled: false
discovery.zen.ping.unicast.hosts: ['192.168.99.11','192.168.99.12','192.168.99.13','192.168.99.14','192.168.99.15']
http.cors.enabled: true
http.cors.allow-origin: /https?:\/\/.*/

threadpool.bulk.type: fixed
threadpool.bulk.size: 3
threadpool.bulk.queue_size: 500
EOF

cat > /etc/default/elasticsearch <<EOF
ES_HEAP_SIZE=512m
ES_STARTUP_SLEEP_TIME=5
EOF

if [ ! -d '/usr/share/elasticsearch/plugins/hq' ]; then
    /usr/share/elasticsearch/bin/plugin install royrusso/elasticsearch-HQ
fi

/etc/init.d/elasticsearch restart

cat > /usr/local/bin/oom_exclude_elasticsearch <<EOF
#!/usr/bin/env bash
echo -17 > /proc/$(pgrep -f /usr/bin/java)/oom_score_adj
EOF
chmod a+x /usr/local/bin/oom_exclude_elasticsearch

cat > /etc/cron.d/oom_exclude_elasticsearch <<EOF
*/1 * * * * root /usr/local/bin/oom_exclude_elasticsearch
EOF
