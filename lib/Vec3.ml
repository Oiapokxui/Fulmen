open Core.Float
  
type vector = {x: float; y: float; z: float}

let ( + ) vec_a vec_b = { 
    x = vec_a.x + vec_b.x;
    y = vec_a.y + vec_b.y;
    z = vec_a.z + vec_b.z;
}

let ( * ) vec (scalar : float) = { 
    x = vec.x * scalar;
    y = vec.y * scalar;
    z = vec.z * scalar;
}

let ( / ) vec (scalar : float) = { 
    x = vec.x / scalar;
    y = vec.y / scalar;
    z = vec.z / scalar;
}

let from x y z = { x = x ; y = y; z = z}

let zero = { x = 0.0 ; y = 0.0; z = 0.0} 

let length vec = 
    Core.Float.(+) (vec.x ** 2.0) (vec.y ** 2.0)
    |> add (vec.z ** 2.0)  
    |> sqrt

let unit vec = vec / (length vec)

let to_list (vec : vector) : float list = [vec.x ; vec.y ; vec.z]

let ( @ ) (a:vector) (b:vector) = 
    Core.List.map 
        (Core.List.zip_exn (to_list a) (to_list b)) 
        ~f:(fun (a, b) -> Core.Float.( * ) a  b)
    |> fun x -> 
        Core.List.fold_left 
            x 
            ~init:0.0 
            ~f: Core.Float.(+) 