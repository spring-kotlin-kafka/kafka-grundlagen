#  Lösung Zusatz Story 1

```yaml
version: '3.8'

services:
  kafka:
    image: apache/kafka:4.0.0
    hostname: kafka
    container_name: ch-open-workshop_kafka
    ports:
      - "9190:9190"       # External Kafka Port (Host)
    environment:
      KAFKA_NODE_ID: 1
      CLUSTER_ID: L4rE3vsnR1y1qu3AOgIDUg
      KAFKA_PROCESS_ROLES: broker,controller
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka:29093,2@kafka-2:29093
      KAFKA_LISTENERS: PLAINTEXT://kafka:29092,CONTROLLER://kafka:29093,EXTERNAL://:9190
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:29092,EXTERNAL://localhost:9190
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,EXTERNAL:PLAINTEXT,CONTROLLER:PLAINTEXT
      KAFKA_CONTROLLER_LISTENER_NAMES: CONTROLLER
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    restart: unless-stopped

  kafka-2:
    image: apache/kafka:4.0.0
    hostname: kafka-2
    container_name: ch-open-workshop_kafka-2
    ports:
      - "9195:9195"       # External Kafka Port (Host)
    environment:
      KAFKA_NODE_ID: 2
      CLUSTER_ID: L4rE3vsnR1y1qu3AOgIDUg
      KAFKA_PROCESS_ROLES: broker,controller
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka:29093,2@kafka-2:29093
      KAFKA_LISTENERS: PLAINTEXT://kafka-2:29092,CONTROLLER://kafka-2:29093,EXTERNAL://:9195
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka-2:29092,EXTERNAL://localhost:9195
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,EXTERNAL:PLAINTEXT,CONTROLLER:PLAINTEXT
      KAFKA_CONTROLLER_LISTENER_NAMES: CONTROLLER
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1
    restart: unless-stopped

  kafdrop:
    image: obsidiandynamics/kafdrop:latest
    container_name: ch-open-workshop_kafdrop
    restart: unless-stopped
    ports:
      - "9192:9000"
    environment:
      KAFKA_BROKERCONNECT: "kafka:29092"
      JVM_OPTS: "-Xms32M -Xmx64M"
    depends_on:
      - kafka

  kafka-init:
    image: apache/kafka:4.0.0
    depends_on:
      - kafka
    entrypoint: [ '/bin/sh', '-c' ]
    command: |
      "
      /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka:29092 --list

      echo -e 'Creating kafka topics'
      /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka:29092 --create --if-not-exists --topic my-first-topic --replication-factor 1 --partitions 1

      echo -e 'Successfully created the following topics:'
      /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka:29092 --list
      "
```