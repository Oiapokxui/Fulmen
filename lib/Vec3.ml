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

let inverse vec = vec * -1.

let zero = { x = 0.0 ; y = 0.0; z = 0.0} 

let length vec = 
    Core.Float.(+) (vec.x ** 2.0) (vec.y ** 2.0)
    |> Core.Float.(+) (vec.z ** 2.0)  
    |> sqrt

let unit vec = vec / (length vec)

let to_list (vec : vector) : float list = [vec.x ; vec.y ; vec.z]

let ( *. ) (vec_a:vector) (vec_b:vector) = 
    let components_multiplied = 
        Core.List.map 
            (Core.List.zip_exn (to_list vec_a) (to_list vec_b)) 
            ~f:(fun (a, b) -> Core.Float.( * ) a  b) 
    in
        Core.List.fold_left 
            components_multiplied 
            ~init:0.0 
            ~f: Core.Float.(+) 

let ( +. ) vec_a vec_b  = {
    x = Core.Float.( * ) vec_a.y vec_b.z |> Core.Float.(+) (Core.Float.( * ) vec_a.z vec_b.y) ;
    y = Core.Float.( * ) vec_a.x vec_b.z |> Core.Float.(+) (Core.Float.( * ) vec_a.z vec_b.x) ;
    z = Core.Float.( * ) vec_a.x vec_b.y |> Core.Float.(+) (Core.Float.( * ) vec_a.y vec_b.x) 
}