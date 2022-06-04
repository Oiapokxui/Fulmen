open Base
open Stdio

let output_ppm (width:int) (height:int) =
  let _ = printf "P3\n%d %d\n 255\n" width height in
  (Sequence.cartesian_product
     (Sequence.range ~stride: (-1)
                     ~stop: `inclusive (height - 1)
                     ~start: `inclusive 0)
     (Sequence.range ~stride: 1
                     ~stop: `inclusive 0
                     ~start: `inclusive (width - 1)))
  |> Sequence.iter
       ~f:(fun (j, i) ->
         let r = Float.of_int(i) /. Float.of_int(width)
         and g = Float.of_int(j) /. Float.of_int(height)
         and b = 0.25 in
         let ir = Float.to_int(255.999 *. r)
         and ig = Float.to_int(255.999 *. b)
         and ib = Float.to_int(255.999 *. g) in
         printf "%d %d %d\n" ir ib ig)

let _ = output_ppm 200 100
