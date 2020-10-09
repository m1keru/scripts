#!/bin/bash

ZK_HOSTS=$(cat /opt/kafka/config/server.properties | grep zookeeper.connect= | cut -d= -f2)
# List of bootstrap servers comma separated
BOOTSTRAPS=$1

#---------------------- 100 RS ------------------------------#
# Test producer 100x15kkxno_comression
echo "TESING benchmark-100x15kkx8kxno_comression"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-100x15kkx8kxno_comression \
--num-records 15000000 \
--record-size 100 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=none \
batch.size=8196
echo "Done"


# Test producer 100x15kkxno_comression
echo "TESING benchmark-100x15kkx8kxsnappy"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-100x15kkx8kxsnappy \
--num-records 15000000 \
--record-size 100 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=8196
echo "Done"

# Test producer 100x15kkxno_comression
echo "TESING benchmark-100x15kkx16kxsnappy"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-100x15kkx16kxsnappy \
--num-records 15000000 \
--record-size 100 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=16384
echo "Done"




#----------------------------- 500 RS ------------------------------#


# Test producer 500x15kkxno_comression
echo "TESING benchmark-500x15kkx8kxno_comression"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-500x15kkx8kxno_comression\
--num-records 15000000 \
--record-size 500 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=none \
batch.size=8196
echo "Done"


echo "TESING benchmark-500x15kkx8ksnappy"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-500x15kkx8kxsnappy\
--num-records 15000000 \
--record-size 500 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=8196
echo "Done"



echo "TESING benchmark-500x15kkx16kxno_comression"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-500x15kkx16ksnappy\
--num-records 15000000 \
--record-size 500 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=16384
echo "Done"



#--------------------------- 1000 RS -----------------------------#

# Test producer 100x15kkxno_comression
echo "TESING benchmark-1000x15kkx8kxno_comression"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-1000x15kkx8kxno_compression \
--num-records 15000000 \
--record-size 1000 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=none \
batch.size=8196
echo "Done"

# Test producer 100x15kkxno_comression
echo "TESING benchmark-1000x15kkx8kxsnappy"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-1000x15kkx8kxsnappy \
--num-records 15000000 \
--record-size 100 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=8196
echo "Done"

# Test producer 100x15kkxno_comression
echo "TESING benchmark-1000x15kkx16kxsnappy"
/opt/kafka/bin/kafka-producer-perf-test.sh --topic benchmark-1000x15kkx16kxsnappy \
--num-records 15000000 \
--record-size 100 \
--throughput 15000000 \
--producer-props \
acks=1 \
bootstrap.servers=${BOOTSTRAPS} \
buffer.memory=67108864 \
compression.type=snappy \
batch.size=16384
echo "Done"





#  Test consume 
echo "TESING consumers"
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-100x15kkx8kxno_comression --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-100x15kkx8kxsnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-100x15kkx16kxsnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-500x15kkx8kxno_comression --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-500x15kkx8kxsnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-500x15kkx16ksnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-1000x15kkx8kxno_compression --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-1000x15kkx8kxsnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8
/opt/kafka/bin/kafka-consumer-perf-test.sh --topic benchmark-1000x15kkx16kxsnappy --zookeeper ${ZK_HOSTS} --messages 15000000 --threads 8



