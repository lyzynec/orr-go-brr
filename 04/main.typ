#import "../lib.typ": *

#knowledge[
    #question(name: [Give the first-order necessary conditions of optimality for
    a general optimal control problem for a nonlinear discrete-time system over
    a finite horizon. Namely, give the general two-point boundary value problem,
    highlighting the state equation, the co-state equation and a stationarity
    equation. Do not forget to include general boundary conditions.])[

        The augmented cost function is
        $
        J'_i (bold(x)_k, bold(u)_k, bold(lambda)_(k+1)) = 
        phi.alt(bold(x)_N, N) + sum_(k=1)^(N-1) [L_k (bold(x)_k, bold(u)_k) +
        bold(lambda)_(k+1)^T [bold(f)_k (bold(x)_k, bold(u)_k) - bold(x)_(k+1)]]
        $

        To null the gradient as $gradient J'_i = 0$ we have to satisfy
        $
        x_(k+1) &= gradient_lambda_(k+1)
        H_k(bold(x)_k, bold(u)_k, bold(lambda)_(k+1)) = f_k (x_k,u_k)
        "(state equation)"\
        lambda_k &= gradient_bold(x)_k
        H_k(bold(x)_k, bold(u)_k, bold(lambda)_(k+1))
        "(costate equation)"\
        0 &= gradient_bold(u)_k H_k(bold(x)_k, bold(u)_k, bold(lambda)_(k+1))
        "(stationarity equation)"\
        0 &= gradient_bold(x)_i H_k(bold(x)_k, bold(u)_k, bold(lambda)_(k+1))
        dot upright(d) bold(x)_i, "for fixed " bold(x)_i = bold(r)_i =>
        upright(d) bold(x)_i = bold(0) \
        0 &= (gradient_bold(x)_N phi.alt - bold(lambda)_N)^T dot d x_N
        = cases("fixed " bold(x)_N &=> bold(x)_N = bold(r)_N =>
        upright(d) bold(x)_N = bold(0), "free " bold(x)_N
        &=> upright(d) bold(x)_N != 0 +> bold(lambda)_N
        = gradient_(bold(lambda)_N) phi.alt)\
        $
        where
        $
        H(bold(x)_k, bold(u)_k, bold(lambda)_(k+1))
        = L_k (bold(x)_k, bold(u)_k) + bold(lambda)_(k+1)^T 
        bold(f)_k (bold(x)_k, bold(u)_k)
        $

        As starting point is probably given, the boundary condition could be
        something like
        $
        bold(x)_0 = bold(r)_0\
        $
        for the end state, it could be given
        $
        bold(x)_N = bold(r)_N
        $
        or could be subject to optimization as
        $
        bold(lambda)_N = gradient phi.alt(bold(x)_N)
        $
    ]


    #question(name: [Give the first-order necessary conditions of optimality for
    a linear and time invariant (LTI) discrete-time system and a quadratic cost
    function over a finite horizon. Namely, give them in the format displaying
    the state equation, co-state equation and stationarity equation. Show and
    discuss also two types of boundary conditions.])[
        With cost function
        $
        J = 1/2 bold(x)_N^T bold(S)_N bold(x)_N + 1/2 sum_(k=0)^(N-1)
        [bold(x)_k^T bold(Q) bold(x)_k + bold(u)_k^T bold(R) bold(u)_k] 
        $
        the Hamiltonian $H$ function would be
        $
        H_k = 1/2
        (bold(x)_k^T bold(Q) bold(x)_k + bold(u)_k^T bold(R) bold(u)_k)
        + bold(lambda)_(k+1)^T (bold(A) bold(x)_k + bold(B) bold(u)_k)
        $

        the equations would become
        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left,
            
            [state:], $bold(x)_(k+1) = bold(A) bold(x)_k + bold(B) bold(u)_k$,
            [costate:], $bold(lambda)_k =
                bold(Q) bold(x)_k + bold(A)^T bold(lambda)_(k+1)$,
            [stationarity:], $bold(0) = bold(R) bold(u)_k
                + bold(B)^T bold(lambda)_(k+1)$,
            [boundary:], $bold(x)_0 = bold(r)_0$,
            [boundary:], $bold(0) &= (bold(S)_N bold(x)_N
                - bold(lambda)_N)^T upright(d) bold(x)_N$,
        )]

        There is other type for the last boundary condition, as it could also be
        given as
        $
        bold(x)_N = bold(r)_N
        $

        From the stationarity equation we can extract optimal control as
        $
        bold(u)_k = - bold(R)^(-1) bold(B)^T bold(lambda)_(k+1)
        $
        Than we can subtitute the optimal control into the rest to obtain state
        and costate values.
    ]


    #question(name: [Give a qualitative characterization of the solution to the
    fixed final state LQ-optimal control problem over a finite horizon, that is,
    you do not have to give formulas but you should be able to state among the
    highlights that the control is open-loop and that reachability of the system
    is a necessary condition.])[
        - the reslt will be offline precalculated control signal, meaining
            it is open--loop
        - the control will be proportional to $bold(r)_N - bold(A)^N bold(x)_0$
            meaning the difference between desired end--time state and state in
            which the system would end up without any control (this one is
            pretty reasonable)
        - the control will be inversly proportional to _reachability Gramian_
            $
            bold(G)_(0,N,bold(R)) = sum_(i=0)^(N-1) bold(A)^(N-i-1) bold(B)
            bold(R)^(-1) bold(B)^T (A^T)^(N-i-1)
            $
            if the _reachability Gramian_ is singular, it means the state is
            not reachable, barring us from calculating optimal control for
            reaching it (again pretty reasonable)
    ]


    #question(name: [Give a qualitative characterization of the solution to the
    free final state LQ-optimal control problem over a finite horizon, that is,
    you do not have to give formulas but you should be able to state among the
    highlights that the control is closed-loop, namely, a time-varying linear
    state feedback and that the feedback gains can be computed by solving a
    difference Riccati equation.])[
        - the problem results in time varying linear state feedback, noteworthy
            is the fact that the state feedback gain increases drasticcaly
            when nearing the horizon
        - the Riccati equation looks like this
            $
            bold(S)_k = bold(Q) + bold(A)^T bold(S)_(k+1) (bold(I) + bold(B)
            bold(R)^(-1) bold(B)^T bold(S)_(k+1))^(-1) bold(A)
            $
        - this Riccati equation was constructed with the assumption that the
            final state boundary equation
            $
            bold(S)_N bold(x)_N = bold(lambda)_N
            $
            holds for any $k$ not just $N$
            $
            bold(S)_k bold(x)_k = bold(lambda)_k
            $
    ]


    #question(name: [Discuss how solution to the free final state LQ problem
    changes as the horizon is extended to infinity. Emphasize that the optimal
    solution is given by a constant linear state feedback whose gains are
    computed by solving a discrete-time algebraic Riccati equation (DARE). What
    are the conditions under which a stabilizing solution is guaranteed to
    exist? What are the conditions under which it is guaranteed that there is a
    unique stabilizing solution of DARE?])[
        - the solution is simmilar to the previous one with the exception that,
            as we never reach the horizon, the state feedback gain remains
            constant
        - DARE (discrete time algebraic Riccati equation) assumes that in the
            steady state (as $k -> oo$)
            $
            bold(S)_(k+1) approx bold(S)_k
            $
            it, works because this assumption is correct
        - for stabilizing solution to exist, there are two conditions
            - system $(bold(A), sqrt(bold(Q)))$ is stabilizable
                #footnote[Non--controllable parts of system are stable]
            - system $(bold(A), sqrt(bold(Q)))$ is detectable
                #footnote[Non--observable patrts of system are stable]
        - unique stablilizing solution requires that in addition to existance
            of stabilizing solution, the system $(bold(A), sqrt(bold(Q)))$
            is detectable
    ]


]

#skills[
    #question(name: [Design an LQ--optimal state feedback controller for a
    discrete--time linear system both for a finite and an infinite horizon, both
    for regulation and for tracking.])[]


]

