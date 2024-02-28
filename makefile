FILE_NAME := test_file/test.txt

all:
	flex --header-file=lexer/tokinization/generated_file/language_token.h -o lexer/tokinization/generated_file/language_token.c lexer/tokinization/language_token.l
	g++ main.cpp lexer/tokinization/generated_file/language_token.c
	./a.out $(FILE_NAME)

flex:
	flex --header-file=lexer/tokinization/generated_file/language_token.h -o lexer/tokinization/generated_file/language_token.c lexer/tokinization/language_token.l

token: main.cpp lexer/tokinization/generated_file/language_token.c
	g++ main.cpp lexer/tokinization/generated_file/language_token.c
 