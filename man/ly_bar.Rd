% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layer_bar.R
\name{ly_bar}
\alias{ly_bar}
\title{Add a "barchart" layer to a Bokeh figure}
\usage{
ly_bar(fig, x, y = NULL, data = figure_data(fig), color = NULL,
  alpha = 1, position = c("stack", "fill", "dodge"), width = 0.9,
  origin = NULL, breaks = NULL, right = FALSE, binwidth = NULL,
  lname = NULL, lgroup = NULL, legend = NULL, visible = TRUE, ...)
}
\arguments{
\item{fig}{figure to modify}

\item{x}{values or field name for x variable}

\item{y}{values or field name for y variable, or if NULL, y-axis will be counts of x}

\item{data}{an optional data frame, providing the source for inputs x, y, and color properties}

\item{color}{color for the glyph - a hex code (with no alpha) or any of the 147 named CSS colors, e.g 'green', 'indigo' - for glyphs with both fill and line properties, see "Handling color" below}

\item{alpha}{the alpha transparency of the glyph between 0 (transparent) and 1 (opaque) - if glyph has both fill and color properties, see "Handling alpha" below}

\item{position}{either "stack", "fill", or "dodge" (see details)}

\item{width}{with of each bar, a value between 0 (no width) and 1 (full width)}

\item{origin, breaks, right, binwidth}{parameters to be used for binning x when it is continuous (not yet implemented)}

\item{lname}{layer name}

\item{lgroup}{layer group}

\item{legend}{either a logical specifying not to plot a legend for this layer (FALSE) or a string indicating the name of the legend entry for this layer (note that when mapping plot attributes to variables in \code{data}, a legend is automatically created and does not need to be specified - see "Mapped plot attributes and legends" below)}

\item{visible}{should the layer be visible?}

\item{\ldots}{additional parameters for fine control over fill and line properties (see "Additional parameters" below)}
}
\description{
Draws a bar chart
}
\details{
The y variable is summed for each x variable and bars are plotted.  If no y variable is supplied, the unique values of x will be tabulated.  Within each x variable, if color maps to another grouping variable then the bars are split up.  In this case, there are three ways to display the bars with the \code{position} argument.  The default, "stack" will stack the bars.  The "fill" choice will show the relative proportion for each group within each x, stacking the bars.  The "dodge" choice will plot the bars for each x side by side.

Note that currently x cannot be numeric but support will soon be added for numeric x by first binning the x values.
}
\section{Handling color}{
 The \code{color} parameter is a high-level plot attribute that provides default behavior for coloring glyphs.
\itemize{
  \item When using a glyph that only has line properties, this will be the color of the line.
  \item When using a glyph that has has line and fill properties, this will be the color of the line and the fill, with the alpha level of the fill reduced by 50\%.
  \item If full control over fill and line color is desired, the \code{fill_color} and \code{line_color} attributes can be specified explicitly and will override \code{color}.
}
When color is \code{NULL} and \code{fill_color} or \code{line_color} are not specified, the color will be chosen from the theme.
}

\section{Handling alpha}{
 The \code{alpha} is a high-level plot attribute that sets the transparency of the glyph being plotted.
\itemize{
  \item When using a glyph that only has line properties, this will be the alpha of the line.
  \item When using a glyph that has has line and fill properties, this will be the alpha of the line and the alpha of the fill will be set to 50\% of this value.
  \item Individual fill and line alpha can be specified with \code{fill_alpha} and \code{line_alpha} and will override \code{alpha}.
}
}

\section{Mapped plot attributes and legends}{
 When specifying an input data frame for a layer through the \code{data} argument, columns of \code{data} can be used to specify various plot attributes such as \code{color}, etc. For example, with \code{ly_points(..., data = iris, color = Species)}, the \code{Species} variable is used to determine how to color the points.  Here, \code{Species} is "mapped" to the \code{color} attribute.  Both continuous and categorical variables can be mapped.  In the case of continuous variables, the range is cut into slices and attributes are applied to each interval.  The mapping from the values of the variable to the actual plot attributes is determined based on the theme.
}

\section{Additional parameters}{

\tabular{ll}{
  \code{fill_color} \tab color to use to fill the glyph with - a hex code (with no alpha) or any of the 147 named CSS colors, e.g 'green', 'indigo' \cr
  \code{fill_alpha} \tab transparency value between 0 (transparent) and 1 (opaque) \cr
  \code{line_color} \tab color to use to stroke lines with - a hex code (with no alpha) or any of the 147 named CSS colors, e.g 'green', 'indigo' \cr
  \code{line_width} \tab stroke width in units of pixels \cr
  \code{line_alpha} \tab transparency value between 0 (transparent) and 1 (opaque) \cr
  \code{line_join} \tab how path segments should be joined together 'miter' 'round' 'bevel' \cr
  \code{line_cap} \tab how path segments should be terminated 'butt' 'round' 'square' \cr
  \code{line_dash} \tab array of integer pixel distances that describe the on-off pattern of dashing to use \cr
  \code{line_dash_offset} \tab the distance in pixels into the line_dash that the pattern should start from
 }
}
\examples{
\donttest{
# count of variety
figure() \%>\%
  ly_bar(variety, data = lattice::barley) \%>\%
  theme_axis("x", major_label_orientation = 90)

# total yield per variety
figure() \%>\%
  ly_bar(variety, yield, data = lattice::barley) \%>\%
  theme_axis("x", major_label_orientation = 90)

figure() \%>\%
  ly_bar(variety, yield, color = year, data = lattice::barley) \%>\%
  theme_axis("x", major_label_orientation = 90)

figure() \%>\%
  ly_bar(variety, yield, color = year,
    data = lattice::barley, position = "fill", width = 1) \%>\%
  theme_axis("x", major_label_orientation = 90)

figure() \%>\%
  ly_bar(variety, yield, color = year,
    data = lattice::barley, position = "dodge") \%>\%
  theme_axis("x", major_label_orientation = 90)
}
}
\seealso{
Other layer functions: \code{\link{ly_abline}},
  \code{\link{ly_annular_wedge}}, \code{\link{ly_annulus}},
  \code{\link{ly_arc}}, \code{\link{ly_bezier}},
  \code{\link{ly_boxplot}}, \code{\link{ly_contour}},
  \code{\link{ly_crect}}, \code{\link{ly_curve}},
  \code{\link{ly_density}}, \code{\link{ly_hist}},
  \code{\link{ly_image_url}}, \code{\link{ly_image}},
  \code{\link{ly_lines}}, \code{\link{ly_map}},
  \code{\link{ly_multi_line}}, \code{\link{ly_oval}},
  \code{\link{ly_patch}}, \code{\link{ly_points}},
  \code{\link{ly_polygons}}, \code{\link{ly_quadratic}},
  \code{\link{ly_quantile}}, \code{\link{ly_ray}},
  \code{\link{ly_rect}}, \code{\link{ly_segments}},
  \code{\link{ly_text}}, \code{\link{ly_wedge}}
}

