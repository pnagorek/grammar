Remove-Item -Exclude "Main.java" *.java
Remove-Item bin/*.class

$src = "src"
$dest = "bin"

$cup_run_dep = "jar/java-cup-11b-runtime.jar;."
$cup_dep = "./jar/java-cup-11b.jar"
$flex_dep = "./jar/jflex-full-1.7.0.jar"

java -jar $cup_dep -interface -parser Parser -symbols sym parser.cup

java -jar $flex_dep lexer.flex

javac -d $dest -classpath $cup_run_dep *.java

java -cp "$cup_run_dep;$dest" Main