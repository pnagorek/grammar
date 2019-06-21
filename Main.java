import java.io.*;
   
public class Main {
  @SuppressWarnings( "deprecation" )
  static public void main(String argv[]) {    
    try {
      System.out.println("READY!");
      Parser p = new Parser(new Lexer(new InputStreamReader(System.in)));
      Object result = p.parse().value;      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}


