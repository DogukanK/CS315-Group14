run: cs315_group14 test1.txt test2.txt
	./cs315_group14 < test1.txt > testOutput1.txt && ./cs315_group14 < test2.txt > testOutput2.txt
cs315_group14: lex.yy.c
	gcc -o cs315_group14 lex.yy.c 
lex.yy.c: cs315_group14_lex.l
	lex cs315_group14_lex.l
clean:
	rm -f lex.yy.c cs315_group14
