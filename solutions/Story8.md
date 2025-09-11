#  Lösung Story 8

## Spring Initializr

```bash
curl https://start.spring.io/starter.zip \
  -d type=maven-project \
  -d language=kotlin \
  -d platformVersion=3.2.0 \
  -d packaging=jar \
  -d jvmVersion=17 \
  -d groupId=ch.open.days25.kafka \
  -d artifactId=kafka-producer \
  -d name=kafka-producer \
  -d dependencies=kafka \
  -o kafka-producer.zip
  
unzip kafka-producer.zip -d kafka-producer
cd kafka-producer
```

## Spring Cloud Stream Konfiguration

```yaml
spring:
  kafka:
    bootstrap-servers: localhost:9190
    producer:
      key-serializer: org.apache.kafka.common.serialization.StringSerializer
      value-serializer: org.apache.kafka.common.serialization.StringSerializer
```

## Kafka Producer

```kotlin
package ch.open.days25.kafka.kafka_producer

import org.springframework.kafka.core.KafkaTemplate
import org.springframework.stereotype.Service

@Service
class KafkaProducer(private val kafkaTemplate: KafkaTemplate<String, String>) {

    fun sendMessage(message: String) {
        kafkaTemplate.send("ch-open-kafka", message)
        println("Sent message: $message")
    }
}
```

## CommandLineRunner

```kotlin
package ch.open.days25.kafka.kafka_producer

import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component

@Component
class ProducerRunner(private val kafkaProducer: KafkaProducer) : CommandLineRunner {

    override fun run(vararg args: String?) {
        kafkaProducer.sendMessage("Hello Kafka with Spring Kafka!")
    }
}
```

## Erklärung

- **KafkaProducer Service** verwendet das `KafkaTemplate`, um in das Topic `ch-open-kafka` zu schreiben
- Das Topic `ch-open-kafka` wird **automatisch erstellt**, wenn es noch nicht existiert (sofern dies der Broker zulässt). (`spring.kafka.admin.auto-create`)
- Der `CommandLineRunner` (`ProducerRunner`) ruft die `KafkaProducer#sendMessage` Methode auf und beendet die Applikation

## Spring Boot Applikation starten

### Maven

````bash
cd kafka-producer
./mvnw spring-boot:run
````

### Gradle

````bash
cd kafka-producer
./gradlew bootRun
````