module type Vec3_type = sig

    (* type *)
    type vector 
    (* infix operators *)
    (* val ( + ) : vector -> vector -> vector
    val ( * ) : vector -> float -> vector
    val ( / ) : vector -> float -> vector *)

    (* values *)
    val zero : vector
    val getX : vector -> float
    val getY : vector -> float
    val getZ : vector -> float
    val length : vector -> float

end

module Vec3 : Vec3_type = struct 
    type vector = (float * float * float)
    let zero = (0.0, 0.0, 0.0)

    let getX ( (x, _, _) : vector) = x
    let getY ( (_, y, _) : vector) = y
    let getZ ( (_, _, z) : vector) = z

    let length vec = 0.0
  end 