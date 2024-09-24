#' The Euclidean algorithm
#' 
#' The algorithm takes two numeric scalars and applies the Euclidean
#' algorithm to it. In the case these two numeric scalars are
#' integers the greatest common divisor is yielded.
#' 
#' A description with pseudocode can be found at the Wikipedia page here: 
#' https://en.wikipedia.org/wiki/Euclidean_algorithm.

#' 
#' @param x A numeric scalar
#' @param y A numeric scalar
#' @return The Euclidean algorithm on x and y. For the case of two integers, the GCD is yielded. 


euclidean <- function(x,y){
  # Stop if any argument isn't a numeric scalar
  stopifnot(is.numeric(x), length(x) == 1)
  stopifnot(is.numeric(y), length(y) == 1)
  
  if (y == 0){x}
  else {euclidean(y,x %% y)}
}
