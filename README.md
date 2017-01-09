# oVirt-Kibana


# Description
oVirt-Kibana is a container solution to quickly get a deeper look into an existing [ovirt-engine][ovirt]
setup using the [elk stack][elk]. It supplies a pre-configured [logstash] configuration
file and a ready to use kibana visualization configuration file to get immediate visualization of the logs.

# Install
- Clone it to ovirt-engine machine
```
git clone git@github.com:rgolangh/ovirt-kibana.git
cd ovirt-kibana
docker build .
```
- Set the vm.max_map_count high enough for [Elasticsearch][elastic]
```
sudo sysctl vm.max_map_count=262144
```

# Start it
```
docker-compose up
```
- Wait till the console would show Elasticsearch loads
- set kibana's index
```
curl -XPUT http://localhost:9200/.kibana/index-pattern/*metadata* -d '{"title" : "*metadata*",  "timeFieldName": "@timestamp"}'
curl -XPUT http://localhost:9200/.kibana/config/5.0.1 -d '{"defaultIndex" : "*metadata*"}'
 ```
- Browse to http://127.0.0.1:5601
- Import [kibana] settings from the file under the repo
  - Go to `Visualize` (to the left on the newer theme)
  - Click `Manage Visualizations` on the right
  - Import the file 'ovirt-engine-kibana-export.json'


[ovirt]: https://www.ovirt.org/
[elk]: https://www.google.co.il/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjUiJGY1LLRAhUHahoKHanuAv8QFggnMAA&url=https%3A%2F%2Felk-docker.readthedocs.io%2F&usg=AFQjCNHKHyjpB7Y-2kfWWOLaWT01t7EQlA&sig2=KVJox-8UsuFoa6DEweiDaQ
[elastic]: https://www.elastic.co/
[kibana]: https://www.elastic.co/products/kibana
[logstash]: https://www.elastic.co/products/logstash
