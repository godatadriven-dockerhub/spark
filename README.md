# Apache Spark in Docker

Spark docker container based on OpenJDK 8 

[![](https://images.microbadger.com/badges/image/godatadriven/spark.svg)](https://microbadger.com/images/godatadriven/spark "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/godatadriven/spark.svg)](https://microbadger.com/images/godatadriven/spark "Get your own version badge on microbadger.com") 

## Running the container
By default spark-submit --help is run:

```
docker run godatadriven/spark 
```

To run your own job, make the job accessible through a volume and pass the necessary arguments:

```
docker run -v /local_folder:/job godatadriven/spark [options] /job/<app jar | python file> [app arguments]
```