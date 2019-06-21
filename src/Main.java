import java.io.*;
   
public class Main {
  @SuppressWarnings( "deprecation" )
  static public void main(String argv[]) {    
    try {
      System.out.println("==========================================");
      System.out.println("==================READY!==================");
      System.out.println("==========================================");
      Parser p = new Parser(new Lexer(new InputStreamReader(System.in)));
      Object result = p.parse().value;      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}


