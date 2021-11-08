parser: y.tab.c lex.yy.c
	g++ -std=c++11 -o parser y.tab.c 
y.tab.c: CS315f21_team14.yacc
	yacc CS315f21_team14.yacc
lex.yy.c: CS315f21_team14.lex
	lex CS315f21_team14.lex
clean:
	rm -f lex.yy.c y.tab.c parser
