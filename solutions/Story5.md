#  Lösung Story 5

## Kafdrop UI

```yaml
version: '3.8'

services:
  kafdrop:
    image: obsidiandynamics/kafdrop:4.1.0
    container_name: ch-open-workshop_kafdrop
    ports:
      - "9192:9000"
    environment:
      KAFKA_BROKERCONNECT: "kafka:29092"
      JVM_OPTS: "-Xms32M -Xmx64M"
    restart: unless-stopped
    depends_on:
      - kafka
```