lexer grammar JLexer;

fragment
LETTER : ('a'..'z' | 'A'..'Z');
fragment
DIGIT : '0'..'9';

ESPACE : ('\t' | ' ' | '\r' | '\n' | '\u000C')+ -> skip;
COMMENT : '//' (~('\n' | '\r'))* -> skip;

INTEGER : ('-' | '+')? ('1'..'9') (DIGIT)*;
REAL_NUMBER: INTEGER '.' DIGIT+;


PACKAGE : 'package' ;
IMPORT : 'import';
CLASS : 'class';
CLASS_MODIFIER : 'public' | 'abstract' | 'final';
EXTENDS : 'extends';
INTERFACES : 'implements';
STATIC : 'static';
CONSTRUCTOR_MODIFIER : 'public' | 'protected' | 'private';
THROW : 'throw';
THROWS : 'throws';
THIS : 'this';
SUPER :'super';
FIELD_MODIFIER : 'public' | 'protected' | 'private' | 'static' | 'final' | 'transient' | 'volatile';
VOID : 'void';
METHOD_MODIFIER : '=' 'public' | 'protected' | 'private' | 'static' | 'abstract' | 'final' | 'synchronized' | 'native';
INTERFACE : 'interface';
INSTANCEOF : 'instanceof';
NEW : 'new';

PRIMITIVE : 'boolean';
INT : 'int';
BYTE : 'byte';
SHORT : 'short';
LONG : 'long';
CHAR : 'char';
REFERENCE_TYPE : 'String';
STRING : '"' ( ~('\n') )* '"';
FLOATINGE : 'float' | 'double';

IF : 'if';
ELSE :'else';
SWITCH : 'switch';
CASE : 'case';
DEFAULT : 'default';
WHILE : 'while';
DO : 'do';
FOR : 'for';
BREAK : 'break';
CONTINUE : 'continue';
RETURN : 'return';
SYNCHRONIZED : ' synchronized';
TRY : 'try';
CATCH : 'catch';
FINALLY : 'finally';

ASSIGNMENT_OPERATOR : '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|=';
CONDITIONAL_OR : '||';
CONDITIONAL_AND : '&&';
INCLUSIVE_OR : '|';
EXCLUSIVE_OR : '^';
AND_EXPRESSION : '&';
EQUALITY : '==';
NOT_EQUALITY : '!=';
RELATIONAL : '<' | '>' | '<=' | '>=';
SHIFT : '<<' | '>>' | '>>>';
OPERATOR: '+' | '-' | '*' | '/';
DECREMENT : '--';
INCREMENT : '++' ;
UNARY_EXPRESSION : '~' | '!' ;
DIM_O : '[';
DIM_C : ']';
CB_O : '{';
CB_C : '}';
BRACE_O : '(';
BRACE_C : ')';
DOT : '.';
DOT_C : ';';
SYMBOL : '@';

ID : LETTER (LETTER| DIGIT | '_')*;

ERROR : .;