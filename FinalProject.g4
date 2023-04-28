grammar FinalProject;

//parse
goal:( WS* mainClass ( WS* classDeclaration WS*)* );
mainClass:(	'class' WS* Identifier WS* '{' WS* 'public' WS* 'static' WS* 'void' WS* 'main' WS* '(' WS* 'String' WS* '[' WS* ']' WS* Identifier WS* ')' WS* '{' WS* statement WS* '}' WS* '}' WS* );
classDeclaration:( 'class' WS* Identifier WS* ( 'extends' WS* Identifier WS* )? '{' WS* ( varDeclaration )* WS* ( methodDeclaration )* WS* '}' WS*);
varDeclaration:( type WS* Identifier WS* ';' WS* );
methodDeclaration:( 'public' WS* type WS* Identifier WS* '(' WS* ( type WS* Identifier WS* ( ',' WS* type WS* Identifier WS* )* )? ')' WS* '{' WS* ( varDeclaration )* WS* ( statement )* WS* 'return' WS* expression WS* ';' WS* '}' WS*);
type:( 'int' WS* '[' WS* ']' WS* |	'boolean' WS* |	'int' WS* |	Identifier WS* );
statement:( ('{' WS* ( statement )* WS* '}' WS*)
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
|	'true' WS*
|	'false' WS*
|	Identifier WS*
|	'this' WS*
|	'new' WS* 'int' WS* '[' WS* expression WS* ']' WS*
|	'new' WS* Identifier WS* '(' WS* ')' WS*
|	'!' WS* expression WS*
|	'(' WS* expression WS* ')' WS* ;
comment: ((('//' WS* Id WS*)WS*)+);
//Tokens
Identifier:('a'..'z'|'A'..'Z'|'_'|'$')+('0'..'9'|'a'..'z'|'A'..'Z'|'_'|'$')*;
Operator:('&&' |'<' | '+' | '-' | '*');
INTEGER_LITERAL:('0'..'9')+;
WS:(' '|'\t'|'\r'|'\n')+{skip();};