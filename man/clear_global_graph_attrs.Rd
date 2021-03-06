% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clear_global_graph_attrs.R
\name{clear_global_graph_attrs}
\alias{clear_global_graph_attrs}
\title{Clear any global graph attributes that are set}
\usage{
clear_global_graph_attrs(graph)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}
}
\value{
a graph object of class \code{dgr_graph}.
}
\description{
Clear any currently set global graph
attributes for a graph object of class
\code{dgr_graph}).
}
\examples{
# Create a new graph and set some global attributes
graph <-
  create_graph() \%>\%
  set_global_graph_attrs(
    attr = "overlap",
    value = "true",
    attr_type = "graph")

# Clear all global attributes that have been set
graph <- clear_global_graph_attrs(graph)

# Look at the present global graph attributes;
# since there are none, NA is returned
get_global_graph_attrs(graph)
#> [1] NA
}
