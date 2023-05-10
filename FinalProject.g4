grammar FinalProject;

//parse
goal:( WS* mainClass WS* (comment* WS* classDeclaration WS*)* );

mainClass:(	'class' WS* Identifier WS* '{' WS* 'public' WS* 'static' WS* 'void' WS* 'main' WS*
'(' WS* 'String' WS* '[' WS* ']' WS* Identifier WS* ')' WS* '{' WS* (statement)* WS* '}' WS* '}' WS* );

classDeclaration:( 'class' WS* Identifier WS* ( 'extends' WS* Identifier WS* )? '{' WS* (classBody) WS*'}');

classBody: ( varDeclaration | methodDeclaration | comment)*;

varDeclaration:( type WS* Identifier WS* ';' WS* );

methodDeclaration: WS* 'public' WS* type WS* Identifier WS* '(' WS*
( type WS* Identifier WS* ( ',' WS* type WS* Identifier WS* )* )?
')' WS* '{' WS* (methodBody) WS* 'return' WS* expression WS* ';' WS* '}' WS*;

methodBody: (varDeclaration|statement)*;

type:( 'int' WS* '[' WS* ']' WS* |	'boolean' WS* |	'int' WS* );

statement:(('{' WS* ( statement )* WS* '}' WS*)
|	('if' WS* '(' WS* expression WS* ')' WS* statement WS* 'else' WS* statement WS*)
|	('while' WS* '(' WS* expression WS* ')' WS* statement WS*)
|	('System.out.println' WS* '(' WS* expression WS* ')' WS* ';' WS*)
|	(Identifier WS* '=' WS* expression WS* ';' WS*)
|	(Identifier WS* '[' WS* expression WS* ']' WS* '=' WS* expression WS* ';' WS*) );

expression:	expression WS* Operator WS* expression WS*
|	expression WS* '[' WS* expression WS* ']' WS*
|	expression WS* '.' WS* 'length' WS*
|	expression WS* '.' WS* Identifier WS* '(' WS* ( expression WS* ( ',' WS* expression WS* )* )? WS* ')' WS*
|	INTEGER_LITERAL WS*
|	Boolean WS*
|	Identifier WS*
|	'this' WS*
|	'new' WS* 'int' WS* '[' WS* expression WS* ']' WS*
|	'new' WS* Identifier WS* '(' WS* ')' WS*
|	'!' WS* expression WS*
|	'(' WS* expression WS* ')' WS* ;

comment: '//' WS* ('('? WS* Identifier WS* ')'? WS*|
'('? WS* ',' WS* Identifier WS* ')'? WS* |
WS* INTEGER_LITERAL WS* |
'if' WS* Identifier WS* |
 'class' WS* Identifier WS*)*;

//Tokens
Identifier:('a'..'z'|'A'..'Z'|'_'|'$')+('0'..'9'|'a'..'z'|'A'..'Z'|'_'|'$')*;
Operator:('&&' |'<' | '+' | '-' | '*');
INTEGER_LITERAL:('0'..'9')+;
WS:(' '|'\t'|'\r'|'\n')+{skip();};
Boolean: ('true'| 'false');