#  Lösung Story 9

## Spring Initializr

```bash
curl https://start.spring.io/starter.zip \
  -d type=maven-project \
  -d language=kotlin \
  -d platformVersion=3.2.0 \
  -d packaging=jar \
  -d jvmVersion=17 \
  -d groupId=ch.open.days25.kafka \
  -d artifactId=kafka-consumer \
  -d name=kafka-consumer \
  -d dependencies=kafka \
  -o kafka-consumer.zip
  
unzip kafka-consumer.zip -d kafka-consumer
cd kafka-consumer
```

## Spring Cloud Stream Konfiguration

```yaml
spring:
  kafka:
    bootstrap-servers: localhost:9190
    consumer:
      group-id: mygroup
      auto-offset-reset: earliest
      key-deserializer: org.apache.kafka.common.serialization.StringDeserializer
      value-deserializer: org.apache.kafka.common.serialization.StringDeserializer
```

## Kafka Producer

```kotlin
package ch.open.days25.kafka.kafka_consumer

import org.apache.kafka.clients.consumer.ConsumerRecord
import org.springframework.kafka.annotation.KafkaListener
import org.springframework.stereotype.Service

@Service
class KafkaConsumer {

    @KafkaListener(topics = ["ch-open-kafka"])
    fun listen(record: ConsumerRecord<String, String>) {
        println("Received message: '${record.value()}' from topic: ${record.topic()}")
    }
}
```

## Erklärung

- **KafkaConsumer Service** erstellt mittels der Annotation `@KafkaListener` einen KafkaConsumer-Listener, der das Topic `ch-open-kafka` liest
- `spring.kafka.consumer.group-id: mygroup` wird als Consumer Group verwendet (wichtig für Offset-Verwaltung). Dieser default-Wert kann im KafkaConsumer überschrieben werden: `@KafkaListener(topics = ["ch-open-kafka"], groupId = "myothergroup")`

## Spring Boot Applikation starten

### Maven

````bash
cd kafka-consumer
./mvnw spring-boot:run
````

### Gradle

````bash
cd kafka-consumer
./gradlew bootRun
````