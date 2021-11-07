%option yylineno
begin begin
end end
if if
endif endif
else else
while while
for for
endwhile endwhile
endfor endfor
return return
func func
endfunc endfunc
input in
output print
true "true"
false "false"
and "&"
or "|"
north "NORTH"
south "SOUTH"
west "WEST"
east "EAST"
way {north}|{south}|{east}|{west}
types "integer"|"float"|"string"|"boolean"|"way"
math_op_add \+
math_op_sub \-
math_op_div \/
math_op_mod \%
math_op_mult \*
bigger ">"
smaller "<"
dot "."
and_relational "&&"
or_relational "||"
not "!"
biggerOrEq ">="
smallerOrEq "<="
not_eq "!="
end_line ";"
tab "\t"
comma ","
space_char " "
bool {true}|{false}
comment_sign "***"
left_brace "{"
right_brace "}"
left_paranthesis "("
right_paranthesis ")"
colon ":"
new_line "\n"
underscore_ch "_"
digit [0-9]
int ({math_op_add}|{math_op_sub})?{digit}+
float {int}*{dot}?{digit}+
assign_op ({math_op_add}|{math_op_mult}|{math_op_div}|{math_op_mod}|{math_op_sub})"="|"="
eq "=="
identifier [a-zA-Z][a-zA-Z0-9]*
parameter {types}{identifier}
turnLeft turnLeft{left_paranthesis}{right_paranthesis}
turnRight turnRight{left_paranthesis}{right_paranthesis}
readAltitude readAltitude{left_paranthesis}{right_paranthesis}
readHeading readHeading{left_paranthesis}{right_paranthesis}
readVelocity readVelocity{left_paranthesis}{right_paranthesis}
up up{left_paranthesis}{right_paranthesis} 
down down{left_paranthesis}{right_paranthesis} 
stop stop{left_paranthesis}{right_paranthesis} 
forward forward{left_paranthesis}{right_paranthesis} 
backward backward{left_paranthesis}{right_paranthesis} 
readTemp readTemp{left_paranthesis}{right_paranthesis} 
on on{left_paranthesis}{right_paranthesis} 
off off{left_paranthesis}{right_paranthesis} 
connect connect{left_paranthesis}{right_paranthesis} 
disconnect disconnect{left_paranthesis}{right_paranthesis} 
status status{left_paranthesis}{right_paranthesis} 
string \'({identifier}|{int}|{math_op_div}|{math_op_add}|{math_op_mod}|{math_op_mult}|{math_op_sub}|{space_char}|{dot}|"/")*\'
%%
{begin} return START;
{end}   return END;
{if}    return IF;
{else}  return ELSE;
{while} return WHILE;
{for}   return FOR;
{and}   return AND;
{or}    return OR;
{func}  return FUNC;
{endif} return ENDIF;
{colon} return COLON;
{types} return TYPES;
{digit} return DIGIT;
{bool}  return BOOL;
{int}   return INT;
{float} return FLOAT;
{input} return INPUT;
{dot}   return DOT;
{bigger}    return BIGGER;
{smaller}   return SMALLER;
{biggerOrEq}  return BIGGEROREQ;
{smallerOrEq} return SMALLEROREQ;
{not}         return NOT;
{endfunc}   return ENDFUNC;
{output}    return OUTPUT;
{return}    return RETURN;
{not_eq}    return NOT_EQ;
{end_line}  return END_LINE;
{endwhile}  return ENDWHILE;
{endfor}    return ENDFOR;
{comma}     return COMMA;
{string}    return STRING;
{eq}  return EQ;
{math_op_add}   return MATH_OP_ADD;
{math_op_mult}  return MATH_OP_MULT;
{math_op_sub}   return MATH_OP_SUB;
{math_op_div}   return MATH_OP_DIV;
{math_op_mod}   return MATH_OP_MOD;
{assign_op}     return ASSIGN_OP;
{comment_sign}  return COMMENT_SIGN;
{left_brace}     return LEFT_BRACE;
{right_brace}    return RIGHT_BRACE;
{left_paranthesis}     return LEFT_PARANTHESIS;
{right_paranthesis}    return RIGHT_PARANTHESIS;
{underscore_ch} return UNDERSCORE_CH;
{parameter}     return PARAMETER;
{turnLeft}      return TURNLEFT;
{turnRight}     return TURNRIGHT;
{readAltitude}  return READALTITUDE;
{readHeading}   return READHEADING;
{readVelocity}  return READVELOCITY;
{up}   return UP;
{down} return DOWN;
{stop} return STOP;
{forward}   return FORWARD;
{backward}  return BACKWARD;
{readTemp}  return READTEMP;
{on}        return ON;
{off}       return OFF;
{connect}   return CONNECT;
{disconnect} return DISCONNECT;
{status}    return STATUS;
{identifier}    return IDENTIFIER;
{tab}   ;
{space_char}    ;
{new_line}      ;
%%
int yywrap() { return 1; }
