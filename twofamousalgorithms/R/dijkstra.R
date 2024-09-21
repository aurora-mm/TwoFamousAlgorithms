#' The Dijkstra algorithm
#' 
#' The algorithm takes a graph and an initial node and calculates the shortest
#' path from the initial node to every other node in the graph.
#' 
#' A decription with pseudocode can be found at the wikipedia page here: 
#' https://en.wikipedia.org/wiki/Dijkstra%27salgorithm.
#' 
#' @param graph A data.frame with three variables (v1, v2 and w) that contains 
#' the edges of the graph (from v1 to v2) with the weight of the edge (w).
#' @param init_node A numeric scalar that exist in the graph.
#' @return The shortest path to every other node from the starting node as a vector.

dijkstra <-
function(graph, init_node) {
  # Stop if graph isn't a data frame
  stopifnot(is.data.frame(graph))
  
  # Stop if columns aren't named v1, v2 and w
  stopifnot(all(c("v1", "v2", "w") %in% colnames(graph)))
  
  # Stop if init_node isn't a numeric scalar
  stopifnot(is.numeric(init_node), length(init_node) == 1)
  
  # Stop if init_node isn't in the graph
  stopifnot(init_node %in% c(graph$v1, graph$v2))
  
  # Get unique nodes
  u_nodes <- unique(c(graph$v1, graph$v2))
  
  # Initialize distances
  dist <- rep(Inf, length(u_nodes))
  names(dist) <- u_nodes
  dist[as.character(init_node)] <- 0
  
  # Initialize visited nodes
  v_nodes <- rep(FALSE, length(u_nodes))
  names(v_nodes) <- u_nodes
  
  # Continue until all nodes are visited
  while (sum(v_nodes) < length(u_nodes)) {
    # Select a node with the smallest distance
    c_node <- as.numeric(names(dist)[which.min(ifelse(v_nodes, Inf, dist))])
    
    # Mark c_node as visited
    v_nodes[as.character(c_node)] <- TRUE
    
    # Find neighbors of c_node
    c_node_n <- graph[graph$v1 == c_node, ]
    
    # Update distances
    for (i in seq_len(nrow(c_node_n))) {
      n_node <- c_node_n$v2[i]
      w <- c_node_n$w[i]
      
      # Calculate new distance
      new_dist <- dist[as.character(c_node)] + w
      if (new_dist < dist[as.character(n_node)]) {
        dist[as.character(n_node)] <- new_dist
      }
    }
  }
  
  # Return the distances
  return(as.numeric(dist))
}
