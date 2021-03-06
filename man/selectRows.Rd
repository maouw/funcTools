% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selectRows.R
\name{selectRows}
\alias{selectRows}
\title{Select rows from a data frame according to reference IDs}
\usage{
selectRows(x, ref, by = NULL)
}
\arguments{
\item{x}{a data frame to select}

\item{ref}{reference IDs, by which the data frame x is to be filtered.}

\item{by}{the column name (or NULL meaning "row names"), by which the
selection is operated on.}
}
\value{
a data frame filtered and ordered by \code{ref} on \code{by} column.
The result of thi function is similar to \code{\link{subset}} function. The
difference is that \code{\link{subset}} function maintains the row orders
in the data frame \code{x}, but \code{selectRows} maintains
the order or \code{ref}. \code{selectRows} does not work if there are
duplicates in both "ref" and "by" pointed column.
}
\description{
Select rows from a data frame according to reference IDs
}
\examples{
{
\dontrun{
### Unduplicated "by"
x = data.frame(V1 = letters[1:15], b = rnorm(15))
# Unduplicated "ref"
selectRows(x, ref = c(19, "a", "d", "c", "b"), by = "V1")

# Duplicated "ref"
selectRows(x, ref = c(19, "a", "a", "c", "b"), by = "V1")

ref1 = sample(1:20, 8)
print(ref1)
selectRows(x, ref = ref1)

### Duplicated "by"
x = data.frame(V1 = rep(letters[1:5], 1:5), b = rnorm(15))
# Unduplicated "ref"
# debugonce(selectRows)
selectRows(x, ref = c(19, "a", "d", "c", "b"), by = "V1")

# Duplicated "ref" (ERROR!)
selectRows(x, ref = c(19, "a", "a", "c", "b"), by = "V1")
}
}
}
