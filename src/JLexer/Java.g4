grammar Java;
//PROGRAMS
//<compilation unit> ::= <package declaration>? <import declarations>? <type declarations>?
compilationUnit : packageDeclaration? importDeclarations? typeDeclarations?;

//DECLARATIONS
//<package declaration> ::= package <package name> ;
packageDeclaration : PACKAGE packageName DOT_C;
//<import declarations> ::= <import declaration> | <import declarations> <import declaration>
importDeclarations : importDeclaration | importDeclarations importDeclaration;
//<import declaration> ::= <single type import declaration> | <type import on demand declaration>
importDeclaration  : singleTypeImportDeclaration | typeImportOnDemandDeclaration;
//<single type import declaration> ::= import <type name> ;
singleTypeImportDeclaration : IMPORT typeName DOT_C;
//<type import on demand declaration> ::= import <package name> . * ;
typeImportOnDemandDeclaration : IMPORT packageName DOT MUL DOT_C;
//<type declarations> ::= <type declaration> | <type declarations> <type declaration>
typeDeclarations : typeDeclaration | typeDeclarations typeDeclaration;
//<type declaration> ::= <class declaration> | <interface declaration> | ;
typeDeclaration : classDeclaration | interfaceDeclaration | DOT_C;
//<class declaration> ::= <class modifiers>? class <identifier> <super>? <interfaces>? <class body>
classDeclaration : classModifiers ? CLASS ID super? interfaces? classBody;
//<class modifiers> ::= <class modifier> | <class modifiers> <class modifier>
classModifiers : classModifier | classModifiers classModifier;
//<class modifier> ::= public | abstract | final
classModifier : PUBLIC | ABSTRACT | FINAL;
//<super> ::= extends <class type>
super : EXTENDS classType;
//<interfaces> ::= implements <interface type list>
interfaces : IMPLEMENTS interfaceTypeList;
//<interface type list> ::= <interface type> | <interface type list> , <interface type>
interfaceTypeList : interfaceType | interfaceTypeList COMMA interfaceType;
//<class body> ::= { <class body declarations>? }
classBody : CB_O classBodyDeclarations? CB_C;
//<class body declarations> ::= <class body declaration> | <class body declarations> <class body declaration>
classBodyDeclarations : classBodyDeclaration | classBodyDeclarations classBodyDeclaration;
//<class body declaration> ::= <class member declaration> | <static initializer> | <constructor declaration>
classBodyDeclaration  : classMemberDeclaration | staticInitializer | constructorDeclaration;
//<class member declaration> ::= <field declaration> | <method declaration>
classMemberDeclaration: fieldDeclaration | methodDeclaration;
//<static initializer> ::= static <block>
staticInitializer : STATIC block;
//<constructor declaration> ::= <constructor modifiers>? <constructor declarator> <throws>? <constructor body>
constructorDeclaration : constructorModifiers? constructorDeclarator throwsRule? constructorBody;
//<constructor modifiers> ::= <constructor modifier> | <constructor modifiers> <constructor modifier>
constructorModifiers : constructorModifier | constructorModifiers constructorModifier;
//<constructor modifier> ::= public | protected | private
constructorModifier : PUBLIC | PROTECTED | PRIVATE;
//<constructor declarator> ::= <simple type name> ( <formal parameter list>? )
constructorDeclarator : simpleTypeName BRACE_O formalParameterList? BRACE_C;
//<formal parameter list> ::= <formal parameter> | <formal parameter list> , <formal parameter>
formalParameterList : formalParameter | formalParameterList COMMA formalParameter;
//<formal parameter> ::= <type> <variable declarator id>
formalParameter : type variableDeclaratorId;
//<throws> ::= throws <class type list>
throwsRule : THROWS classTypeList;
//<class type list> ::= <class type> | <class type list> , <class type>
classTypeList : classType | classTypeList COMMA classType;
//<constructor body> ::= { <explicit constructor invocation>? <block statements>? }
constructorBody : CB_O explicitConstructorInvocation? blockStatements ? CB_C;
//<explicit constructor invocation>::= this ( <argument list>? ) | super ( <argument list>? )
explicitConstructorInvocation : THIS BRACE_O argumentList? BRACE_C | SUPER BRACE_O argumentList? BRACE_C;
//<field declaration> ::= <field modifiers>? <type> <variable declarators> ;
fieldDeclaration : fieldModifiers? type variableDeclarators DOT_C;
//<field modifiers> ::= <field modifier> | <field modifiers> <field modifier>
fieldModifiers : fieldModifier | fieldModifiers fieldModifier;
//<field modifier> ::= public | protected | private | static | final | transient | volatile
fieldModifier : PUBLIC | PROTECTED | PRIVATE | STATIC | FINAL | TRANSIENT | VOLATILE;
//<variable declarators> ::= <variable declarator> | <variable declarators> , <variable declarator>
variableDeclarators : variableDeclarator | variableDeclarators COMMA variableDeclarator;
//<variable declarator> ::= <variable declarator id> | <variable declarator id> = <variable initializer>
variableDeclarator : variableDeclaratorId | variableDeclaratorId ASSIGN variableInitializer;
//<variable declarator id> ::= <identifier> | <variable declarator id> [ ]
variableDeclaratorId : ID | variableDeclaratorId DIM_O DIM_C;
//<variable initializer> ::= <expression> | <array initializer>
variableInitializer : expression | arrayInitializer;
//<method declaration> ::= <method header> <method body>
methodDeclaration : methodHeader methodBody;
//<method header> ::= <method modifiers>? <result type> <method declarator> <throws>?
methodHeader : methodModifiers? resultType methodDeclarator throwsRule?;
//<result type> ::= <type> | void
resultType : type | VOID;
//<method modifiers> ::= <method modifier> | <method modifiers> <method modifier>
methodModifiers :  methodModifier | methodModifiers methodModifier;
//<method modifier> ::= public | protected | private | static | abstract | final | synchronized | native
methodModifier : PUBLIC | PROTECTED | PRIVATE | STATIC | ABSTRACT | FINAL | SYNCHRONIZED | NATIVE;
//<method declarator> ::= <identifier> ( <formal parameter list>? )
methodDeclarator : ID BRACE_O formalParameterList? BRACE_C;
//<method body> ::= <block> | ;
methodBody : block | DOT_C;
//<interface declaration> ::= <interface modifiers>? interface <identifier> <extends interfaces>? <interface body>
interfaceDeclaration : interfaceModifiers? INTERFACE ID extendsInterfaces? interfaceBody;
//<interface modifiers> ::= <interface modifier> | <interface modifiers> <interface modifier>
interfaceModifiers : interfaceModifier | interfaceModifiers interfaceModifier;
//<interface modifier> ::= public | abstract
interfaceModifier : PUBLIC | ABSTRACT;
//<extends interfaces> ::= extends <interface type> | <extends interfaces> , <interface type>
extendsInterfaces : EXTENDS interfaceType | extendsInterfaces COMMA interfaceType;
//<interface body> ::= { <interface member declarations>? }
interfaceBody : CB_O interfaceMemberDeclarations? CB_C;
//<interface member declarations> ::= <interface member declaration> | <interface member declarations> <interface member declaration>
interfaceMemberDeclarations : interfaceMemberDeclaration | interfaceMemberDeclarations interfaceMemberDeclaration;
//<interface member declaration> ::= <constant declaration> | <abstract method declaration>
interfaceMemberDeclaration : constantDeclaration | abstractMethodDeclaration;
//<constant declaration> ::= <constant modifiers> <type> <variable declarator>
constantDeclaration : constantModifiers type variableDeclarator;
//<constant modifiers> ::= public | static | final
constantModifiers : PUBLIC | STATIC | FINAL;
//<abstract method declaration>::= <abstract method modifiers>? <result type> <method declarator> <throws>? ;
abstractMethodDeclaration : abstractMethodModifiers? resultType methodDeclarator throwsRule? DOT_C;
//<abstract method modifiers> ::= <abstract method modifier> | <abstract method modifiers> <abstract method modifier>
abstractMethodModifiers : abstractMethodModifier | abstractMethodModifiers abstractMethodModifier;
//<abstract method modifier> ::= public | abstract
abstractMethodModifier : PUBLIC | ABSTRACT;
//<array initializer> ::= { <variable initializers>? , ? }
arrayInitializer : CB_O variableInitializers? COMMA QUESTION CB_C;
//<variable initializers> ::= <variable initializer> | <variable initializers> , <variable initializer>
variableInitializers : variableInitializer | variableInitializers COMMA variableInitializer;
//<variable initializer> ::= <expression> | <array initializer> (ja existe la em cima)

