% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/newObject.R
\name{newObject}
\alias{newObject}
\title{An object constructor of an S3 class}
\usage{
newObject(`_class` = NULL, `_inherit` = NULL, pos = 1, ...)
}
\arguments{
\item{pos}{into which environment the $ method (see value part) is assigned. 
The pos argument can specify the environment in which to assign the object 
in any of several ways: as a positive integer 
(the position in the search list, default is 1); as the character string name of an 
element in the search list; or as an environment (including using sys.frame 
to access the currently active function calls).}

\item{`_class`}{of which class an object to create}

\item{`_inherit`}{the parent class an object to inherit}
}
\value{
an instance of `_class` object. Meanwhile, an S3 method of `$` 
function is generated in the same environment of the object that you just
constructed. For example, if the "NewClass" is assigned to `_class` 
parameter, then a function/method called $.NewClass is constructed.
}
\description{
This is inspired by the object oriented programming in Javascript and ggproto 
function/object in ggplot2 package. Here the attributes of the 
object are replaced in place, and it is able to access the object it"self" 
and its parent object in the method of this object.
}
\examples{
\dontrun{
Adder <- newObject("Adder", 
                   x = 0,
                   add = function(n) {
                     self$x <- self$x + n
                     self$x
                   }
)
Adder$x
Adder$add(10)
# Adder$x is replaced in place
Adder$add(10)

Doubler <- newObject("Doubler", Adder,
                     add = function(n) {
                       self$x = self$x *(n) * self$super()$x
                       self$x
                     }
)
Doubler$x
Adder$x
Doubler$add(10)
Doubler$self()

identical(Adder, Doubler$super())
Adder$self() # Adder
Doubler$super()$self() # Adder

# update Adder
Adder$add(10)
Adder$x
# the super of Doubler is also update
Doubler$super()$x
# But Double itself is not changed
Doubler$x
}
}
