/*
 * Entrega N1
 */

class PortugolParser extends Parser;

{
    String str;
}

statement:
     ifStatement|
     whileLoop|
     forLoop|
     vars
;

statementBlock:
    OPEN_KEY
    (statement)+
    CLOSE_KEY
;

ifStatement:
    IF
    OPEN_PARENTHESES
    boolean_structure
    CLOSE_BRACKET
    (statement|statementBlock)
    ELSE
    (statement|statementBlock)
;

whileLoop:
    WHILE
    OPEN_BRACKET
    boolean_structure
    CLOSE_BRACKET
    (statement|statementBlock)
;

vars:
    type
    ID
    (EQUAL (math_structure|boolean_structure|STRING))
    END
;

method:
    ID
;

math_structure:
    math_member (math_operator math_member)*
;

math_member:
    (OPEN_BRACKET math_structure CLOSE_BRACKET)|
    NUMBER|
    ID
;

math_operator:
    MULT|DIV|ADD|SUB
;

boolean_structure:
    boolean_member (boolean_operator boolean_member)*
;

boolean_member:
    (OPEN_BRACKET boolean_structure CLOSE_BRACKET)|
    (TRUE|FALSE)|
    ID
;

boolean_operator:
    AND|OR
;

type:
    NUMBER|BOOLEAN|STRING
;

class AtribuicaoLexer extends Lexer;

options {
    k = 1;
}

tokens {
    NUMBER = "numero";
    BOOLEAN = "boleano";
    STRING = "caracteres";
    TRUE = "verdadeiro";
    FALSE = "falso";
    IF = "se";
    ELSE = "senao";
    WHILE = "enquanto";
    FOR = "repita";
    READ = "leia";
    WRITE = "escreva";
    AND = "e";
    OR = "ou";
    NOT = "nao";
}

EQUAL:
    '='
;

END:
    ';'
;

ID:
    ('a'..'z'|'_')('a'..'z'|'A'..'Z' |'0'..'9'|'_')*
;

OPEN_PARENTHESES:
    '('
;

CLOSE_PARENTHESES:
    ')'
;

OPEN_KEY:
    '{'
;

CLOSE_KEY:
    '}'
;

ADD:
    '+'
;

SUB:
    '-'
;

MULT:
    '*'
;

DIV:
    '/'
;

NUMBER:
    ('0'..'9')+('.'('0'..'9')+)?
;

STRING:
    ('a'..'z')('a'..'z' | 'A'..'Z')*
;

T_space: ('\t' | ' ' | '\r' '\n' | '\n') + { _ttype = Token.SKIP; };