//TYPES
//<type> ::= <primitive type> | <reference type>
//type : primitiveType | referenceType;
type : primitiveType | classOrInterfaceType | type DIM_O DIM_C;

//<primitive type> ::= <numeric type> | boolean
primitiveType : numericType | BOOLEAN;
//<numeric type> ::= <integral type> | <floating-point type>
numericType : integralType | floatingPointType;
//<integral type> ::= byte | short | int | long | char
integralType : BYTE | SHORT | INT | LONG | CHAR;
//<floating-point type> ::= float | double
floatingPointType : FLOAT | DOUBLE_NUMBER;
//<reference type> ::= <class or interface type> | <array type>
referenceType : classOrInterfaceType | arrayType;
//<class or interface type> ::= <class type> | <interface type>
classOrInterfaceType : classType | interfaceType;
//<class type> ::= <type name>
classType : typeName;
//<interface type> ::= <type name>
interfaceType : typeName;
//<array type> ::= <type> [ ]
arrayType : type DIM_O DIM_C;


//BLOCKS AND COMANDS
//<block> ::= { <block statements>? }
block : CB_O blockStatements? CB_C;
//<block statements> ::= <block statement> | <block statements> <block statement>
blockStatements : blockStatement | blockStatements blockStatement;
//<block statement> ::= <local variable declaration statement> | <statement>
blockStatement : localVariableDeclarationStatement | statement;
//<local variable declaration statement> ::= <local variable declaration> ;
localVariableDeclarationStatement : localVariableDeclaration DOT_C;
//<local variable declaration> ::= <type> <variable declarators>
localVariableDeclaration : type variableDeclarators;
//<statement> ::= <statement without trailing substatement> | <labeled statement> | <if then statement> | <if then else statement>
//             | <while statement> | <for statement>
statement : statementWithoutTrailingSubstatement | labeledStatement | ifThenStatement | ifThenElseStatement | whileStatement | forStatement;
//<statement no short if> ::= <statement without trailing substatement> | <labeled statement no short if> | <if then else statement no short if>
//                        | <while statement no short if> | <for statement no short if>
statementNoShortIf : statementWithoutTrailingSubstatement | labeledStatementNoShortIf | ifThenElseStatementNoShortIf
                   | whileStatementNoShortIf | forStatementNoShortIf;
