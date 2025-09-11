#  Lösung Story 4

## Nachrichten ab dem aktuellen Zeitstempel lesen (alte Nachrichten ignorieren)

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-consumer.sh --topic my-first-topic --bootstrap-server kafka:29092 --group mygroup2
```

## Alle von Anfang an lesen

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-consumer.sh --topic my-first-topic --bootstrap-server kafka:29092 --group mygroup --from-beginning
```

## Aktuellen Offset herausfinden
```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server kafka:29092 --describe --group mygroup
```

## Aktuellen Offset herausfinden
```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server kafka:29092 --describe --group mygroup
```

## Offset der Gruppe zurücksetzen
```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server kafka:29092 --group mygroup2 --topic my-first-topic --reset-offsets --to-earliest --execute
```

## Consumer Groups auflisten
````bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-consumer-groups.sh --bootstrap-server kafka:29092 --list
````
