%{

%}

%token <string> IDENT
%token IF THEN ELSE END DO WHILE ELSEIF FOR FUNCTION RETURN BREAK
%token EQ GT LT SEM NIL FALSE TRUE LSB RSB LB RB LCB LRB
%token PLUS MINUS STAR AND OR SHARP NOT TILDE DOT DIVIDE
%token EOF

%start file
%type <unit> file
%%
file:
 | EOF {()}
;
