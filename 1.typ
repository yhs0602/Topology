// Get Polylux from the official package repository
#import "@preview/polylux:0.3.1": *

// Make the paper dimensions fit for a presentation and the text larger
#set page(
  paper: "presentation-16-9",
  fill: rgb(235, 253, 255)
)
#set text(
	size: 25pt,
	font: "Pretendard",
)
#set list(spacing: 2em, tight: true)
#show heading: it => {
  it.body
  v(0.2em)
}
#let KL = math.op("KL")
#let Uniform = math.op("Uniform")
#let ReLU = math.op("ReLU")

// Use #polylux-slide to create a slide and style it using your favourite Typst functions
#polylux-slide[
  #align(horizon + center)[
    = Topology
    \ 1. Introduction

    양현서

    July 20, 2024
  ]
]

#polylux-slide[
  ==  Manifolds란 무엇인가?

  - 공간에서의 면을 일반화한 개념

  - 예시: S2 (구면)

  - 여기서의 함수의 최댓값, 최솟값 구하기는 평범한 평면에서 하던 것과는 다르다.

  - A *manifold* is a *topological space* locally *homeomorphic* to $RR^n$.
]

#polylux-slide[
  == Metric
  - A non empty set $X$

  - For $forall x, y in X$
    - $d(x, y) > 0 <=> x != y$
    - $d(x, y) = d(y, x)$
    - $d(x, y) gt.eq d(x, z) + d(z, y)$
]

#polylux-slide[
  == Example of metrics
  - Eucledian metric: $d(x, y) = sqrt((x_1 - y_1)^2 + (x_2 - y)^2)$

  - Square metric: $d(x, y) = max(|x_1 - y_1|, |x_2 - y_2|)$

  - Taxi-cab metric: $d(x, y) = |x_1 - y_1| + |x_2 - y_2|$

  - Discrete metric: $d(x, y) = 1$ if $x != y$, $0$ if $x = y$
]


#polylux-slide[
  == Metric Space
  - Set $X$

  - Metric function $d: X^2 -> RR$
]

#polylux-slide[
  == Open epsilon ball in metric space
  - $B(x, epsilon) = {y in X | d(x, y) lt epsilon}$

  - It is an open set
]

#polylux-slide[
 == Examples of balls in metric spaces
  - inside of a circle with radius $r$ where $X = RR^2, d = "Eucledian metric"$

  - inside of a square where $X = RR^2, d = "Square metric"$

  - Discrete metric space
    - $B_"Discrete" (p, 0.1) = { p }$
    - $B_"Discrete" (p, 1) = { p }$
    - $B_"Discrete" (p, 1.000001) = X$
]

#polylux-slide[
  == Open sets in metric space
  - if $U in X$, $U$ is an open set if $forall x in U, exists epsilon gt 0$ such that $B(x, epsilon) subset U$

  - Example (Eucledian space)
    - $U = { (x, y) in RR^2 | x gt 0 }$
    - $forall (x, y) in U, B((x, y), x) subset U$

]

#polylux-slide[
  == Topology
  - *Metric is not needed*

  - Set $X$, $T subset.eq cal(P)(X)$

  - $T$ is a topology on $X$ if
    - $emptyset, X in T$
    - $U, V in T => U sect V in T$
    - For any fixed index set $I$, $U_i in T => union.big_(i in I) U_i in T $
] 

#polylux-slide[
  == Open sets
  Elements of $T$ are called open sets
]

#polylux-slide[
  == Examples of topology
  - Discrete Topology: $T = cal(P)(X)$ is a topology on $X$

  - Indiscrete Topology: $T = { emptyset, X}$ is a topology on $X$
]

#polylux-slide[
  == Open epsilon ball is an open set
  - In a metric space $(X, d)$, for any $x in X$ and $epsilon > 0$, the set $B(x, epsilon) = {y in X | d(x, y) < epsilon}$ is called an $epsilon$-ball around $x$.

  - Proposition: Every $epsilon$-ball is an open set in the metric space $(X, d)$.
]

#polylux-slide[
  == Open epsilon ball is an open set: Proof
  - Let $B(x, epsilon)$ be an $epsilon$-ball and let $p in B(x, epsilon)$
  - Then $d(x, p) < epsilon$
  - Choose $delta = epsilon - d(x, p)$, then $delta > 0$.
  - For any $q in B(p, delta)$, we have $d(p, q) < delta$.
  - By triangle ineq, $d(x, q) lt.eq d(x, p) + d(p, q) < d(x, p) + delta = epsilon$
  - Hence, $q in B(x, epsilon)$
  - Thus, $B(p, delta) subset B(x, epsilon)$, implying $p$ is an interior point of $B(x, epsilon)$
  - Since $p$ was arbitrary, $B(x, epsilon)$ is an open set.
  - Therefore, every $epsilon$-ball is an open set in the metric space $(X, d)$.
]

#polylux-slide[
  #align(horizon + center)[
    = Teaser: Closed set, continuous function
  ]
]

// #polylux-slide[
//   == Joint space mapping for control
//   - Directly maps "Leader" joint angles to "Follower" joint angles
//   - Solves IK failing problem
//   // #figure(
//   //    image("images/robots.png", width: 85%), 
//   // )
// ]
