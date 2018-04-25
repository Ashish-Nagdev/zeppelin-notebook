name := "spark-AvroMerger-Parquet"

version := "1.0"

scalaVersion := "2.11.8"


val sparkVersion = "2.1.0"


resolvers ++= Seq(
  "apache-snapshots" at "http://repository.apache.org/snapshots/"
)

libraryDependencies += "com.datastax.spark" %% "spark-cassandra-connector" % "2.0.0"
libraryDependencies += "org.apache.spark" %% "spark-core" % sparkVersion % "provided"
libraryDependencies += "org.apache.spark" %% "spark-sql" % sparkVersion
libraryDependencies += "joda-time" % "joda-time" % "2.9.9"
libraryDependencies += "org.scalatest" % "scalatest_2.11" % "2.2.6"
libraryDependencies += "junit" % "junit" % "4.12"
libraryDependencies += "org.mockito" % "mockito-core" % "1.8.5"


libraryDependencies += "org.slf4j" % "slf4j-api" % "1.7.5"
libraryDependencies += "com.databricks" %% "spark-avro" % "3.2.0"
//libraryDependencies += "org.apache.avro" % "avro" % "1.7.6" exclude("org.mortbay.jetty", "servlet-api")

//libraryDependencies += "org.drools" % "drools-core" % "6.2.0.Final"
//libraryDependencies ++= Seq(
//  "org.apache.spark" %% "spark-core" % sparkVersion % "provided"
//  "org.apache.spark" %% "spark-sql" % sparkVersion,
//  "org.apache.spark" %% "spark-mllib" % sparkVersion,
//  "org.apache.spark" %% "spark-streaming" % sparkVersion,
//  "org.apache.spark" %% "spark-hive" % sparkVersion
//)
