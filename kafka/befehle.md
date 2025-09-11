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

# Consume Event

## From current offeset

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9190 --topic my-first-topic --group mygroup
```

## From beginning

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9190 --topic my-first-topic --group mygroup1 --from-beginning
```