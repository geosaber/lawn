% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transform_rotate.R
\name{lawn_transform_rotate}
\alias{lawn_transform_rotate}
\title{Rotate a GeoJSON feature}
\usage{
lawn_transform_rotate(x, angle, pivot = c(0, 0), mutate = FALSE,
  lint = FALSE)
}
\arguments{
\item{x}{a feature}

\item{angle}{(integer/numeric) number of rotation (along the vertical axis),
from North in decimal degrees, negative clockwise}

\item{pivot}{(integer/numeric) point around which the rotation will be
performed (optional, default \code{centroid})}

\item{mutate}{(logical) allows GeoJSON input to be mutated (significant
performance increase if true) (optional). Default: \code{FALSE}}

\item{lint}{(logical) Lint or not. Uses geojsonhint. Takes up increasing
time as the object to get linted increases in size, so probably use by
default for small objects, but not for large if you know they are good
geojson objects. Default: \code{FALSE}}
}
\value{
a rotated \link{data-Feature}
}
\description{
Rotates any geojson Feature or Geometry of a specified angle, around its
centroid or a given pivot point
}
\note{
all rotations follow the right-hand rule:
\url{https://en.wikipedia.org/wiki/Right-hand_rule}
}
\examples{
x <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
   "type": "Polygon",
   "coordinates": [
    [
      [ 0, 29 ], [ 3.5, 29 ], [ 2.5, 32 ], [ 0, 29 ]
    ]
  ]
 }
}'
lawn_transform_rotate(x, angle = 100, pivot = c(15, 15))

lawn_transform_rotate(x, angle = 100)
lawn_transform_rotate(x, angle = 100, mutate = TRUE)

\dontrun{
view(lawn_featurecollection(x))
view(lawn_featurecollection(lawn_transform_rotate(x, angle = 100)))
view(lawn_featurecollection(
  lawn_transform_rotate(x, angle = 100, pivot = c(15, 15))
))
view(lawn_featurecollection(
  lawn_transform_rotate(x, angle = 150, pivot = c(15, 15))
))
view(lawn_featurecollection(
  lawn_transform_rotate(x, angle = 300, pivot = c(0, 4))
))
}
}
