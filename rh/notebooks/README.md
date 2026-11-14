# Notebooks for *Prime Numbers and the Riemann Hypothesis*

Interactive companion notebooks to **Prime Numbers and the Riemann Hypothesis** by Barry Mazur and William Stein (Cambridge University Press, 2016). They follow the book's order, quote it, and turn the code that drew the book's figures into explanations with interactive controls. The last notebook is new. It covers the quasi-Riemann Hypothesis, proved in 2026.

| # | Notebook | The book |
|---|---|---|
| 1 | [Primes as atoms: factor trees and the sieve of Eratosthenes](01-primes-as-atoms.ipynb) | Part I: "What are prime numbers?", "Sieves" |
| 2 | [How many primes are there? From proportions to Gauss's guess](02-how-many-primes.ipynb) | "How many primes are there?", "Prime numbers viewed from a distance", "A probabilistic first guess" |
| 3 | [Square-root error and random walks](03-random-walks.ipynb) | "What is a 'good approximation'?", "Square root error and random walks" |
| 4 | [How good is Li(x)? The error term, RH, and the quasi-RH](04-how-good-is-li.ipynb) | "The mystery moves to the error term", "Cesàro smoothing", "A view of \|Li(X) - π(X)\|" |
| 5 | [Gaps between primes](05-prime-gaps.ipynb) | "Further questions about primes" |
| 6 | [Skewes' number: when does π(x) overtake Li(x)?](06-skewes.ipynb) | "A view of \|Li(X) - π(X)\|" |
| 7 | [Sounds, spectra and trigonometric sums](07-spectra.ipynb) | "What do computer music files … have to do with each other?", "The word 'Spectrum'", "Spectra and trigonometric sums" |
| 8 | [The Riemann spectrum and the staircase of primes](08-riemann-spectrum.ipynb) | "The spectrum and the staircase of primes", Part III |
| 9 | [How many θ's are there? Counting and spacing the Riemann spectrum](09-counting-zeros.ipynb) | "How many θ_i's are there?", "Further questions about the Riemann spectrum" |
| 10 | [The quasi-Riemann Hypothesis (2026)](10-quasi-rh.ipynb) | Part IV, "Back to Riemann", and after |

**Running them.** They use the SageMath kernel, with numpy, scipy, matplotlib and mpmath. They run in the browser with [Sagebrush](https://sagebrush.space), and in SageMath's own Jupyter. Notebooks 6, 8, 9 and 10 read `zeta_zeros_1000.txt`, which holds the first 1000 zeros of $\zeta(s)$ computed with mpmath. Keep it in the same folder.

**License.** MIT (see `LICENSE`). The quotations from the book are © Barry Mazur and William Stein; they are short and quoted for commentary.
