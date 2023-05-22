from pyspark.sql import SparkSession

#uri = "mongodb+srv://adsoft:adsoft-sito@cluster0.kzghgph.mongodb.net/?retryWrites=true&w=majority"
uri = "mongodb+srv://adsoft:adsoft-sito@cluster0.kzghgph.mongodb.net/memes?retryWrites=true&w=majority"

if __name__ == "__main__":
    spark = SparkSession\
        .builder\
        .appName("hello_spark")\
        .config("spark.mongodb.read.connection.uri", uri) \
        .config('spark.jars.packages', 'org.mongodb.spark:mongo-spark-connector_2_12-10.1.1:3.3.2')\
        .config('spark.jars.packages', 'org.mongodb.spark:bson-3.8.1:3.3.2')\
        .getOrCreate()

#        config("spark.jars.packages", "org.mongodb.spark:mongo-spark-connector_2.12:3.0.0").\

    print("Hello spark world, welcome adsoft ... ")
#    df = spark.read.format("mongodb").load()
#com.mongodb.spark.sql.DefaultSource
    df = spark.read\
    .format("mongodb")\
    .option("uri", uri)\
    .option("database","memes")\
    .option("collection", "memes_info")\
    .load()

    #.format("com.mongodb.spark.sql.DefaultSource")\

    df.printSchema()

    spark.stop()
