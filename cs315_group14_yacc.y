%{
    #include <iostream>
    #include <string>
    using namespace std;
    extern int yylineno;
    void yyerror(string);
    int yylex(void);
    int numOfError;    
%}
%token START
%token END
%token IF
%token ELSE
%token WHILE
%token FOR
%token AND
%token OR
%token FUNC
%token ENDIF
%token COLON
%token TYPES
%token DIGIT
%token BOOL
%token INT
%token FLOAT
%token INPUT
%token DOT
%token BIGGER
%token SMALLER
%token BIGGEROREQ
%token SMALLEROREQ
%token NOT
%token ENDFUNC
%token OUTPUT
%token RETURN
%token NOT_EQ
%token END_LINE
%token ENDWHILE
%token ENDFOR
%token COMMA
%token STRING
%token EQ
%token MATH_OP_ADD
%token MATH_OP_MULT
%token MATH_OP_SUB
%token MATH_OP_DIV
%token MATH_OP_MOD
%token ASSIGN_OP
%token COMMENT_SIGN
%token LEFT_BRACE
%token RIGHT_BRACE
%token LEFT_PARANTHESIS
%token RIGHT_PARANTHESIS
%token UNDERSCORE_CH
%token PARAMETER
%token TURNLEFT
%token TURNRIGHT
%token READALTITUDE
%token READHEADING
%token READVELOCITY
%token UP
%token DOWN
%token STOP
%token FORWARD
%token BACKWARD
%token READTEMP
%token ON
%token OFF
%token CONNECT
%token DISCONNECT
%token STATUS
%token IDENTIFIER

%%
program:
        START stmts END  
stmts:
        stmt | stmts stmt
stmt:
        expr | comment | loop_types | func_call | func_def | if_stmt | output | input
comment:
        COMMENT_SIGN IDENTIFIER COMMENT_SIGN
expr:
        math_expr | string_expr | int_expr | bool_expr | float_expr
math_expr:
        math_expr MATH_OP_ADD math_term | math_expr MATH_OP_SUB math_term | math_term
math_term:
        math_term MATH_OP_MULT math_factor | math_term MATH_OP_DIV math_factor | math_term MATH_OP_MOD math_factor | math_factor
math_factor:
        LEFT_PARANTHESIS math_expr RIGHT_PARANTHESIS | INT
string_expr:
        IDENTIFIER ASSIGN_OP STRING END_LINE
int_expr:
        IDENTIFIER ASSIGN_OP INT END_LINE
        | IDENTIFIER ASSIGN_OP DIGIT END_LINE
bool_expr:
        IDENTIFIER ASSIGN_OP BOOL END_LINE
float_expr:
        IDENTIFIER ASSIGN_OP FLOAT END_LINE
relation:
        BIGGER | SMALLER | BIGGEROREQ | SMALLEROREQ
relational_expr:
        IDENTIFIER relation IDENTIFIER | INT relation INT | FLOAT relation FLOAT 
        | IDENTIFIER EQ IDENTIFIER | IDENTIFIER NOT_EQ IDENTIFIER | INT EQ INT | INT NOT_EQ INT
        | FLOAT EQ FLOAT | FLOAT NOT_EQ FLOAT 
        | altitude EQ INT | altitude NOT_EQ INT | altitude relation INT
        | altitude EQ IDENTIFIER | altitude NOT_EQ IDENTIFIER | altitude relation IDENTIFIER
        | altitude EQ FLOAT | altitude NOT_EQ FLOAT | altitude relation FLOAT
        | heading EQ INT | heading NOT_EQ INT | heading relation INT
        | heading EQ IDENTIFIER | heading NOT_EQ IDENTIFIER | heading relation IDENTIFIER
        | heading EQ DIGIT | heading NOT_EQ DIGIT | heading relation DIGIT
        | heading EQ FLOAT | heading NOT_EQ FLOAT | heading relation FLOAT
        | velocity EQ DIGIT | velocity NOT_EQ DIGIT | velocity relation DIGIT
        | velocity EQ IDENTIFIER | velocity NOT_EQ IDENTIFIER | velocity relation IDENTIFIER
        | velocity EQ INT | velocity NOT_EQ INT | velocity relation INT
        | velocity EQ FLOAT | velocity NOT_EQ FLOAT | velocity relation FLOAT
        | temp EQ INT | temp NOT_EQ INT | temp EQ FLOAT | temp NOT_EQ FLOAT | temp relation FLOAT | temp relation INT
        | nozzle_stat EQ BOOL | nozzle_stat NOT_EQ BOOL    
        | wifi_conn EQ STRING | wifi_conn NOT_EQ STRING 
