#import "../lib.typ": *

#knowledge[
    #question(name: [Understand and explain the _Bellman's principle of
    optimality_.])[
        #quote(attribution: [Bellman, presumably], block: true)[
            If the shortest path from pub home takes you to a bar, the rest of the
        path home is the shortest path from bar home.
        ]
        
    ]


    #question(name: [Show how dynamic programming and Bellman's principle of
    optimality can be used to give analytical solution to a discrete--time
    LQ--optimal control on a finite control interval.])[
        #part(name: [Discrete decisions])[
            For a graph--like space of discrete decisions the problem is
            simmilar to finding the shortest path by starting from the end and
            working backwards in search for start.
        ]

        #part(name: [Now something real])[
            System equation
            $
            bold(x)_(k+1) = bold(f)(bold(x)_k, bold(u)_k)
            $
            models our system for which we search for the optimal control.

            The cost function with initial state $bold(x)_i$ is defined
            generally as
            $
            J_i (bold(x)_i, [bold(u)_i, bold(u)_(i+1), ..., bold(u)_(N-1)]) = 
            phi.alt(bold(x)_N) + sum_(k=1)^(N-1) L_k (bold(x)_k, bold(u)_k)
            $

            Now the optimum for cost function $J_i$ is
            $
            J_i^* (bold(x)_i)
            = min_(bold(u)_j "for" j in [i, N-1])
            J_i (bold(x)_i, [bold(u)_i, bold(u)_(i+1), ..., bold(u)_(N-1)])
            $

            Note that $J_i^* (bold(x)_i)$ is a function of $bold(x)_i$ (initial
            state) only.

            Now, if we apply any (not neccesatily optimal) control $bold(u)_k$
            the cost would, according to Bellman, be
            $
            J_k^* (bold(x)_k) = min_bold(u)_k
            (L_k (bold(x)_k, bold(u)_k) + J_(k+1)^* (bold(x)_(k+1)))
            $

            Now what to do with it:
            - Lets say $bold(x)_k in RR^n$. Than we sample the state space in
                $n + 1$ dimensions. The $+ 1$ being for time.
            - For each sample, we calculate the optimal policy (step to be
                performed at that point).
            - Thats it really.

            Note that this scales terribly with higher dimensions.

            Also good point is that interpolation between samples is really
            good idea. If we simply round to nearest point we might get
            something that is far from optimal.
        ]
    ]


    #question(name: [Give the _Hamilton--Jacobi--Bellman_ (HJB) equation and
    explain it as a reformulation of the principle of optimality for
    continuous--time systems. Give also its version featuring the Hamiltonian
    function.])[
        The HJB equation is
        $
        - (diff J^* (bold(x), t))/(diff t)
        = min_(bold(u)(t))
        [L(bold(x), bold(u), t)
        + (gradient_bold(x) J^* (bold(x), t))^T bold(f)(bold(x), bold(u), t)]
        $

        As Hamiltonian is defined as
        $
        H(bold(x), bold(u), bold(lambda), t) = L(bold(x), bold(u), t)
        + bold(lambda)^T bold(f)(bold(x), bold(u), t)
        $
        the HJB equation can be reformulated as
        $
        - (diff J^* (bold(x), t))/(diff t)
        = min_(bold(u)(t))
        H(bold(x), bold(u), gradient_bold(x) J^* (bold(x), t), t)
        $
        meaning we have to minimize Hamiltonian to achieve optimal control.
    ]


]

#skills[
    #question(name: [Use dynamic programming to design an optimal feedback controller in the form of a lookup table for a general (possibly nonlinear) discrete-time dynamical system.])[]


]

