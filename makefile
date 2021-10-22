cs315_group14: lex.yy.c
	gcc -o cs315_group14 lex.yy.c
lex.yy.c: cs315_group14_lex.l
	lex cs315_group14_lex.l
clean:
	rm -f lex.yy.c cs315_group14