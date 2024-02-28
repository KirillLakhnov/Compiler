FILE_NAME := test_file/test.txt

all:
	flex --header-file=frontend/lexer/generated_file/language_token.h -o frontend/lexer/generated_file/language_token.c frontend/lexer/language_token.l
	g++ main.cpp frontend/lexer/generated_file/language_token.c
	./a.out $(FILE_NAME)

flex:
	flex --header-file=frontend/lexer/generated_file/language_token.h -o frontend/lexer/generated_file/language_token.c frontend/lexer/language_token.l

token: main.cpp frontend/lexer/generated_file/language_token.c
	g++ main.cpp lfrontend/lexer/generated_file/language_token.c
 