#' Get articulation points
#' @description Get the nodes in the graph that are
#' identified as articulation points.
#' @param graph a graph object of class
#' \code{dgr_graph}.
#' @return a vector of node IDs.
#' @examples
#' # Create a random graph and make every node
#' # shape a `square`
#' graph <-
#'   create_random_graph(
#'     n = 30, m = 50,
#'     set_seed = 23) %>%
#'   set_node_attrs(
#'     node_attr = "shape",
#'     values = "square")
#'
#' # Get the articulation points in the graph (i.e.,
#' # those nodes that if any were to be removed, the
#' # graph would become disconnected)
#' get_articulation_points(graph)
#' #> [1]  9 10 12 19 22 26 30
#'
#' # For the articulation points, change the node
#' # shape to a `circle`
#' graph <-
#'   graph %>%
#'   select_nodes_by_id(
#'     nodes = get_articulation_points(.)) %>%
#'   set_node_attrs_ws(
#'     node_attr = "shape",
#'     value = "circle")
#' @importFrom igraph articulation_points as_ids
#' @export get_articulation_points

get_articulation_points <- function(graph) {

  # Validation: Graph object is valid
  if (graph_object_valid(graph) == FALSE) {
    stop("The graph object is not valid.")
  }

  # Convert the graph to an igraph object
  ig_graph <- to_igraph(graph)

  # Get the graph's articulation points
  articulation_points <-
    igraph::articulation_points(ig_graph)

  articulation_points <-
    igraph::as_ids(articulation_points)

  sort(as.integer(articulation_points))
}
