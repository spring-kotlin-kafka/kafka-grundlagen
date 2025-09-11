#  Lösung Story 3

## Event (Nachricht) an Topic senden

```bash
echo "Hello Kafka" | docker exec -i ch-open-workshop_kafka /opt/kafka/bin/kafka-console-producer.sh --topic my-first-topic --bootstrap-server kafka:29092
```

## Mehrere Events (Nachrichten) an Topic senden

```bash
printf "Nachricht 1\nNachricht 2\n" | docker exec -i ch-open-workshop_kafka /opt/kafka/bin/kafka-console-producer.sh --topic my-first-topic --bootstrap-server kafka:29092
```
