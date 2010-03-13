\name{alpha.curve}
\alias{alpha.curve}

\title{
Step-by-step Cronbach-Mesbah Curve
}

\description{
The function calculates and plots the Cronbach-Mesbah Curve for a given data set.
}

\usage{
alpha.curve(x)
}

\arguments{
  \item{x}{an object of class data.frame or matrix with \eqn{n}{n} subjects 
  in the rows and \eqn{k}{k} items in the columns.}
}

\details{
There is a direct connection between the Cronbach alpha coefficient \eqn{\alpha}{\alpha} (see \code{\link{alpha.cronbach}}) and the percentage of variance explained by the first component in the Principal Component Analysis (PCA) on \eqn{k}{k} items. The PCA is usually based on the analysis of the roots of the correlation matrix R of \eqn{k}{k} variables which, under the hypothesis of a parallel model (see Lord and Novick, 1968) is:


\tabular{lllll}{
    \tab 1 \tab \eqn{\rho}{\rho} \tab ... \tab \eqn{\rho}{\rho} \cr
    \tab \eqn{\rho}{\rho} \tab 1 \tab ... \tab \eqn{\rho}{\rho} \cr
   R = \tab ... \tab ... \tab ... \tab ...  \cr
    \tab \eqn{\rho}{\rho} \tab \eqn{\rho}{\rho} \tab ... \tab 1
}


This matrix has only two different roots. The greater root is \eqn{\lambda_1=1+\rho(k-1)}{\lambda_1=1+\rho(k-1)} and the other roots are \eqn{\lambda_2=\ldots=\lambda_k=1-\rho=\frac{k-\lambda_1}{k-1}}{\lambda_2=\ldots=\lambda_k=1-\rho=(k-\lambda_1)/(k-1)}. Thus, using the Spearman-Brown formula, we can express the reliability of the sum of the \eqn{k}{k} items as follows:

\deqn{\tilde \rho=\frac{k}{k-1}\left[1-\frac{1}{\lambda_1}\right].}{\tilde \rho=k / (k-1) * (1 - 1/ lambda_1).}

This indicates that there is a monotonic relationship between \eqn{\tilde\rho}{\tilde\rho}, estimated by  \eqn{\alpha}{\alpha}, and the first root \eqn{\lambda_1}{\lambda_1}, which in practice is estimated using the observed correlation matrix and thus gives the percentage of variance of the first principal component. Then,  \eqn{\alpha}{\alpha} is considered as a measure of unidimensionality.

In particular, to assess the unidimensionality of a set of items, it is possible to plot a curve, called step-by-step \bold{Cronbach-Mesbah} curve, which reports the number of items (from 2 to \eqn{k}{k}) on the x-axis and the corresponding maximum \eqn{\alpha}{\alpha} coefficient on the y-axis obtained through the following steps:
\enumerate{
\item first of all the Cronbach coefficient \eqn{\alpha=\tilde\alpha^0}{\alpha=\tilde \alpha^0} is computed using all the \eqn{k}{k} items.
\item One at a time, the \eqn{i}{i}-th item (\eqn{i=1,\ldots,k}{i=1,...,k}) is left out and the Cronbach coefficient, denoted by \eqn{\alpha_{-i}}{\alpha_{-i}}, is computed using the remaining \eqn{(k-1)}{(k-1)} items. All the coefficients are collected in a set given by
\deqn{\tilde\alpha^1=\left(\alpha_{-1},\ldots,\alpha_{-j},\ldots,\alpha_{-k}\right)}{\tilde \alpha^1=\left(\alpha_{-1},...,\alpha_{-j},\ldots,\alpha_{-k}\right)}
where the apex refers to the number of item removed at each time. Then, the maximum of \eqn{\tilde \alpha^1}{\tilde \alpha^1} is detected and the corresponding item is taken out. For example, if \eqn{\alpha_{-j}}{\alpha_{-j}} is the maximum of \eqn{\tilde \alpha^1}{\tilde \alpha^1}, the \eqn{j}{j}-th item is removed definitely from the scale.
\item The procedure of step 2 is repeated conditionally on the item removed previously. Supposing that item \eqn{j}{j} was removed, the remaining items are left out one at a time and the corresponding  Cronbach coefficient is calculated. This gives rise to the following set of  \eqn{(k-1)}{(k-1)} coefficients
\deqn{\tilde\alpha^2=\left(\alpha_{-(1,j)},\ldots,\alpha_{-(j-1,j)},\alpha_{-(j+1,j)},\ldots,\alpha_{-(k,j)}\right).}{\tilde \alpha^2=\left(\alpha_{-(1,j)},...,\alpha_{-(j-1,j)},\alpha_{-(j+1,j)},...,\alpha_{-(k,j)}\right).}
The item corresponding to the maximum of \eqn{\tilde\alpha^2}{\tilde \alpha^2} is then removed definitely. For example, if \eqn{\alpha_{-1}}{\alpha_{-1}} is the maximum of \eqn{\tilde \alpha^2}{\tilde \alpha^2}, the first item is removed definitely from the scale together with the \eqn{j}{j}-th item removed at step 2.
}
This procedure is repeated until only 2 items remain. Note that at each step the removed item is the one which leaves the scale with its \emph{maximum} \eqn{\alpha}{\alpha} value. If we remove a poor item, the  \eqn{\alpha}{\alpha} coefficient will increase, whereas if we remove a good item  \eqn{\alpha}{\alpha} must decrease. More precisely, the Spearman-Brown formula shows that increasing the number of items leads to increase the reliability of the total score.  Thus, a decrease of the Cronbach-Mesbah curve, after adding a variables, would suggest that the added variable do not constitute an unidimensional set with the other variables. On the other hand, if the step-by-step Cronbach-Mesbah curve increases monotonically, then all the items contribute to measure the same latent trait and the bank of items is characterized by unidimensionality.

}

