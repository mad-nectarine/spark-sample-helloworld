# Compile

1. install jdk 1.8 and sbt
2. execute sbt-assembly
    
    *※ if you execute on windows, copy this folder to "c:\" before execute below.*
    ```console
    cd /to-this-folder
    sbt assembly
    ```

# Execute on Spark

1. copy files to "/opt/spark-sample-helloworld" on Spark client server.
   * sample-data.txt
   * target/scala-2.11/spark-sample-helloworld-assembly-1.0.jar
   
1. copy "sample-data.txt" to hdfs.

    ```console
    sudo -u hdfs hdfs dfs -put /opt/spark-sample-helloworld/sample-data.txt /tmp/sample-data.txt
    ```
 
1. execute app (using yarn)
   
   ```console
   ${SPARK_HOME}/bin/spark-submit \
   --master yarn \
   --class mad_nectarine.spark.sample.helloworld.CountLinesIncludingWord \
   /opt/spark-sample-helloworld/spark-sample-helloworld-assembly-1.0.jar \
   "/tmp/sample-data.txt" "hoge"
   
   ...
   There was 4 lines including 'hoge'.（/tmp/sample-data.txt）
   ...
   ```