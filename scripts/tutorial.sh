## Create topic with partitions
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-topics.sh \
    --create \
    --bootstrap-server localhost:9092 \
    --replication-factor 1 \
    --partitions 3 \
    --topic ${topic_name}

## List topic
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-topics.sh \
    --bootstrap-server localhost:9092 \
    --list 

## Describe topic
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-topics.sh \
    --describe \
    --topic ${topic_name} \
    --bootstrap-server localhost:9092

## Add message to topic
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-console-producer.sh \
    --topic ${topic_name} \
    --broker-list localhost:9092

## Describe offset in Kafka topic and add consumer group name
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-console-consumer.sh \
  --topic ${topic_name} \
  --bootstrap-server localhost:9092 \
  --from-beginning \
  --group ${group_name}

## Show topic and offset of partition
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group ${group_name} \
  --describe

## Read message in partition by offset
docker exec -it kafka /opt/bitnami/kafka/bin/kafka-console-consumer.sh \
  --topic ${topic_name} \
  --bootstrap-server localhost:9092 \
  --partition 0 \
  --offset 0
     