//<statement without trailing substatement> ::= <block> | <empty statement> | <expression statement> | <switch statement> | <do statement>
//                                          | <break statement> | <continue statement> | <return statement> | <synchronized statement>
//                                          | <throws statements> | <try statement>
statementWithoutTrailingSubstatement : block | emptyStatement | expressionStatement | switchStatement | doStatement | breakStatement
                                     | continueStatement | returnStatement | synchronizedStatement | throwsStatement | tryStatement;
//<empty statement> ::= ;
emptyStatement : DOT_C;
//<labeled statement> ::= <identifier> : <statement>
labeledStatement : ID COLON statement;
//<labeled statement no short if> ::= <identifier> : <statement no short if>
labeledStatementNoShortIf : ID COLON statementNoShortIf;
//<expression statement> ::= <statement expression> ;
expressionStatement : statementExpression DOT_C;
//<statement expression> ::= <assignment> | <preincrement expression> | <postincrement expression> | <predecrement expression>
//                        | <postdecrement expression> | <method invocation> | <class instance creation expression>
statementExpression : assignment | preIncrementExpression | postIncrementExpression | preDecrementExpression | postDecrementExpression
                    | methodInvocation | classInstanceCreationExpression;
//<if then statement>::= if ( <expression> ) <statement>
ifThenStatement : IF BRACE_O expression BRACE_C statement;
//<if then else statement>::= if ( <expression> ) <statement no short if> else <statement>
ifThenElseStatement : IF BRACE_O expression BRACE_C statementNoShortIf ELSE statement;
//<if then else statement no short if> ::= if ( <expression> ) <statement no short if> else <statement no short if>
ifThenElseStatementNoShortIf : IF BRACE_O expression BRACE_C statementNoShortIf ELSE statementNoShortIf;
//<switch statement> ::= switch ( <expression> ) <switch block>
switchStatement : SWITCH BRACE_O expression BRACE_C switchBlock;
//<switch block> ::= { <switch block statement groups>? <switch labels>? }
switchBlock : CB_O switchBlockStatementGroups? switchLabels? CB_C;
//<switch block statement groups> ::= <switch block statement group> | <switch block statement groups> <switch block statement group>
switchBlockStatementGroups : switchBlockStatementGroup | switchBlockStatementGroups switchBlockStatementGroup;
//<switch block statement group> ::= <switch labels> <block statements>
switchBlockStatementGroup : switchLabels blockStatements;
//<switch labels> ::= <switch label> | <switch labels> <switch label>
switchLabels :switchLabel | switchLabels switchLabel;
//<switch label> ::= case <constant expression> : | default :
switchLabel : CASE constantExpression COLON | DEFAULT COLON;
//<while statement> ::= while ( <expression> ) <statement>
whileStatement :  WHILE BRACE_O expression BRACE_C statement;
//<while statement no short if> ::= while ( <expression> ) <statement no short if>
whileStatementNoShortIf : WHILE BRACE_O expression BRACE_C statementNoShortIf;
//<do statement> ::= do <statement> while ( <expression> ) ;
doStatement : DO statement WHILE BRACE_O expression BRACE_C DOT_C;
//<for statement> ::= for ( <for init>? ; <expression>? ; <for update>? ) <statement>
forStatement : FOR BRACE_O forInit? DOT_C expression? DOT_C forUpdate? BRACE_C statement;
//<for statement no short if> ::= for ( <for init>? ; <expression>? ; <for update>? ) <statement no short if>
forStatementNoShortIf : FOR BRACE_O forInit? DOT_C expression? DOT_C forUpdate? BRACE_C statementNoShortIf;
//<for init> ::= <statement expression list> | <local variable declaration>
forInit : statementExpressionList | localVariableDeclaration;
//<for update> ::= <statement expression list>
forUpdate : statementExpressionList;
//<statement expression list> ::= <statement expression> | <statement expression list> , <statement expression>
statementExpressionList : statementExpression | statementExpressionList COMMA statementExpression;
//<break statement> ::= break <identifier>? ;
breakStatement : BREAK ID? DOT_C;
//<continue statement> ::= continue <identifier>? ;
continueStatement : CONTINUE ID? DOT_C;
//<return statement> ::= return <expression>? ;
returnStatement : RETURN expression? DOT_C;
//<throws statement> ::= throw <expression> ;
throwsStatement : THROW expression DOT_C;
//<synchronized statement> ::= synchronized ( <expression> ) <block>
synchronizedStatement : SYNCHRONIZED BRACE_O expression BRACE_C block;
//<try statement> ::= try <block> <catches> | try <block> <catches>? <finally>
tryStatement : TRY block catches | TRY block catches? finallyRule;
//<catches> ::= <catch clause> | <catches> <catch clause>
catches : catchClause | catches catchClause;
//<catch clause> ::= catch ( <formal parameter> ) <block>
catchClause : CATCH BRACE_O formalParameter BRACE_C block;
//<finally > ::= finally <block>
finallyRule : FINALLY block;

