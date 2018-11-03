lexer grammar JLexer;

fragment
LETTER : ('a'..'z' | 'A'..'Z');

fragment
NON_ZERO_DIGIT : '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9';

fragment
DIGIT : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9';

fragment
OCTAL_DIGIT : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7';

fragment
HEX_DIGIT : '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
         | 'a' | 'b' | 'c' | 'd' | 'e' | 'f' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F';

fragment
EscapeSequence : '\\''t' | '\\''b' | '\\''n' | '\\''r' | '\\''f' | '\\''\'' | '\\''\\' | '\\''"';

//INTEGER : ('-' | '+')? ('1'..'9') (DIGIT)*;
//REAL_NUMBER: INTEGER '.' DIGIT+;

//ID : [_a-zA-Z][_a-zA-Z0-9]*;

DECIMAL_NUMBER : '0' ('l' | 'L')? | NON_ZERO_DIGIT DIGIT* ('l' | 'L')?;
OCTAL_NUMBER : '0' OCTAL_DIGIT* ('l' | 'L')?;
HEX_NUMBER : '0' [xX] HEX_DIGIT* ('l' | 'L')?;
FLOAT_NUMBER : DIGIT+ (((('.' DIGIT+)? (('e' | 'E') DIGIT+)?) ('f' | 'F')?) | ('.' ('f' | 'F')) | (('.' ('e' | 'E') DIGIT+) ('f' | 'F')?));
DOUBLE_NUMBER : DIGIT+ (((('.' DIGIT+)? (('e' | 'E') DIGIT+)?) ('f' | 'F' | 'd' | 'D')?) | ('.' ('f' | 'F' | 'd' | 'D')) | (('.' ('e' | 'E') DIGIT+) ('f' | 'F' | 'd' | 'D')?));
CHARACTER : '\''~('"' | '\\')'\'' | '\'' EscapeSequence '\'';
STRING : '"'(~('"' | '\\') | EscapeSequence)*'"';
ESPACE : ('\t' | ' ' | '\r' | '\n' | '\u000C')+ -> skip;
COMMENT : '//' (~('\n' | '\r'))* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;

NumberID: [0-9][_a-zA-Z0-9]*;
HashtagID : '#'[_a-zA-Z0-9]*;
CifraoID : ('$' | '@') [_a-zA-Z0-9]*;

//Keywords

ABSTRACT:   'abstract';
//ASSERT:     'assert';
BOOLEAN:    'boolean';
BREAK:      'break';
BYTE:       'byte';
CASE:       'case';
CATCH:      'catch';
CHAR:       'char';
CLASS:      'class';
CONST:      'const';
CONTINUE:   'continue';
DEFAULT:    'default';
DO:         'do';
DOUBLE:     'double';
ELSE:       'else';
ENUM:       'enum';
EXTENDS:    'extends';
FINAL:      'final';
FINALLY:    'finally';
FLOAT:      'float';
FOR:        'for';
IF:         'if';
GOTO:       'goto';
IMPLEMENTS: 'implements';
IMPORT:     'import';
INSTANCEOF: 'instanceof';
INT:        'int';
INTERFACE:  'interface';
LONG:       'long';
NATIVE:     'native';
NEW:        'new';
PACKAGE:    'package';
PRIVATE:    'private';
PROTECTED:  'protected';
PUBLIC:     'public';
RETURN:     'return';
SHORT:      'short';
STATIC:     'static';
STRICTFP:   'strictfp';
SUPER:      'super';
SWITCH:     'switch';
SYNCHRONIZED: 'synchronized';
THIS:       'this';
THROW:      'throw';
THROWS:     'throws';
TRANSIENT:  'transient';
TRY:        'try';
VOID:       'void';
VOLATILE:   'volatile';
WHILE:      'while';
STRING_TYPE:     'String';

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
