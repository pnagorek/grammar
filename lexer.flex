import java_cup.runtime.*;

%%

%class Lexer

%line
%column

%cup

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

Argument = '[^']*'
Variable = [a-zA-Z]*
Number = [0-9]*

%%

<YYINITIAL> {

    ";"                { return symbol(sym.SEMI); }

    "::"               { return symbol(sym.DOUBLE_COLON); }

    "="                { return symbol(sym.ASSIGN); }

    "+"                { return symbol(sym.PLUS); }

    "-"                { return symbol(sym.MINUS); }

    "*"                { return symbol(sym.TIMES); }

    "/"                { return symbol(sym.DIVIDE); }

    "["                { return symbol(sym.LBRACKET); }

    "]"                { return symbol(sym.RBRACKET); }

    ","                { return symbol(sym.COMMA); }

    "concat"           { return symbol(sym.CONCAT); }

    "length"           { return symbol(sym.LENGTH); }

    "reverse"          { return symbol(sym.REVERSE); }

    "first_sub"        { return symbol(sym.FSUB); }

    "last_sub"         { return symbol(sym.LSUB); }

    "cut_first"        { return symbol(sym.CFIRST); }

    "cut_last"         { return symbol(sym.CLAST); }

    "function"         { return symbol(sym.FUNCTION); }

    {Argument}         { return symbol(sym.ARG, yytext()); }

    {Variable}         { return symbol(sym.VAR, yytext()); }

    {Number}           { return symbol(sym.NUMBER, new Integer(yytext())); }
   
    {WhiteSpace}       { /* just skip what was found, do nothing */ }   
}

[^]                    { throw new Error("Illegal character <"+yytext()+">"); }