\section{Warning}{No missing values are admitted.}

\value{
The functions returns: \cr
1) an object of class data.frame with 3 columns. The first column \emph{N.Item} contains the number of item used for computing the Cronbach \eqn{\alpha}{\alpha} coefficients. It contains the values between 2 and \eqn{k}{k} corresponding, respectively, to the case when only 2 items or all the items are used. The second column, \emph{Alpha.Max}, refers to the maximums of the Cronbach coefficients calculated at each step of the procedure, that is \eqn{(\max\tilde\alpha^{k-2},\ldots,\max\tilde\alpha^1,\max\tilde\alpha^0)}{(max \tilde \alpha^{k-2},...,max \tilde \alpha^1,max \tilde \alpha^0)}. Finally, the last column, \emph{Removed.Item}, reports the name of the item removed at each step, that is \eqn{(arg\max\tilde\alpha^{k-2},\ldots,arg\max\tilde\alpha^1,arg\max\tilde\alpha^0)}{(argmax \tilde \alpha^{k-2},...,argmax \tilde \alpha^1,argmax \tilde \alpha^0)}.\cr
2) The corresponding Cronbach-Mesbah curve plot created using the first 2 columns of the data.frame described above. Note that also the names of the removed items are reported in the graph. 
}



\references{
Curt, F., Mesbah, M., Lellouch, J. and Dellatolas, G. (1997) \emph{Handedness scale how many and which items?} Laterality, 2, 137--154.

Hamon, A. and Mesbah, M. (2002) \emph{Questionnaire reliability under the Rasch model}. Statistical Methods for Quality of Life Studies: Design, Measurement and Analysis. Mesbah, M., Cole, B.F. and Lee, M.L.T. (Eds.), Kluwer Academic Publishing, Boston, 155--168.

Mesbah, M. (2010) \emph{Statistical quality of life}. Method and Applications of Statistics in the Life and Health Sciences. Balakrishnan, N. (Editor), Wiley, 839--864.

Nordmann, J., Mesbah, M., Berdeaux, G. (2005) \emph{Scoring  of Visual Field Measured through Humphrey Perimetry: Principal Component Varimax Rotation Followed by Validated Cluster Analysis}. Investigative Ophthalmology & Visual Science 46, 3169--3176.
}

\author{
Michela Cameletti and Valeria Caviezel
}


\seealso{ See Also \code{\link{alpha.cronbach}} and \code{\link{cain}} }


\examples{

data(cain)

out = alpha.curve(cain)
out

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
