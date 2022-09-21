package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
E=[0-9]
OCHO=[8]

espacio=[ \t,\r,\n]+
%{
    public String lexeme;
%}
%%
( Coco- ) {lexeme=yytext(); return Coco;}
( Oso- ) {lexeme=yytext(); return Oso;}
( Sol- ) {lexeme=yytext(); return Cadena;}

( 8while8 | 8do8 ) {lexeme=yytext(); return PalabraReservada;}
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
"," | ";" {lexeme=yytext(); return Coma;}
">" | "<" | "==" | "!=" | ">=" | "<=" {lexeme = yytext(); return OperadorRelacional;}
(LEU{D}.)* {lexeme=yytext(); return Identificador;}
(-{OCHO}{E}+{OCHO})|({OCHO}{E}+{OCHO}) {lexeme=yytext(); return NumeroEnteroCoco;}
(-{OCHO}{E}+{OCHO}"."{D})|({OCHO}{E}+{OCHO}"."{D}) {lexeme=yytext(); return NumeroDecimalOso;}
 . {return ERROR;}
