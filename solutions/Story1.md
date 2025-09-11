# Story 1 Lösung

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
            CLUSTER_ID: L4rE3vsnR1y1qu3AOgIDUg # Unique ID of the cluster (random Base64-codierte UUID mit 16 Bytes Länge)
            KAFKA_NODE_ID: 1 # ID of the broker
            KAFKA_PROCESS_ROLES: broker,controller # Roles of the broker (broker: Speicherung von Nachrichten & Kommunikation mit Clients, Roles of controller: Cluster-Koordination & Metadaten-Verwaltung)
            KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT # Name verwendet für den Broker Listener (PLAINTEXT:...)
            KAFKA_CONTROLLER_LISTENER_NAMES: CONTROLLER # Name verwendet für den Controller Listener (CONTROLLER:...)
            KAFKA_LISTENERS: PLAINTEXT://kafka:29092,CONTROLLER://kafka:29093,EXTERNAL://:9190 # Internal Broker & Controller Port, External Port
            KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka:29092,EXTERNAL://localhost:9190 # Internal Broker Port, External Port
            KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka:29093 # Gruppe von Wählern, welche Entscheide im Cluster trifft (z.B. Leader Election)
            KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: PLAINTEXT:PLAINTEXT,EXTERNAL:PLAINTEXT,CONTROLLER:PLAINTEXT # Security Protocols prop Listener
            KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1 # Anzahl Kopien (Replikate) des Offset Topics im Kafka-Cluster
        restart: unless-stopped
```