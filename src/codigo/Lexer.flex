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
( Coco- | Oso- | Sol- ) {lexeme=yytext(); return TipoDeDato;}

( while | do ) {lexeme=yytext(); return PalabraReservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"&&" | "||"   {lexeme=yytext(); return OperadorLogico;}
"(" {lexeme=yytext(); return ParentesisDeApertura;}
")" {lexeme=yytext(); return ParentesisDeCierre;}
"{" {lexeme=yytext(); return LlaveAbierta;}
"}" {lexeme=yytext(); return LlaveCerrada;}
">" | "<" | "==" | "!=" | ">=" | "<=" {lexeme = yytext(); return OperadorRelacional;}
(LEU{D})* {lexeme=yytext(); return Identificador;}
("(-"8{R}8+")")|8{R}8+ {lexeme=yytext(); return Numero;}
(-8{R}.{D}8+)|(8{R}8.{D}) {lexeme=yytext(); return NumeroDecimal;}
 . {return ERROR;}
