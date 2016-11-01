let circle = "●"
let white_circle = "○"
let triangle = "▲"
let square = "◼"

let color a s =
  Printf.sprintf "%%{%%F{%s}%%}%s%%{$reset_color%%}" a s

let pick_color _ =
  Random.self_init ();
  Random.int 255 |> string_of_int

let () =
  let clrs =
    [
      color (pick_color ()) circle;
      color (pick_color ()) circle;
      color (pick_color ()) circle;
      color (pick_color ()) circle;
    ] in
  let prompt = List.fold_left (^) "" clrs in
  Printf.printf "%s " prompt
