open Notty
open Notty.Infix

let code (severity : Diagnostic.severity) : attr =
  match severity with
  | Hint -> A.fg A.blue
  | Info -> A.fg A.green
  | Warning -> A.fg A.yellow
  | Error -> A.fg A.red
  | Bug -> A.bg A.red ++ A.fg A.black

let message (severity : Diagnostic.severity) (tag : TtyTag.t) : attr =
  match tag with
  | Extra _, _ -> A.empty
  | Main, _ -> code severity

let highlight (severity : Diagnostic.severity) : TtyTag.t option -> attr =
  function
  | None -> A.empty
  | Some tag -> A.st A.underline ++ message severity tag

let fringe = A.fg @@ A.gray 8

let indentation = A.fg @@ A.gray 8