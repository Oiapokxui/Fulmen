(* type *)
type vector 

(* constructor *)
val from : float -> float -> float -> vector

(* infix operators *)
val ( + ) : vector -> vector -> vector
val ( * ) : vector -> float -> vector
val ( / ) : vector -> float -> vector
val ( @ ) : vector -> vector -> float (* dot product *)

(* values *)
val zero : vector
val length : vector -> float
val unit : vector -> vector