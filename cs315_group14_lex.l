%{
    #include <stdio.h>
    void yyerror(char*);
%}
%option noyywrap

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
bigger >
smaller <
dot "."
and_relational "&&"
or_relational "||"
not "!"
biggerOrEq >=
smallerOrEq <=
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
assign_op (({math_op_add}|{math_op_mult}|{math_op_div}|{math_op_mod}|{math_op_sub})=|=)
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
string \'({identifier}|{int}|{math_op_div}|{math_op_add}|{math_op_mod}|{math_op_mult}|{math_op_sub}|{space_char}|{dot})*\'
group_name show_teamM8s  

%%

{begin} printf("begin ");
{end}   printf("end\n"); exit(0);
{if}    printf("if ");
{else}  printf("else ");
{while} printf("while ");
{for}   printf("for ");
{and}   printf("and ");
{or}    printf("or ");
{func}  printf("func ");
{endif} printf("endif ");
{colon} printf("colon ");
{types} printf("type ");
{digit} printf("digit ");
{bool}  printf("bool ");
{int}   printf("int ");
{float} printf("float ");
{input} printf("input ");
{dot}   printf("dot ");
{bigger}    printf("bigger ");
{smaller}   printf("smaller ");
{biggerOrEq} printf("bigger or equal ");
{smallerOrEq} printf("smaller or equal ");
{not}   printf("not ");
{endfunc}   printf("endfunc ");
{output}    printf("output ");
{return}    printf("return ");
{not_eq}    printf("not_eq ");
{end_line}  printf("end_line ");
{endwhile}  printf("endwhile ");
{endfor}    printf("endfor ");
{comma}     printf("comma ");
{string}    printf("string ");
{group_name}   printf("Idil Yilmaz, Dogukan Ertunga Kurnaz, Turgut Alp Edis ");
{eq}  printf("eq ");
{math_op_add}   printf("math_op_add ");
{math_op_mult}  printf("math_op_mult ");
{math_op_sub}   printf("math_op_sub ");
{math_op_div}   printf("math_op_div ");
{math_op_mod}   printf("math_op_mod ");
{assign_op}     printf("assign_op ");
{comment_sign}  printf("comment_sign ");
{left_brace}     printf("left_brace ");
{right_brace}     printf("right_brace ");
{left_paranthesis}    printf("left_paranthesis ");
{right_paranthesis}    printf("right_paranthesis ");
{underscore_ch} printf("underscore_ch ");
{parameter} printf("parameter ");
{turnLeft} printf("turnLeft "); 
{turnRight} printf("turnRight ");
{readAltitude} printf("readAltitude ");
{readHeading} printf("readHeading ");
{readVelocity} printf("readVelocity ");
{up}    printf("up "); 
{down} printf("down ");
{stop} printf("stop ");
{forward} printf("forward ");
{backward} printf("backward ");
{readTemp}  printf("readTemp ");
{on}  printf("on ");
{off}  printf("off ");
{connect}  printf("connect ");
{disconnect} printf("disconnect ");
{status}    printf("status ");
{identifier}    printf("identifier ");
{tab}   ;
{space_char}    ;
{new_line}       printf("\n");
%%

int main(){
    yylex();
    return 0;
}