block_stmt:
        stmts RETURN TYPES | stmts 
if_stmt:
        IF LEFT_PARANTHESIS condition RIGHT_PARANTHESIS COLON block_stmt ELSE COLON block_stmt ENDIF 
        | IF LEFT_PARANTHESIS condition RIGHT_PARANTHESIS COLON block_stmt ENDIF
condition:
        relational_expr | func_call
func_call:
        IDENTIFIER LEFT_PARANTHESIS PARAMETER RIGHT_PARANTHESIS END_LINE | IDENTIFIER LEFT_PARANTHESIS RIGHT_PARANTHESIS END_LINE 
        | TURNLEFT END_LINE | TURNRIGHT END_LINE | READALTITUDE END_LINE | READHEADING END_LINE | READVELOCITY END_LINE
        | UP END_LINE | DOWN END_LINE | STOP END_LINE | FORWARD END_LINE | BACKWARD END_LINE | READTEMP END_LINE | ON END_LINE | OFF END_LINE | CONNECT END_LINE | DISCONNECT END_LINE | STATUS END_LINE 
func_def:
        FUNC TYPES IDENTIFIER LEFT_PARANTHESIS PARAMETER RIGHT_PARANTHESIS COLON block_stmt ENDFUNC
        | FUNC TYPES IDENTIFIER LEFT_PARANTHESIS RIGHT_PARANTHESIS COLON block_stmt ENDFUNC
loop_types:
        while | for
while:
        WHILE LEFT_PARANTHESIS condition RIGHT_PARANTHESIS COLON block_stmt ENDWHILE
for:
        FOR LEFT_PARANTHESIS for_condition RIGHT_PARANTHESIS COLON block_stmt ENDFOR
for_condition:
        IDENTIFIER ASSIGN_OP DIGIT END_LINE IDENTIFIER relation INT END_LINE MATH_OP_ADD    
input:
        INPUT IDENTIFIER END_LINE
output:
        OUTPUT LEFT_PARANTHESIS STRING RIGHT_PARANTHESIS END_LINE 
        | OUTPUT LEFT_PARANTHESIS STRING COMMA DIGIT COMMA STRING RIGHT_PARANTHESIS END_LINE 
        | OUTPUT LEFT_PARANTHESIS STRING COMMA FLOAT COMMA STRING RIGHT_PARANTHESIS END_LINE 
turn_heading:
        TURNLEFT | TURNRIGHT
altitude:
        READALTITUDE
heading:
        READHEADING
velocity:
        READVELOCITY
go_vertical:
        UP | DOWN | STOP
go_horizontal:
        FORWARD | BACKWARD | STOP
temp:
        READTEMP
wifi_conn:
        CONNECT | DISCONNECT | STATUS
nozzle_stat:
        ON | OFF
%%
#include "lex.yy.c"
extern int yylineno;
void yyerror(string err){
    numOfError++;
    cout<<"Syntax error on line "<< yylineno << "! " << err <<endl;
}

int main(){
    numOfError = 0;
    yyparse();
    if(numOfError > 0){
        cout<<"The program is invalid with "<<numOfError<<" errors"<<endl;
    } else {
        cout<<"The program parsed successfully"<<endl;
    }
    return 0;
}