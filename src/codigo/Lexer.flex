package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
R=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
( while | do ) {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
(LEU{D})* {lexeme=yytext(); return Identificador;}
("(-"8{R}8+")")|8{R}8+ {lexeme=yytext(); return Numero;}
(-8{R}.{D}8+)|(8{R}8.{D}) {lexeme=yytext(); return NumeroDecimal;}
 . {return ERROR;}
