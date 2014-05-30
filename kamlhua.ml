


open Parser
open Lexer
open Format

let debug = ref false
let parse_only = ref false

let msg = "usage: project [options] file"
let spec = [ "--debug", Arg.Set debug, "  Set the debug flag";
	           "--parse-only", Arg.Set parse_only, "  Stop after parsing";]


let file = ref None
let set_file f = match !file with
  | Some _ -> Arg.usage spec msg; exit 1
  | None when Sys.file_exists f -> file := Some f
  | None -> Printf.eprintf "%s: no such file@." f; exit 1


let parse_file fname =
  let c = open_in fname in
  let lb = Lexing.from_channel c in
  let p =
    try
	    Parser.file token lb
    with
	  | _ ->
  	  eprintf "\nlexical error";
  	  exit 1
  in
  close_in c;
  p

let ptree = match !file with
  | Some f -> parse_file f
  | None -> exit 0


let () = Arg.parse spec set_file msg




let () =
  Printf.printf "Start\n"
