# vars
$src = "src"
$dest = "bin"
$lib = "lib"
$cup = "parser.cup"
$flex = "lexer.flex"

# libs
$cup_run_dep = "$lib/java-cup-11b-runtime.jar;."
$cup_dep = "$lib/java-cup-11b.jar"
$flex_dep = "$lib/jflex-full-1.7.0.jar"

# clean
Remove-Item -Exclude "Main.java" $src/*.java
Remove-Item $dest/*.class

# cup
java -jar $cup_dep -interface -destdir $src -parser Parser $cup

# flex
java -jar $flex_dep -d $src $flex

# compile
javac -d $dest -classpath $cup_run_dep $src/*.java

# start
java -cp "$cup_run_dep;$dest" Main