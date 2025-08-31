# Aufgaben: Kafka Grundlagen

In diesem Modul werden wir die Grundlagen von Kafka kennenlernen und Kafka lokal mit Docker aufsetzen, um erste Producer und Consumer zu schreiben.

-> Theorie-Teil Kafka-Grundlagen

## Story 1: Kafka lokal aufsetzen

Als Entwickler möchte ich Kafka lokal schnell und einfach aufsetzen können, **um einen persönlichen Kafka-Cluster für die Entwicklung zu nutzen**.

### Akzeptanzkriterien
- [ ] Docker mit Docker Compose Plugin ist installiert (Vorbedingung)
- [ ] Eine `docker-compose.yaml` wird erstellt, die einen Kafka-Cluster mit einem ersten Broker auf Port `9190` startet
- [ ] Die `docker-compose.yaml` wird entsprechend erweitert,
    - dass der Broker als Controller (Port 29093) und Broker (Port 29092) fungiert
    - und sowohl innerhalb von Docker (PLAINTEXT),
    - wie auch ausserhalb (EXTERNAL) erreichbar ist

## Story 2: Kafka Topics erstellen, schreiben und lesen

Als Entwickler möchte ich Kafka-Topics initial erstellen, **um mit ihnen arbeiten zu können**.

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-topics.sh --help | grep topic
```

### Akzeptanzkriterien
- [ ] Mit `kafka-topics` können bestehende Topics ausgelesen werden
- [ ] Mit `kafka-topics` wird ein Topic mit dem Namen `my-first-topic` erstellt
    - Replikations-Faktor: 1
    - Partionenen: 1
- [ ] Die `docker-compose.yaml` wird erweitert, sodass das gewünschte Topic `my-first-topic` initial erstellt wird

-> Theorie-Teil Kafka-Producer

## Story 3: In Kafka Topic schreiben

Als Entwickler möchte ich Nachrichten in ein Kafka-Topic schreiben, **um erste Events zu erzeugen**.

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-producer.sh --help
```

### Akzeptanzkriterien
- [ ] Mit `kafka-console-producer` können Nachrichten ins Topic ``my-first-topic`` geschrieben werden
- [ ] Mehrere Events können mit `kafka-console-producer` erzeugt werden

## Story 4: Aus Kafka Topic lesen

Als Entwickler möchte ich Nachrichten aus einem Kafka-Topic lesen, **um Events nachvollziehen zu können**.

```bash
docker exec -it ch-open-workshop_kafka /opt/kafka/bin/kafka-console-consumer.sh --help
```

### Akzeptanzkriterien
- [ ] Mit `kafka-console-consumer` Events ab aktuellem Zeitstempel lesen
- [ ] Mit `kafka-console-consumer` alle Events von Anfang an lesen
- [ ] Mit `kafka-consumer-groups` Consumer-Gruppen auflisten
- [ ] Mit `kafka-consumer-groups` aktuellen Offset einsehen
- [ ] Mit `kafka-consumer-groups` Offset zurücksetzen

## Story 5: Kafka Web Ansicht

Als Entwickler möchte ich meinen Kafka-Cluster auch über eine Web-Oberfläche einsehen, **um nicht nur die Kommandozeile nutzen zu müssen**.

### Akzeptanzkriterien
- [ ] Die `docker-compose.yaml` wird mit `obsidiandynamics/kafdrop:4.1.0` erweitert
- [ ] Der Web-Zugang steht auf Port `9192` zur Verfügung

-> Theorie-Teil Spring Cloud Streams - Supplier

## Story 6: Kafka Producer mit Spring Cloud Streams erstellen

Als Entwickler möchte ich mit Spring Cloud Streams Daten in Kafka schreiben, **um einfache Producer umsetzen zu können**.

### Akzeptanzkriterien
- [ ] Ein Projekt mit [Spring Initializr](https://start.spring.io) wird erstellt (Kotlin, Spring for Apache Kafka, Cloud Streams)
- [ ] Stream-Binding-Konfiguration wird erstellt
- [ ] Ein Supplier wird implementiert, der alle 5 Sekunden ein Event in das Topic `my-first-autocreated-topic` schreibt

-> Theorie-Teil Spring Cloud Streams - Consumer

## Story 7: Kafka Consumer mit Spring Cloud Streams erstellen

Als Entwickler möchte ich mit Spring Cloud Streams Nachrichten aus Kafka lesen, **um einfache Consumer umsetzen zu können**.

### Akzeptanzkriterien
- [ ] Ein Projekt mit [Spring Initializr](https://start.spring.io) wird erstellt (Kotlin, Spring for Apache Kafka, Cloud Streams)
- [ ] Stream-Binding-Konfiguration wird erstellt
- [ ] Ein Consumer wird implementiert, der Nachrichten aus dem Topic `my-first-autocreated-topic` liest

## Story 8: Kafka Producer mit Spring Kafka erstellen

Als Entwickler möchte ich mit Spring Kafka Nachrichten in Kafka schreiben, **um eine Alternative zu Spring Cloud Streams zu nutzen**.

### Akzeptanzkriterien
- [ ] Ein Projekt mit [Spring Initializr](https://start.spring.io) wird erstellt (Kotlin, Spring for Apache Kafka)
- [ ] Producer-Konfiguration wird erstellt
- [ ] Ein Producer wird implementiert, der Events in das Topic `ch-open-kafka` schreibt

## Story 9: Kafka Consumer mit Spring Kafka erstellen

Als Entwickler möchte ich mit Spring Kafka Nachrichten aus Kafka lesen, **um eine Alternative zu Spring Cloud Streams zu nutzen**.

### Akzeptanzkriterien
- [ ] Ein Projekt mit [Spring Initializr](https://start.spring.io) wird erstellt (Kotlin, Spring for Apache Kafka)
- [ ] Consumer-Konfiguration wird erstellt
- [ ] Ein Consumer wird implementiert, der Nachrichten aus dem Topic `ch-open-kafka` liest

## Bonus Story 1: Zweiten Broker hinzufügen

Als Entwickler möchte ich meinem Kafka-Cluster einen zweiten Broker hinzufügen, **um den Cluster horizontal skalieren zu können**.

### Akzeptanzkriterien
- [ ] Die `docker-compose.yaml` wird so erweitert, dass ein zweiter Kafka-Broker gestartet wird  
