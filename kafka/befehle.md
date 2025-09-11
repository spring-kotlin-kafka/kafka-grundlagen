# Create topic

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9190 --create --topic my-first-topic
```

# List topic

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9190 --list
```

# Produce Event

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-producer.sh --bootstrap-server localhost:9190 --topic my-first-topic
```