echo "submitting spark job..."
# export EXAMPLE_JAR=$(kubectl exec -ti --namespace kafka-adsoftsito my-spark-worker-0 -- find examples/jars/ -name 'spark-example*\.jar' | tr -d '\r')  
#kubectl exec -ti --namespace kafka-adsoftsito my-spark-worker-0 -- spark-submit --master spark://my-spark-master-svc:7077 --class org.apache.spark.examples.SparkPi https://raw.githubusercontent.com/adsoftsito/kafka-consumer-python/master/hello.py
kubectl cp hello.py my-spark-worker-0:/tmp/hello.py
kubectl cp mongodb-driver-3.8.1.jar           my-spark-worker-0:/opt/bitnami/spark/jars/
kubectl cp mongodb-driver-core-3.8.1.jar      my-spark-worker-0:/opt/bitnami/spark/jars/
kubectl cp mongo-spark-connector_2.12-10.1.1.jar  my-spark-worker-0:/opt/bitnami/spark/
kubectl cp bson-3.8.1.jar                         my-spark-worker-0:/opt/bitnami/spark/jars/

#kubectl cp hello.py my-spark-master-0:/tmp/hello.py
#kubectl cp mongodb-driver-3.8.1.jar           my-spark-master-0:/opt/bitnami/spark/
#kubectl cp mongodb-driver-core-3.8.1.jar      my-spark-master-0:/opt/bitnami/spark/
#kubectl cp mongo-spark-connector_2.12-10.1.1.jar  my-spark-master-0:/opt/bitnami/spark/
#kubectl cp bson-3.8.1.jar                     my-spark-master-0:/opt/bitnami/spark/


#kubectl exec -ti --namespace kafka-adsoftsito my-spark-worker-0 -- spark-submit  --jars mongo-spark-connector_2.13-10.jar --class bson-3.8.1.jar  --master spark://my-spark-master-svc:7077  /tmp/hello.py


kubectl exec -ti --namespace kafka-adsoftsito my-spark-worker-0 -- spark-submit --jars mongodb-driver-3.8.1.jar --class mongodb-driver-core-3.8.1.jar --jars mongo-spark-connector_2.12-10.1.1.jar --class bson-3.8.1.jar  --master spark://my-spark-master-svc:7077  /tmp/hello.py

