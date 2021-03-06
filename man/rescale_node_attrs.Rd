% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rescale_node_attrs.R
\name{rescale_node_attrs}
\alias{rescale_node_attrs}
\title{Rescale numeric node attribute values}
\usage{
rescale_node_attrs(graph, node_attr_from, to_lower_bound = 0,
  to_upper_bound = 1, node_attr_to = NULL, from_lower_bound = NULL,
  from_upper_bound = NULL)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}

\item{node_attr_from}{the node attribute containing
numeric data that is to be rescaled to new numeric
or color values.}

\item{to_lower_bound}{the lower bound value for the
set of rescaled values. This can be a numeric value
or an X11 color name.}

\item{to_upper_bound}{the upper bound value for the
set of rescaled values. This can be a numeric value
or an X11 color name.}

\item{node_attr_to}{an optional name of a new node
attribute to which the recoded values will be
applied. This will retain the original node
attribute and its values.}

\item{from_lower_bound}{an optional, manually set
lower bound value for the rescaled values. If not
set, the minimum value from the set will be used.}

\item{from_upper_bound}{an optional, manually set
upper bound value for the rescaled values. If not
set, the minimum value from the set will be used.}
}
\value{
a graph object of class \code{dgr_graph}.
}
\description{
From a graph object of class
\code{dgr_graph}, take a set of numeric values for a
node attribute, rescale to a new numeric or color
range, then write to the same node attribute or to
a new node attribute column.
}
\examples{
# Create a random graph
graph <-
  create_random_graph(
    n = 5, m = 10,
    set_seed = 23,
    directed = TRUE)

# Get the graph's internal ndf
# to show which node attributes
# are available
get_node_df(graph)
#>   id type label value
#> 1  1 <NA>     1   6.0
#> 2  2 <NA>     2   2.5
#> 3  3 <NA>     3   3.5
#> 4  4 <NA>     4   7.5
#> 5  5 <NA>     5   8.5

# Rescale the `value` node
# attribute, so that its values
# are rescaled between 0 and 1
graph <-
  graph \%>\%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = 0,
    to_upper_bound = 1)

# Get the graph's internal ndf
# to show that the node attribute
# values had been rescaled
get_node_df(graph)
#>   id type label value
#> 1  1 <NA>     1 0.583
#> 2  2 <NA>     2 0.000
#> 3  3 <NA>     3 0.167
#> 4  4 <NA>     4 0.833
#> 5  5 <NA>     5 1.000

# Scale the values in the `value`
# node attribute to different
# shades of gray for the `fillcolor`
# and `fontcolor` node attributes
graph <-
  graph \%>\%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = "gray80",
    to_upper_bound = "gray20",
    node_attr_to = fillcolor) \%>\%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = "gray5",
    to_upper_bound = "gray95",
    node_attr_to = fontcolor)

# Get the graph's internal ndf
# once more to show that scaled
# grayscale colors are now available
# in the `fillcolor` and `fontcolor`
# node attributes
get_node_df(graph)
#>   id type label value fillcolor fontcolor
#> 1  1 <NA>     1 0.583   #6E6E6E   #898989
#> 2  2 <NA>     2 0.000   #CCCCCC   #0D0D0D
#> 3  3 <NA>     3 0.167   #B0B0B0   #2E2E2E
#> 4  4 <NA>     4 0.833   #4A4A4A   #C7C7C7
#> 5  5 <NA>     5 1.000   #333333   #F2F2F2
}
