#!/bin/bash



sudo apt-get update
sudo apt-get install default-jre -Y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
sudo apt update && sudo apt install elasticsearch kibana logstash
sudo systemctl start elasticsearch.service
sudo nano /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch.service
sudo systemctl enable elasticsearch.service
sudo curl -XGET 'localhost:9200/'
sudo systemctl start logstash.service
sudo nano /etc/kibana/kibana.yml
sudo systemctl start kibana.service
sudo systemctl enable kibana.service

sudo cp /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch_old.yml
sudo sed 's/#network.host: 0.0.0.0/network.host: 0.0.0.0/' /etc/elasticsearch/elasticsearch.yml > /etc/elasticsearch/elasticsearch.yml

sudo systemctl restart elasticsearch.service
sudo systemctl start elasticsearch.service
sudo systemctl enable elasticsearch.service


sudo cp /etc/kibana/kibana.yml /etc/kibana/kibana_old.yml
sudo sed 's/#server.host:"0.0.0.0"/server.host:"0.0.0.0"/' /etc/kibana/kibana.yml > /etc/kibana/kibana.yml

sudo systemctl restart kibana.service
sudo systemctl start kibana.service
sudo systemctl enable kibana.service
