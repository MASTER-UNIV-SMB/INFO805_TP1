package fr.harisclement.tp1;
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

%%

"("			{ return new Symbol(sym.PAR_G, yyline, yycolumn) ;}
")"			{ return new Symbol(sym.PAR_D, yyline, yycolumn) ;}
"+"			{ return new Symbol(sym.PLUS, yyline, yycolumn) ;}
"-"			{ return new Symbol(sym.MOINS, yyline, yycolumn) ;}
"/"			{ return new Symbol(sym.DIV, yyline, yycolumn) ;}
{mod}		{ return new Symbol(sym.MOD, yyline, yycolumn) ;}
"*"			{ return new Symbol(sym.MUL, yyline, yycolumn) ;}
";"			{ return new Symbol(sym.SEMI, yyline, yycolumn) ;}
{chiffre}+	{ return new Symbol(sym.ENTIER, yyline, yycolumn, new Integer(yytext())) ;}
{espace} 	{ /*espace : pas d'action*/ }
.			{ return new Symbol(sym.ERROR, yyline, yycolumn) ;}