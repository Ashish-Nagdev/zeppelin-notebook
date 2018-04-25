package com.task.avro.compaction

import org.apache.avro.Schema
import org.apache.spark.sql.{DataFrame, SparkSession}
//import org.apache.spark.sql.functions._
import java.io._

//case class AdditionalAttrs(key: String, value: String)

object AvroMerger {

  def main(args: Array[String]): Unit = {

    val schema: Schema = new Schema.Parser().parse(new File(args(0)))
    //("/home/ashish/Desktop/spark-AvroMerger-Parquet/src/main/resources/avro-schema/schema.avsc"))
    val spark: SparkSession = SparkSession.builder().config("avro.mapred.ignore.inputs.without.extension", "false").master("local").getOrCreate()

    val avroDf: DataFrame = spark
      .read
      .format("com.databricks.spark.avro")
      .option("avroSchema", schema.toString)
      .load(args(1))
    //.load("/home/ashish/Desktop/spark-AvroMerger-Parquet/raw_avro_files")

    // val explodeUDF = udf((map: Map[String, AdditionalAttrs]) => map.toVector)


    avroDf.printSchema()

    //  val newDF = avroDf.withColumn("TMP", explode(explodeUDF(avroDf("additional_attrs")))).drop("additional_attrs")
    //
    //  val newDF1 = newDF.withColumn("key", newDF("TMP").apply("_1")).withColumn("value", newDF("TMP").apply("_2"))
    //
    //  val newDF2 = newDF1.drop("TMP")


    avroDf
      .coalesce(1)
      .write.format("parquet").save(args(2))
    //.save("file:///home/ashish/Desktop/spark-AvroMerger-Parquet/output_parquet")

  }
}
