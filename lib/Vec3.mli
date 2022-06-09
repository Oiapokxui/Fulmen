(* type *)
type vector 

(* constructor *)
val from : float -> float -> float -> vector

(* infix operators *)
val ( + ) : vector -> vector -> vector
val ( * ) : vector -> float -> vector
val ( / ) : vector -> float -> vector
(* dot product. When an asterisk is seen from far away, it looks like a dot.  *)
val ( *. ) : vector -> vector -> float 
(* dot product. A plus sign is a cross rotated by 45 degrees.  *)
val ( +. ) : vector -> vector -> vector 
(* values *)
val zero : vector
val length : vector -> float
val unit : vector -> vector
val inverse : vector -> vector