//EXPRESSION
//<constant expression> ::= <expression>
constantExpression : expression;
//<expression> ::= <assignment expression>
expression : assignmentExpression;
//<assignment expression> ::= <conditional expression> | <assignment>
assignmentExpression : conditionalExpression | assignment;
//<assignment> ::= <left hand side> <assignment operator> <assignment expression>
assignment : leftHandSide assignmentOperator assignmentExpression;
//<left hand side> ::= <expression name> | <field access> | <array access>
leftHandSide : expressionName | fieldAccess | arrayAccess;
//<assignment operator> ::= = | *= | /= | %= | += | -= | <<= | >>= | >>>= | &= | ^= | |=
assignmentOperator : ASSIGN | MUL_ASSIGN | DIV_ASSIGN | MOD_ASSIGN | ADD_ASSIGN | SUB_ASSIGN | LSHIFT_ASSIGN | RSHIFT_ASSIGN
                   | URSHIFT_ASSIGN | AND_ASSIGN | XOR_ASSIGN | OR_ASSIGN;
//<conditional expression> ::= <conditional or expression> | <conditional or expression> ? <expression> : <conditional expression>
conditionalExpression : conditionalOrExpression | conditionalOrExpression QUESTION expression COLON conditionalExpression;
//<conditional or expression> ::= <conditional and expression> | <conditional or expression> || <conditional and expression>
conditionalOrExpression : conditionalAndExpression | conditionalOrExpression OR conditionalAndExpression;
//<conditional and expression> ::= <inclusive or expression> | <conditional and expression> && <inclusive or expression>
conditionalAndExpression : inclusiveOrExpression | conditionalAndExpression AND inclusiveOrExpression;
//<inclusive or expression> ::= <exclusive or expression> | <inclusive or expression> | <exclusive or expression>
inclusiveOrExpression : exclusiveOrExpression | inclusiveOrExpression BITOR exclusiveOrExpression;
//<exclusive or expression> ::= <and expression> | <exclusive or expression> ^ <and expression>
exclusiveOrExpression : andExpression | exclusiveOrExpression CARET andExpression;
//<and expression> ::= <equality expression> | <and expression> & <equality expression>
andExpression : equalityExpression | andExpression BITAND equalityExpression;
//<equality expression> ::= <relational expression> | <equality expression> == <relational expression>
//                       | <equality expression> != <relational expression>
equalityExpression : relationalExpression | equalityExpression EQUAL relationalExpression | equalityExpression NOTEQUAL relationalExpression;
//<relational expression> ::= <shift expression> | <relational expression> < <shift expression> | <relational expression> > <shift expression>
//                        | <relational expression> <= <shift expression> | <relational expression> >= <shift expression>
//                        | <relational expression> instanceof <reference type>
relationalExpression : shiftExpression | relationalExpression LT shiftExpression | relationalExpression GT shiftExpression
                     | relationalExpression LE shiftExpression | relationalExpression GE shiftExpression
                     | relationalExpression INSTANCEOF referenceType;
