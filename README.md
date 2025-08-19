# Aufgaben: Kafka Grundlagen

In diesem Modul werden wir die Grundlagen von Kafka kennenlernen und Kafka lokal mit Docker aufsetzen, um erste Producer und Consumer zu schreiben.

-> Theorie-Teil Kafka-Grundlagen

## Story 1: Kafka lokal aufsetzen

Als Entwickler möchte ich Kafka schnell und einfach lokal aufsetzen können, um lokal mit einem persönlichen Kafka-Cluster zu entwicklen.

### Akzeptanzkriterien:
- [ ] `docker` installieren mit `docker compose Plugin` (Vorbedingung)
- [ ] `docker-compose.yaml` schreiben mit Kafka-Cluster und einem ersten Broker Port `9190`
- [ ] `docker-compose.yaml` erweitern, 

## Story 2: Kafka Topics erstellen, schreiben und lesen

Als Entwickler möchte ich meine Topics initial erstellen lassen.

### Akzeptanzkriterien:
- [ ] mit `kafka-topics` Topics auslesen
- [ ] mit `kafka-topics` Topic mit dem Namen `my-first-topic` hinzufügen
- [ ] `docker-compose.yaml` erweitern, damit das gewüschte Topic initial erstellt werden

-> Theorie-Teil Kafka-Producer

## Story 2b: In Kafka Topic schreiben

Als Entwickler möchte ich in mein Topic schreiben können.

### Akzeptanzkriterien:
- [ ] mit `kafka-console-producer` Events erzeugen
- [ ] mit `kafka-console-producer` mehrere Events erzeugen

-> Theorie-Teil Kafka-Consumer

## Story 2c: Aus Kafka Topic lesen

Als Entwickler möchte ich aus meinem Topic lesen können.

### Akzeptanzkriterien:
- [ ] mit `kafka-console-consumer` Events ab dem aktuellen Zeitstempel lesen
- [ ] mit `kafka-console-consumer` alle Events von Anfang an lesen
- [ ] mit `kafka-consumer-groups` Groups auflisten
- [ ] mit `kafka-consumer-groups` aktuellen Offset einsehen
- [ ] mit `kafka-consumer-groups` Offset zurücksetzen

## Story 3: Kafka Web Anicht

Als Entwickler möchte ich auch ohne Kommando-Zeile auf meinen Kafka-Cluster zugreifen können.

### Akzeptanzkriterien:
- [ ] `docker-compose.yaml` mit `obsidiandynamics/kafdrop:4.1.0` auf Port `9192` erweitern, um eine Web-Ansicht des Kafka-Containers zu erhalten

-> Theorie-Teil Spring Cloud Streams - Supplier

## Story 4: Kafka Producer mit Spring Cloud Streams erstellen

Als Entwickler möchte ich mit einfachsten Mitteln in mein Kafka-Cluster schreiben können.

### Akzeptanzkriterien:
- [ ] Projekt mit [Spring initializr](https://start.spring.io) erstellen (kotlin, kafka, spring-cloud-streams)
- [ ] Stream Binding Konfiguration erstellen
- [ ] Supplier erstellen, welcher einen Kafka-Event alle 5 Sekunden in das Topic `my-first-autocreated-topic` schreibt

-> Theorie-Teil Spring Cloud Streams - Consumer

## Story 5: Kafka Consumer mit Spring Cloud Streams erstellen

Als Entwickler möchte ich mit einfachsten Mitteln aus meinem Kafka-Cluster lesen können.

### Akzeptanzkriterien:
- [ ] Projekt mit [Spring initializr](https://start.spring.io) erstellen (kotlin, kafka, spring-cloud-streams)
- [ ] Stream Binding Konfiguration erstellen
- [ ] Consumer erstellen, welcher die Kafka-Events aus dem Topic `my-first-autocreated-topic` liest

-> Theorie-Teil Unterschiede Spring Cloud Streams vs. Spring Kafka

## Story 6: Kafka Producer mit Spring Kafka erstellen

Als Entwickler möchte ich mit einfachsten Mitteln in mein Kafka-Cluster schreiben können.

### Akzeptanzkriterien:
- [ ] Projekt mit [Spring initializr](https://start.spring.io) erstellen (kotlin, kafka)
- [ ] Producer Konfiguration erstellen
- [ ] Producer erstellen, welcher einen Kafka-Event in das Topic `ch-open-kafka` schreibt

## Story 7: Kafka Consumer mit Spring Kafka erstellen

Als Entwickler möchte ich mit einfachsten Mitteln aus meinem Kafka-Cluster lesen können.

### Akzeptanzkriterien:
- [ ] Projekt mit [Spring initializr](https://start.spring.io) erstellen (kotlin, kafka)
- [ ] Consumer Konfiguration erstellen
- [ ] Consumer erstellen, welcher die Kafka-Events aus dem Topic `ch-open-kafka` liest

## Bonus-Story 1: Einen zweiten Broker zum Cluster hinzufügen

Als Entwickler möchte ich meinen Kafka-Cluster horizontal skalieren können.
- [ ] Docker-compose.yaml erweitern, um einen zweiten kafka-Broker zu erstellen
