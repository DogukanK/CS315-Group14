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
types "integer"|"float"|"string"|"boolean"
math_op_add \+
math_op_sub \-
math_op_div \/
math_op_mod \%
math_op_mult \*
bigger >
smaller <
dot "."
and "&&"
or "||"
not_eq "!="
end_line ";"
tab "\t"
comma ","
space_char " "
bool "true"|"false"
comment_sign \*\*\*
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
{identifier}    printf("identifier ");
{tab}   ;
{space_char}    ;
{new_line}       printf("\n");
%%

int main(){
    yylex();
    return 0;
}
