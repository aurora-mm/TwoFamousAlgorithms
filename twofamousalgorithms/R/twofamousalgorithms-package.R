#' @keywords internal 
"_PACKAGE"
#' 
#' twofamousalgorithms: Implementations of the Euclidean algorithm and Dijkstra's algorithm
#'
#' This package includes implementations of two famous algorithms: the Euclidean algorithm 
#' for finding the greatest common divisor of two integers and Dijkstra algorithm for finding 
#' the shortest path in a graph.
#' 
#' @section dijkstra:
#' The algorithm takes a graph and an initial node and calculates the shortest
#' path from the initial node to every other node in the graph.
#'

#' A test dataset for Dijkstra's algorithm implementation
#'
#' @format ## `wiki-graph`
#' A data frame with 18 rows and 3 variables:
#' \describe{
#'   \item{v1, v2}{Edges of the graph}
#'   \item{w}{Weight of the edge}
#'   ...
#' }
#' @source <https://en.wikipedia.org/wiki/Dijkstra%27salgorithm>
"wiki_graph"
