let circle = "●"
let white_circle = "○"
let triangle = "▲"
let square = "◼"

let color_of_int = function
  | 0 -> `White
  | 1 -> `Red
  | 2 -> `Blue
  | 3 -> `Green
  | 4 -> `Yellow
  | 5 -> `Magenta
  | 6 -> `Cyan
  | _ -> `Yellow

let color a s =
  let attr = match a with
  | `White -> "white"
  | `Red -> "red"
  | `Blue -> "blue"
  | `Green -> "green"
  | `Yellow -> "yellow"
  | `Magenta -> "magenta"
  | `Cyan -> "cyan" in
  Printf.sprintf "$fg_no_bold[%s]%s$reset_color" attr s



let pick_color s =
  let seed = Hashtbl.hash s in
  Random.init seed;
  Random.int 8 |> color_of_int

let () =
  let h = Unix.gethostname () in
  let host_circle = color (pick_color h) circle in
  let login = Unix.getlogin() in
  let user_circle = if login = "root" then color `Red circle else color (pick_color login) circle in
  host_circle ^ user_circle |> Printf.printf "%s "
