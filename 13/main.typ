#import "../lib.typ": *

#knowledge[
    #question(name: [Explain the truncation of a state--space model])[
        We split the model into two sets of equations
        $
        dot(bold(x))_1 &= bold(A)_(1 1) bold(x)_1 (t)
        + bold(A)_(1 2)  bold(x)_2 (t) + bold(B)_1 bold(u) (t)\
        dot(bold(x))_2 &= bold(A)_(2 1) bold(x)_1 (t)
        + bold(A)_(2 2)  bold(x)_2 (t) + bold(B)_2 bold(u) (t)
        $

        if we assume
        $
        dot(bold(x))_2 approx bold(0)
        $
        and we remove them.

        In matlab there is function ```matlab modred(G,ix,'Truncate')```.
        
    ]


    #question(name: [Explain residualization of a state--space model.])[
        We split the model into two sets of equations
        $
        dot(bold(x))_1 &= bold(A)_(1 1) bold(x)_1 (t)
        + bold(A)_(1 2)  bold(x)_2 (t) + bold(B)_1 bold(u) (t)\
        dot(bold(x))_2 &= bold(A)_(2 1) bold(x)_1 (t)
        + bold(A)_(2 2)  bold(x)_2 (t) + bold(B)_2 bold(u) (t)
        $

        if we assume
        $
        dot(bold(x))_2 approx bold(0)
        $
        we can say
        $
        dot(bold(x))_2 = bold(0) = bold(A)_(2 1) bold(x)_1 (t)
        + bold(A)_(2 2)  bold(x)_2 (t) + bold(B)_2 bold(u) (t)
        $   
        and if $bold(A)_(2 2)$ is nonsingular we can express $bold(x)_2$ and
        substitue into the other equation.

        In Matlab there is function ```matlab modred(G,ix,'MatchdDC')```.
    ]


    #question(name: [Explain balanced realization and balanced reduction
    (truncation or residualization)])[
        + Find a state--space realization where *direction* in which the system
            is easily controlled are *aligned* with the directions in which the
            states are easily observable. Aligning the principal axes of the
            reachability and observability ellipsoids. *Ballanced realization*.
        + Remove the state variables that are weakly involved in IO response.
            The ellipsoids aligned with the coordinate axes. *Balanced
            truncation*, balanced residualization.

        Such balance can be achieved by balancing
        $
        overline(bold(P)) = overline(bold(Q))\
        overline(bold(P)) = bold(T) bold(P) bold(T)^*\
        overline(bold(Q)) = (bold(T)^(-1))^* bold(Q) bold(T)^(-1)
        $
        where $bold(T)$ is transformation into the new state space.

        - $bold(Q)$ is infinite--time *observability* gramian $bold(Q)
            = integral_0^oo exp(bold(A)^T t) bold(C)^T bold(C) exp(bold(A) t)
            upright(d) t$
        - $bold(P)$ is infinite--time *reachability* gramian $bold(P)
            = integral_0^oo exp(bold(A) t) bold(B) bold(B)^T exp(bold(A)^T t)
            upright(d) t$

        Good solution is
        $
        overline(bold(P)) = overline(bold(Q)) = op("diag")(sigma_1, sigma_2,
        ..., sigma_n)
        $
        where $sigma_i$ are Hankel singular values.
    ]


]

#skills[
    #question(name: [Reduce the order of a provided high--order LTI system in
    Matlab.])[]


]

