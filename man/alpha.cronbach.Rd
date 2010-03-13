\name{alpha.cronbach}
\alias{alpha.cronbach}

\title{
Cronbach reliability coefficient alpha
}

\description{
The function computes the Cronbach reliability alpha coefficient denoted with \eqn{\alpha}{\alpha}.
}

\usage{
alpha.cronbach(x)
}

\arguments{
  \item{x}{an object of class data.frame or matrix with \eqn{n}{n} subjects in the rows and \eqn{k}{k} items in the columns.}
}

\details{
Let \eqn{X_1,\ldots,X_k}{X_1,...,X_k} be a set of items composing a test and measuring the same underlying unidimensional latent trait. Moreover, let \eqn{X_{ij}}{X_{ij}} be the observed score (response) of a subject \eqn{i}{i} \eqn{(i=1,\ldots,n)}{(i=1,...,n)} on an item \eqn{j}{j} \eqn{(j=1,\ldots,k)}{(j=1,...,k)}. Following the classical test theory, \eqn{X_{ij}}{X_{ij}} can be written as 
\deqn{X_{ij}=\tau_{ij}+\epsilon_{ij}}{X_{ij}=\tau_{ij}+\epsilon_{ij}}
where
\eqn{\tau_{ij}}{\tau_{ij}}, the true score, and \eqn{\epsilon_{ij}}{\epsilon_{ij}}, the error score, are two unknown random variables generally assumed to be independent (or at least not correlated). In particular, the true score is given by
\deqn{\tau_{ij}=\mu_j+a_i}{\tau_{ij}=\mu_j+a_i}
where \eqn{\mu_j}{\mu_j} is a fixed effect and \eqn{a_i}{a_i} is a random effect with zero mean and variance \eqn{\sigma^2_a}{\sigma^2_a}, whereas \eqn{\epsilon_{ij}}{\epsilon_{ij}} is a random effect with zero mean and variance \eqn{\sigma^2_\epsilon}{\sigma^2_\epsilon}. Moreover,  \eqn{\epsilon_{ij}}{\epsilon_{ij}} and  \eqn{a_{i}}{a_{i}} are not correlated and for all \eqn{j=1,\ldots,k}{j=1,...,k} and for \eqn{t\neq s}{t &#8800 s}, \eqn{(a_t,\epsilon_{tj})}{(a_t,\epsilon_{tj})} and \eqn{(a_s,\epsilon_{sj})}{(a_s,\epsilon_{sj})} are independent.


The \emph{reliability} \eqn{\rho}{\rho} of any item is defined as the ratio of two variances: the variance of the true (unobserved) measure and the variance of the observed measure. Under the parallel model (see Lord and Novick, 1968), it can be shown that
\deqn{\rho=\frac{\sigma^2_a}{\sigma^2_a+\sigma^2_\epsilon}}{\rho=\sigma^2_a \ (\sigma^2_a+\sigma^2_\epsilon)}
where \eqn{\sigma^2_a}{\sigma^2_a} corresponds to the between-subject variability while \eqn{\sigma^2_\epsilon}{\sigma^2_\epsilon} is the variance of the measurement error. It is possible to prove that \eqn{\rho}{\rho} is also the constant correlation between any two items. The reliability of the sum of \eqn{k}{k} items is given by the well-known \bold{Spearman-Brown} formula:
\deqn{\tilde\rho=\frac{k\rho}{k\rho+(1-\rho)}.}{\tilde \rho=k\rho / (k\rho+(1-\rho)).}
The maximum likelihood estimate of \eqn{\tilde\rho}{\tilde\rho}, under the assumption of Normal distribution for the error, is known as the \bold{Cronbach alpha coefficient}, denoted with \eqn{\alpha}{\alpha}. 

The formula for computing \eqn{\alpha}{\alpha} is given by
\deqn{\alpha=\frac{k}{k-1}\left[1-\frac{\sum_{j=1}^n s^2_j}{s^2_{TOT}}\right]}{\alpha= k /(k-1) * [1-\sum_{j=1}^n s^2_j / s^2_{TOT}]}
where \eqn{s^2_j=\frac{1}{n-1}\sum_{i=1}^n(X_{ij}-\bar X_j)^2}{s^2_j=1/(n-1) * \sum_{i=1}^n (X_{ij}-\bar X_j)^2}, \eqn{s^2_{TOT}=\frac{1}{nk-1}\sum_{i=1}^n\sum_{j=1}^k(X_{ij}-\bar X)^2}{s^2_{TOT}=1/(nk-1) * \sum_{i=1}^n \sum_{j=1}^k(X_{ij}-\bar X)^2}, \eqn{\bar Xj=\frac{1}{n}\sum_{i=1}^n X_{ij}}{\bar Xj=1/n * \sum_{i=1}^n X_{ij}} and \eqn{\bar X=\frac{1}{nk}\sum_{i=1}^n\sum_{j=1}^k X_{ij}}{\bar X=1/(nk) * \sum_{i=1}^n \sum_{j=1}^k X_{ij}}.
}

\section{Warning}{No missing values are admitted.}

\value{
The function returns the value \eqn{\alpha}{\alpha} of the Cronbach reliability coefficient computed as described above. The coefficient takes values in the interval [0,1]. If the actual variation amongst the subjects is very small, then the reliability of the test measured by \eqn{\alpha}{\alpha} tends to be small. On the other hand, if the variance amongst the subject is large, the reliability tends to be large.
}

\references{
Cronbach, L.J. (1951) \emph{Coefficient alpha and the internal structure of tests}. Psychometrika, 16, 297--334.

Lord, F.M. and Novick, M.R. (1968) \emph{Statistical Theories of Mental Test Scores}. Addison-Wesley Publishing Company, 87--95.
}

\author{
Michela Cameletti and Valeria Caviezel
}

\seealso{ See Also \code{\link{alpha.curve}} and \code{\link{cain}} }


\examples{
data(cain)
out = alpha.cronbach(cain)
out
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
