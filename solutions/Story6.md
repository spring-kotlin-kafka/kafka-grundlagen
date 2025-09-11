#  Lösung Story 6

## Spring Initializr

```bash
curl https://start.spring.io/starter.zip \
  -d type=maven-project \
  -d language=kotlin \
  -d platformVersion=3.2.0 \
  -d packaging=jar \
  -d jvmVersion=17 \
  -d groupId=ch.open.days25.stream \
  -d artifactId=kafka-producer \
  -d name=stream-producer \
  -d dependencies=cloud-stream,kafka \
  -o stream-producer.zip
  
unzip stream-producer.zip -d stream-producer
cd stream-producer
```

## Spring Cloud Stream Konfiguration

```yaml
spring:
  cloud:
    stream:
      bindings:
        sendMessage-out-0:
          destination: my-first-autocreated-topic
      kafka:
        binder:
          brokers: localhost:9190
```

## Spring Cloud Stream

```kotlin
package ch.open.days25.stream.kafka_producer

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import java.util.function.Supplier

@Configuration
class KafkaProducerConfig {

    @Bean
    fun sendMessage(): Supplier<String> = Supplier {
        "Hello from Spring Cloud Stream!"
    }
}
```

## Erklärung

- **Spring Cloud Stream** erkennt die **Bean sendMessage**.
- Der Binder `spring.cloud.stream.default-binder: kafka` (automatische Erkennung durch Spring aufgrund Dependency) verbindet sie mit dem Output-Binding `sendMessage-out-0`.
- Standardmäßig wird dieser Supplier **regelmässig aufgerufen**, um Nachrichten zu erzeugen.
- Diese Nachrichten werden automatisch ans Kafka-Topic `destination: my-first-autocreated-topic` gesendet, das in der Konfiguration angegeben ist.
- Das Topic `my-first-autocreated-topic` wird **automatisch erstellt**, wenn es noch nicht existiert (sofern dies der Broker zulässt). (`spring.cloud.stream.kafka.binder.auto-create-topics`)
- Das **Intervall** lässt sich über `spring.cloud.stream.poller` anpassen

```yaml
spring:
  cloud:
    stream:
      poller:
        fixed-delay: 5000
```

## Spring Boot Applikation starten

### Maven

```bash
cd stream-producer
./mvnw spring-boot:run
```

### Gradle

```bash
cd stream-producer
./gradlew bootRun
```