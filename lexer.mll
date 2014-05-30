{
  open Parser
  open Lexing

  let check_ident =
    let keywords = [
      IF, "if"; THEN, "then"; ELSE, "else"; END, "end";
      DO, "do"; WHILE, "while"; ELSEIF, "elseif";
      FOR, "for"; FUNCTION, "function"; RETURN, "return";
      BREAK, "break"; NIL, "nil"; FALSE, "false";
      TRUE, "true"; AND, "and"; OR, "or"; NOT, "not"] in
    let hashtable = Hashtbl.create 17 in
    List.iter (fun (value, key) -> Hashtbl.add hashtable key value) keywords;
    fun string -> try Hashtbl.find hashtable string
      with Not_found -> IDENT string
}

let alpha = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let ident = (alpha | '_') (alpha | digit | '_')*


rule token = parse
(* | '\n' *)
(*     {} *)
(* | '=' *)
(*   {EQ} *)
(* | '*' {STAR} | '+' {PLUS} | '-' {MINUS} | '/' {DIVIDE} | '#' {SHARP} *)
(* | '~' {TILDE} | '<' {LT} | '>' {GT} | '(' {LB} | ')' {RB} *)
(* | ident {check_ident (lexeme lexbuff)} *)
| eof {EOF}