//<shift expression> ::= <additive expression> | <shift expression> << <additive expression> | <shift expression> >> <additive expression>
//                   | <shift expression> >>> <additive expression>
shiftExpression : additiveExpression | shiftExpression LSHIT additiveExpression | shiftExpression RSHIFT additiveExpression
                | shiftExpression URSHIFT additiveExpression;
//<additive expression> ::= <multiplicative expression> | <additive expression> + <multiplicative expression>
//                       | <additive expression> - <multiplicative expression>
additiveExpression : multiplicativeExpression | additiveExpression ADD multiplicativeExpression
                   | additiveExpression SUB multiplicativeExpression;
//<multiplicative expression> ::= <unary expression> | <multiplicative expression> * <unary expression> | <multiplicative expression>
//                            / <unary expression> | <multiplicative expression> % <unary expression>
multiplicativeExpression : unaryExpression | multiplicativeExpression MUL unaryExpression | multiplicativeExpression DIV unaryExpression
                         | multiplicativeExpression MOD unaryExpression;
//<cast expression> ::= ( <primitive type> ) <unary expression> | ( <reference type> ) <unary expression not plus minus>
castExpression : BRACE_O primitiveType BRACE_C unaryExpression | BRACE_O referenceType BRACE_C unaryExpressionNotPlusMinus;
//<unary expression> ::= <preincrement expression> | <predecrement expression> | + <unary expression> | - <unary expression>
//                    | <unary expression not plus minus>
unaryExpression : preIncrementExpression | preDecrementExpression | ADD unaryExpression | SUB unaryExpression | unaryExpressionNotPlusMinus;
//<predecrement expression> ::= -- <unary expression>
preDecrementExpression : DEC unaryExpression;
//<preincrement expression> ::= ++ <unary expression>
preIncrementExpression : INC unaryExpression;
//<unary expression not plus minus> ::= <postfix expression> | ~ <unary expression> | ! <unary expression> | <cast expression>
unaryExpressionNotPlusMinus : postFixExpression | TILDE unaryExpression | BANG unaryExpression | castExpression;
//<postdecrement expression> ::= <postfix expression> --

//Resolvendo recursao a esquerda
postDecrementExpression : postFixExpression DEC;
//<postincrement expression> ::= <postfix expression> ++
postIncrementExpression : postFixExpression INC;
//<postfix expression> ::= <primary> | <expression name> | <postincrement expression> | <postdecrement expression>
postFixExpression : primary | expressionName | postFixExpression INC | postFixExpression DEC;

//Resolvendo outra recursão a esquerda
//<method invocation> ::= <method name> ( <argument list>? ) | <primary> . <identifier> ( <argument list>? )
//                     | super . <identifier> ( <argument list>? )
methodInvocation : methodName BRACE_O argumentList? BRACE_C | primary DOT ID BRACE_O argumentList? BRACE_C
                 | super DOT ID BRACE_O argumentList? BRACE_C;
