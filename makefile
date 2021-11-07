cs315_group14: y.tab.c lex.yy.c
	g++ -std=c++11 -o cs315_group14 y.tab.c 
y.tab.c: cs315_group14_yacc.y
	yacc cs315_group14_yacc.y
lex.yy.c: cs315_group14_lex.l
	lex cs315_group14_lex.l
clean:
	rm -f lex.yy.c y.tab.c cs315_group14
