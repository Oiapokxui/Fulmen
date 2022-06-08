module Vec3 : 
  sig

    (* type *)
    type vector = (float * float * float)

    (* infix operators *)
    val ( + ) : vector -> vector -> vector
    val ( * ) : vector -> float -> vector
    val ( / ) : vector -> float -> vector

    (* values *)
    val zero : vector
    val getX : vector -> float
    val getY : vector -> float
    val getZ : vector -> float
    val length : vector -> float

  end