%{
#include<stdio.h>
int yyerror(char *c);
char s='%';
%}


%token Num
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'


%%
E : E '+' E	{printf("+");}
E : E '-' E	{printf("-");}
E : E '*' E	{printf("*");}
E : E '/' E	{printf("/");}
E : E '%' E	{printf("%c",s);}
E : '(' E ')'	{}
E : Num	{printf("%d",$1);}
%%

int main()
{
printf("Enter expression");
yyparse();
return 0;
}


int yyerror(char *c)
{
printf("%s",c);
return 0;
}