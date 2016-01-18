package mad_nectarine.spark.sample.helloworld
import org.apache.spark.{Logging, SparkConf, SparkContext}

object CountLinesIncludingWord extends Logging {
  def main(args: Array[String]) {
  
    //validate args
    if (args.length < 1) {
      throw new IllegalArgumentException("filepath is required")
    }
    if (args.length < 2) {
      throw new IllegalArgumentException("target word is required")
    }

    val filePath = args(0)
    val word = args(1).toLowerCase()

    val conf = new SparkConf()
    conf.setAppName("mad_nectarine.CountLinesIncludingWord")
    val context = new SparkContext(conf)

    try {
      //load file
      val textRDD = context.textFile(filePath)
      
      //filter and count lines including word
      val count = textRDD.filter(x => 
        x.toLowerCase().contains(word) == true
      ).count()

      println(s"There was ${count} lines including '${word}'.（${filePath}）")

    } finally{
      context.stop()
    }
  }
}