//<field access> ::= <primary> . <identifier> | super . <identifier>
fieldAccess : primary DOT ID | super DOT ID;
//<primary> ::= <primary no new array> | <array creation expression>
primary : primaryNoNewArray | arrayCreationExpression;
//<primary no new array> ::= <literal> | this | ( <expression> ) | <class instance creation expression> | <field access> | <method invocation>
//                        | <array access>
primaryNoNewArray : literal | THIS | BRACE_O expression BRACE_C | classInstanceCreationExpression | fieldAccess | methodInvocation
                  | arrayAccess;
//<class instance creation expression> ::= new <class type> ( <argument list>? )
classInstanceCreationExpression : NEW classType BRACE_O argumentList? BRACE_C;
//<argument list> ::= <expression> | <argument list> , <expression>
argumentList : expression | argumentList COMMA expression;
//<array creation expression> ::= new <primitive type> <dim exprs> <dims>? | new <class or interface type> <dim exprs> <dims>?
arrayCreationExpression : NEW primitiveType dimExprs dims? | NEW classOrInterfaceType dimExprs dims?;
//<dim exprs> ::= <dim expr> | <dim exprs> <dim expr>
dimExprs : dimExpr | dimExprs dimExpr;
//<dim expr> ::= [ <expression> ]
dimExpr : DIM_O expression DIM_C;
//<dims> ::= [ ] | <dims> [ ]
dims : DIM_O DIM_C | dims DIM_O DIM_C;
//<array access> ::= <expression name> [ <expression> ] | <primary no new array> [ <expression>]
arrayAccess : expressionName DIM_O expression DIM_C | primaryNoNewArray DIM_O expression DIM_C;

//TOKENS
//<package name> ::= <identifier> | <package name> . <identifier>
packageName : ID | packageName DOT ID;
//<type name> ::= <identifier> | <package name> . <identifier>
typeName : ID | packageName DOT ID;
//<simple type name> ::= <identifier>
simpleTypeName : ID;
//<expression name> ::= <identifier> | <ambiguous name> . <identifier>
expressionName : ID | ambiguousName DOT ID;
//<method name> ::= <identifier> | <ambiguous name>. <identifier>
methodName : ID | ambiguousName DOT ID;
//<ambiguous name>::= <identifier> | <ambiguous name>. <identifier>
ambiguousName : ID | ambiguousName DOT ID;
//<literal> ::= <integer literal> | <floating-point literal> | <boolean literal> | <character literal> | <string literal> | <null literal>
literal : integerLiteral | floatingPointLiteral | booleanLiteral | CHARACTER | STRING | NULL;
//<integer literal> ::= <decimal integer literal> | <hex integer literal> | <octal integer literal>
integerLiteral : DECIMAL_NUMBER | HEX_NUMBER | OCTAL_NUMBER;
//<floating-point literal> ::= <digits> . <digits>? <exponent part>? <float type suffix>?
floatingPointLiteral : FLOAT_NUMBER | DOUBLE_NUMBER;
//<boolean literal> ::= true | false
booleanLiteral : TRUE | FALSE;

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
TRUE : 'true';
FALSE : 'false';

ASSIGN: '=';
GT: '>';
LT: '<';
BANG: '!';
TILDE: '~';
QUESTION: '?';
COLON: ':';
LSHIT : '<<';
RSHIFT : '>>';
URSHIFT : '>>>';
EQUAL: '==';
LE: '<=';
GE: '>=';
NOTEQUAL: '!=';
AND: '&&';
OR: '||';
INC: '++';
DEC: '--';
ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';
BITAND: '&';
BITOR: '|';
CARET: '^';
MOD: '%';
ADD_ASSIGN: '+=';
SUB_ASSIGN: '-=';
MUL_ASSIGN: '*=';
DIV_ASSIGN: '/=';
AND_ASSIGN: '&=';
OR_ASSIGN: '|=';
XOR_ASSIGN: '^=';
MOD_ASSIGN: '%=';
LSHIFT_ASSIGN: '<<=';
RSHIFT_ASSIGN: '>>=';
URSHIFT_ASSIGN: '>>>=';
DIM_O : '[';
DIM_C : ']';
CB_O : '{';
CB_C : '}';
COMMA: ',';
BRACE_O : '(';
BRACE_C : ')';
DOT : '.';
DOT_C : ';';
SYMBOL : '@';

ID : LETTER (LETTER| DIGIT | '_')*;
