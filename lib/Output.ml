open Base
open Stdio

type file_type = Caml.out_channel [@@deriving_inline sexp_of]

let build_image (width:int) (height:int) (file:file_type) =
  let _ = Out_channel.fprintf file "P3\n%d %d\n 255\n" width height in
  (Sequence.cartesian_product
     (Sequence.range ~stride: (-1)
                     ~stop: `inclusive (height - 1)
                     ~start: `inclusive 0)
     (Sequence.range ~stride: 1
                     ~stop: `inclusive 0
                     ~start: `inclusive (width - 1)))
  |> Sequence.iter
       ~f:(fun (j, i) ->
         let _ = printf "Iteration pair: (%d, %d)\n" j i in
         let r = Float.of_int(i) /. Float.of_int(width)
         and g = Float.of_int(j) /. Float.of_int(height)
         and b = 0.25 in
         let ir = Float.to_int(255.999 *. r)
         and ig = Float.to_int(255.999 *. b)
         and ib = Float.to_int(255.999 *. g) in
         Out_channel.fprintf file "%d %d %d\n" ir ib ig)

let ppm_file (file_name:string) (width:int) (height:int) =
  let file = Stdio.Out_channel.create file_name in
  build_image width height file
