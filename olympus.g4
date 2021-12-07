grammar olympus;


prule: 'hello' CHAR;


start: program;

program: class_type CLASS IDENTIFIER PAR_OPEN
    sentence*
    PAR_CLOSE
    BRACKET_OPEN sentence* BRACKET_CLOSE
    ;

sentence: var_deci | var_assign | println | dlc_int | dlc_deci | dlc_string | dlc_char | dlc_if |
print | aritmetic_sentences | dlc_bool //| dlc_array
;

dlc_int: INT IDENTIFIER ASSIGN NUMBER DOT;
dlc_deci: DECIMAL IDENTIFIER ASSIGN NUMBER DOT;
dlc_string: STRING IDENTIFIER ASSIGN QUOTES IDENTIFIER QUOTES DOT;
dlc_char: CHARACTER IDENTIFIER ASSIGN CHAR DOT;
dlc_bool: BOOL IDENTIFIER ASSIGN BOOLEAN DOT;

//EMPTYS

empty_string: QUOTES IDENTIFIER QUOTES;

//dlc_array: (INT|DECIMAL|STRING|CHAR) KEY_OPEN KEY_CLOSE IDENTIFIER ASSIGN KEY_OPEN (NUMBER|IDENTIFIER) KEY_CLOSE DOT ;

if_exception_sentence: var_deci | var_assign | println2 | dlc_int2 | dlc_deci2 | dlc_string2 | dlc_char2 | dlc_if |
print2 | aritmetic_sentences | dlc_bool2 //| dlc_array
;
dlc_int2: INT IDENTIFIER ASSIGN NUMBER;
dlc_deci2: DECIMAL IDENTIFIER ASSIGN NUMBER;
dlc_string2: STRING IDENTIFIER ASSIGN QUOTES IDENTIFIER QUOTES;
dlc_char2: CHARACTER IDENTIFIER ASSIGN CHAR;
dlc_bool2: BOOL IDENTIFIER ASSIGN BOOLEAN ;
println2: 'stampln' (NUMBER | IDENTIFIER | empty_string) ;
print2: 'stamp' (NUMBER | IDENTIFIER);


var_deci: VAR IDENTIFIER DOT;
var_assign: VAR IDENTIFIER ASSIGN NUMBER DOT;
//PRINTS
println: 'stampln' (NUMBER | IDENTIFIER) DOT;
print: 'stamp' (NUMBER | IDENTIFIER) DOT;
//println: PRINTLN IDENTIFIER DOT;
//print: PRINT IDENTIFIER DOT;



//VARIABLES
PROGRAM: 'program';
VAR: 'var';
INT: 'zeus';
DECIMAL: 'kratos';
STRING: 'ares';
CHARACTER: 'hera';
BOOL: 'artemis';
LET: 'let';


//let: IDENTIFIER '=' INT;
show: 'show' (INT | IDENTIFIER) DOT;




//ARITEMÉTICAS
aritmetic_sentences: olim_sum | olim_min | olim_mult | olim_div | olim_per;

olim_sum: (NUMBER|IDENTIFIER) PLUS (NUMBER|IDENTIFIER) DOT;
olim_min: (NUMBER|IDENTIFIER) MINUS (NUMBER|IDENTIFIER) DOT;
olim_mult: (NUMBER|IDENTIFIER) MULT (NUMBER|IDENTIFIER) DOT;
olim_div: (NUMBER|IDENTIFIER) DIV (NUMBER|IDENTIFIER) DOT;
olim_per: (NUMBER|IDENTIFIER) PERCENT (NUMBER|IDENTIFIER) DOT;

PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
PERCENT: '%';
EXP: '^';



//OPERADORES
AND: 'and';
OR: 'or';
NOT: 'not';


//FUNCIONES
FOR: 'sysiphus';
dlc_for: FOR PAR_OPEN if_sentences PAR_CLOSE BRACKET_OPEN sentence* BRACKET_CLOSE;

WHILE: 'while';
dlc_while: WHILE PAR_OPEN if_sentences PAR_CLOSE BRACKET_OPEN sentence* BRACKET_CLOSE;

IF: 'if';
dlc_if: IF PAR_OPEN if_sentences PAR_CLOSE BRACKET_OPEN if_exception_sentence* BRACKET_CLOSE;

if_sentences: gt_than | gt_eq_than | ls_eq_than | ls_than| eq_eq | ne_than |boolean;
gt_than: (IDENTIFIER) GT (NUMBER | IDENTIFIER);
gt_eq_than: (IDENTIFIER) GEQ (NUMBER | IDENTIFIER);
ls_than: (IDENTIFIER) LT (NUMBER | IDENTIFIER);
ls_eq_than: (IDENTIFIER) LEQ (NUMBER | IDENTIFIER);
eq_eq: (IDENTIFIER) EQ (NUMBER | IDENTIFIER);
ne_than: (IDENTIFIER) NEQ (NUMBER | IDENTIFIER);
boolean: (IDENTIFIER) EQ BOOLEAN;

ELSE: 'else';
IN: 'In';

//SIMBOLOS
GT: '>';
LT: '<';
GEQ: '=>';
LEQ: '=<';
EQ: '==';
NEQ: '!=';
ASSIGN: '=';

//CLASES
VOID: 'chaos';
CLASS: 'class';
IMPORT: 'nemesis';
PACKAGE: 'pck';
FUNCTION: 'func';
HERENCIA: 'Ext';

class_type: private_class | public_class;
public_class: 'pb';
private_class: 'pv';


BRACKET_OPEN:'{';
BRACKET_CLOSE:'}';

PAR_OPEN:'(';
PAR_CLOSE:')';

KEY_OPEN:'[';
KEY_CLOSE:']';

SEMICOLON:';';
QUOTES: '"';
DOT: '°';

IDENTIFIER: [a-zA-Z][a-zA-z0-9]*;
NUMBER:[0-9]+;
BOOLEAN: 'true+' | 'false-';
CHAR: 'a'..'z'  | 'A'..'Z';
WHITESPACE:['\t' | ' ' | '\r' | '\n']+ ->skip;