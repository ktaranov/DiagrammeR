% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_closeness_vitality.R
\name{get_closeness_vitality}
\alias{get_closeness_vitality}
\title{Get closeness vitality}
\usage{
get_closeness_vitality(graph)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}
}
\value{
a data frame with closeness vitality
values for each of the nodes.
}
\description{
Get the closeness vitality values
for all nodes in the graph.
}
\examples{
# Create a random graph
graph <-
  create_random_graph(
    n = 10, m = 22,
    set_seed = 23)

# Get closeness vitality values for
# all nodes in the graph
get_closeness_vitality(graph)
#>    id closeness_vitality
#> 1   1                 26
#> 2   2                 28
#> 3   3                 28
#> 4   4                 32
#> 5   5                 26
#> 6   6                 12
#> 7   7                 30
#> 8   8                 34
#> 9   9                 26
#> 10 10                 26

# Add the closeness vitality values
# to the graph as a node attribute
graph <-
  graph \%>\%
  join_node_attrs(
    df = get_closeness_vitality(.)) \%>\%
  drop_node_attrs(node_attr = "value")

# Display the graph's node data frame
get_node_df(graph)
#>    id type label closeness_vitality
#> 1   1 <NA>     1                 26
#> 2   2 <NA>     2                 28
#> 3   3 <NA>     3                 28
#> 4   4 <NA>     4                 32
#> 5   5 <NA>     5                 26
#> 6   6 <NA>     6                 12
#> 7   7 <NA>     7                 30
#> 8   8 <NA>     8                 34
#> 9   9 <NA>     9                 26
#> 10 10 <NA>    10                 26
}
