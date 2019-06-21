Remove-Item -Exclude "Main.java" *.java
Remove-Item *.class

$cup_dep = "java-cup-11b-runtime.jar;."

java -jar java-cup-11b.jar -interface -parser Parser parser.cup

java -jar jflex-full-1.7.0.jar lexer.flex

javac -classpath $cup_dep *.java

java -cp $cup_dep Main