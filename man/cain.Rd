\name{cain}
\alias{cain}

\docType{data}

\title{
Data concerning Computer Anxiety INdex (cain)
}

\description{
The data are selected from Chapter 6 of Bond and Fox (2007). In particular we consider only
12 items (I7, I9, I11, I13, I14, I16, I20, I22, I23, I24, I25, I26) in the set of the original 26 items.
The data are indicative of a person's feelings of anxiety toward computers.
Each item has six response options (1 = strongly agree, 2 = agree, 3 =
slightly agree, 4 = slightly disagree, 5 = disagree, 6 = strongly
disagree). The subjects are 371 7-years students.
}

\usage{
data(cain)
}

\format{
  A data frame with 371 subjects and 12 items.
}


\source{
Bond, T.G. and Fox, C.M. (2007). \emph{Applying the Rasch model - Fundamental
measurement in the human sciences}. Second ed. Lawrence Erlbaum Associates
publishers, Mahwah, N.J.}


\seealso{ See Also \code{\link{alpha.cronbach}} and \code{\link{alpha.curve}} }

\examples{
data(cain)
dim(cain)
str(cain)
}

\keyword{datasets}
