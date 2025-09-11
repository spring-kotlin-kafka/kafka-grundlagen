#  Lösung Story 7

## Spring Initializr

```bash
curl https://start.spring.io/starter.zip \
  -d type=maven-project \
  -d language=kotlin \
  -d platformVersion=3.2.0 \
  -d packaging=jar \
  -d jvmVersion=17 \
  -d groupId=ch.open.days25.stream \
  -d artifactId=kafka-consumer \
  -d name=stream-consumer \
  -d dependencies=cloud-stream,kafka \
  -o stream-consumer.zip
  
unzip stream-consumer.zip -d stream-consumer
cd stream-consumer
```

## Spring Cloud Stream Konfiguration

```yaml
spring:
  cloud:
    stream:
      bindings:
        consumeMessage-in-0:
          destination: my-first-autocreated-topic
          group: mygroup
      kafka:
        binder:
          brokers: localhost:9190
```

## Spring Cloud Stream

```kotlin
package ch.open.days25.stream.kafka_consumer

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import java.util.function.Consumer

@Configuration
class KafkaConsumerConfig {

    @Bean
    fun consumeMessage(): Consumer<String> = Consumer { message ->
        println("Received message: $message")
    }
}

```

## Erklärung

- **Spring Cloud Stream** erkennt die **Bean consumeMessage**.
- Der Binder `spring.cloud.stream.default-binder: kafka` (automatische Erkennung durch Spring aufgrund Dependency) verbindet sie mit dem Output-Binding `consumeMessage-out-0`.
- Nachrichten aus `destination: my-first-autocreated-topic` landen im consumeMessage Consumer.
- `group: mygroup` wird als Consumer Group verwendet (wichtig für Offset-Verwaltung)


## Spring Boot Applikation starten

### Maven

```bash
cd stream-consumer
./mvnw spring-boot:run
```

### Gradle

```bash
cd stream-consumer
./gradlew bootRun
```