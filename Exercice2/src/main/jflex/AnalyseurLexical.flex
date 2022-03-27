package fr.harisclement.tp1.ex2;

import java_cup.runtime.Symbol;

%%

%class LexicalAnalyzer
%unicode
%line
%column

%cup

%{

%}

chiffre 	= [0-9]
espace 		= \s
mod 		= "mod"|"MOD"
let			= "let"|"LET"

ident		= [:letter:]\w*
comment1	= "//".*
comment2	= "/*"([^*]|("*"+[^/*]))*"*"+"/"
comment	= {comment1}|{comment2}	

%%

{let}		{ return new Symbol(sym.LET, yyline, yycolumn) ;}
"="			{ return new Symbol(sym.EGAL, yyline, yycolumn) ;}
"("			{ return new Symbol(sym.PAR_G, yyline, yycolumn) ;}
")"			{ return new Symbol(sym.PAR_D, yyline, yycolumn) ;}
"+"			{ return new Symbol(sym.PLUS, yyline, yycolumn) ;}
"-"			{ return new Symbol(sym.MOINS, yyline, yycolumn) ;}
"/"			{ return new Symbol(sym.DIV, yyline, yycolumn) ;}
{mod}		{ return new Symbol(sym.MOD, yyline, yycolumn) ;}
"*"			{ return new Symbol(sym.MUL, yyline, yycolumn) ;}
";"			{ return new Symbol(sym.SEMI, yyline, yycolumn) ;}
{chiffre}+	{ return new Symbol(sym.ENTIER, yyline, yycolumn, new Integer(yytext())) ;}
{ident}		{ return new Symbol(sym.IDENT, yyline, yycolumn, yytext()) ;}
{comment}	{ /*commentaire : pas d'action*/ }
{espace} 	{ /*espace : pas d'action*/ }
.			{ return new Symbol(sym.ERROR, yyline, yycolumn) ;}