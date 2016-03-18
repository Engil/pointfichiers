let circle = "●"
let white_circle = "○"
let triangle = "▲"
let square = "◼"

let color a s =
  Printf.sprintf "%%{%%F{%s}%%}%s%%{$reset_color%%}" a s

let pick_color s =
  let seed = Hashtbl.hash s in
  Random.init seed;
  Random.int 255 |> string_of_int

let () =
  let h = Unix.gethostname () in
  let host_circle = color (pick_color h) circle in
  let login = Unix.getlogin() in
  let user_circle = if login = "root" then color "red" circle else color (pick_color login) circle in
  let pwd = color "black" "%{$fg_bold[black]%}$(get_pwd)" in
  Printf.printf "%s%s %s " user_circle host_circle pwd
