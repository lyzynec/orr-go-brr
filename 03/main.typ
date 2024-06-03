#import "../lib.typ": *

#knowledge[
    #question(name: [Give some examples of practically useful _optimal control
    cost functions_ (aka performance indices).])[
        For optimal control a practical cost function would penalize input
        and distance of current state from the reference.

        In general such function could be written as
        $
        phi.alt(bold(x)_N, N) + sum_(k=1)^(N-1) L_k (bold(x)_k, bold(u)_k)
        $

        One practical example could be
        $
        1/2 bold(x)_N^T bold(S) bold(x)_N + 1/2 sum_(k=1)^(N-1)
        (bold(x)_k^T bold(Q) bold(x)_k + bold(u)_k^T bold(R) bold(u)_k)
        $
    ]


    #question(name: [Explain the challenges in designing controllers with a
    fixed structure (e.g. PID controllers) by optimizing over their
    coefficients.])[
        - How to express $J(P, I, D)$? It would have to be numerical most of the
            time.
        - Expressing closed loop stability.
        - Nonconvexity of such problem.
    ]


    #question(name: [Formulate the general (nonlinear) problem of optimal
    control design for a discrete-time system as a numerical optimization over
    (finite) control sequences. Discuss the two possible variants: simultaneous
    and sequential.])[
        $
        min_(bold(x) in RR^(n(N-i)),
        bold(u) in RR^(m(N-i))) &J(bold(x) bold(u))\
        "subject to" & bold(g)(bold(x), bold(u)) = bold(0)\
        & bold(h)(bold(x), bold(u)) <= bold(0)
        $

        #part(name: [Simultaneous (sparse) optimization])[
            We optmize over both $bold(x)$ and $bold(u)$ vectors with the cost
            function being
            $
            min_(hat(bold(x)) in RR^(2N)) 1/2
            underbrace(mat(bold(x)^T, bold(u)^T), hat(bold(x))^T) 
            underbrace(mat(overline(bold(Q)), ""; "", overline(bold(R))),
                hat(bold(Q)))
            underbrace(mat(bold(x); bold(u)), hat(bold(x)))
            $
            where
            $
            overline(bold(Q)) = mat(
                bold(Q), "", "", "";
                "", bold(Q), "", "";
                "", "", dots.down, "";
                "", "", "", bold(S)
            ),

            overline(bold(R)) = mat(
                bold(R), "", "", "";
                "", bold(R), "", "";
                "", "", dots.down, "";
                "", "", "", bold(R)
            )
            $

            Now the problem looks like
            $
            min_(hat(bold(x)) in RR^(2N)) &1/2
            hat(bold(x))^T hat(bold(Q)) hat(bold(x))\
            "subject to" &bold(h)(bold(hat(bold(x)))) = bold(0)
            $
        ]

        
        #part(name: [Sequential (dense) optimization])[
            This works by expressing $bold(x)$ as a function of $bold(u)$ and
            $bold(x)_0$
            $
            bold(x)_(k) = bold(f)(bold(x)_(k-1), bold(u)_(k-1))
            $
            in case of linear system
            $
            bold(x)_k = bold(A)^k bold(x)_0 + bold(A)^(k-1) bold(B) bold(u)_0 +
            bold(A)^(k-2) bold(B) bold(u)_1 + ... + bold(B) bold(u)_(k-1)
            $
        ]
    ]


    #question(name: [Formulate the problem of optimal regulator design for a
    discrete--time linear time--invariant (LTI) system over a finite time
    horizon and with a quadratic performance index as a quadratic program (QP).
    Develop fully both the _simultaneous_ and _sequential_ forms of the
    optimization problem and consider also including the inequality constraints.
    What is the major disadvantage of the control strategy based on the offline
    optimization over a control sequence?])[

        #part(name: [Simultaneous (sparse) optimization])[
            The problem is in the form
            $
            min_(hat(bold(x)) in RR^(2N))
            &1/2 hat(bold(x))^T hat(bold(Q)) hat(bold(x))\
            "subject to" & hat(bold(A)) hat(bold(x)) + hat(bold(b)) = bold(0)
            $

            This can be rewritten as
            $
            mat(
                hat(bold(Q)), hat(bold(A))^T;
                hat(bold(A)), bold(0);
            )
            mat(hat(bold(x)); bold(lambda))
            =
            mat(bold(0); -hat(bold(b)))
            $
            where
            $
            hat(bold(A)) = mat(overline(bold(A)) - bold(I), overline(bold(B)))\
            overline(bold(b)) = overline(bold(A))_0 bold(x)_0\
            overline(bold(A)) = "kron"(bold(A), mat(
                bold(0), 0;
                bold(I), bold(0);
                ) )\
            overline(bold(B)) = "kron"(bold(B), bold(I))\
            overline(bold(A))_0 = mat(bold(A); bold(0); dots.v; bold(0))
            $

            For inequality constraints we would have to edit the Lagrange
            function, but the overall design would be the same.
        ]

        #part(name: [Sequential (dense) optimization])[

            We remove the constraints
            $
            bold(x) = (bold(I) - overline(bold(A)))^(-1) overline(bold(B))
            bold(u) + (bold(I) - overline(bold(A)))^(-1) overline(bold(A))_0
            bold(x)_0
            $
            the sets of equations can be rewritten as
            $
            bold(x)_k = bold(A)^k bold(x)_0 + bold(A)^(k-1) bold(B) bold(u)_0 +
            bold(A)^(k-2) bold(B) bold(u)_1 + ... + bold(B) bold(u)_(k-1)
            $

            If we express this in matrix form
            $
            underbrace(mat(bold(x)_1; bold(x)_2; dots.v; bold(x)_N),
                bold(x)
            ) =
            underbrace(mat(
                bold(B), "", "", "";
                bold(A)bold(B), bold(B), "", "";
                dots.v, dots.v, dots.down, "";
                bold(A)^(N-1) bold(B), bold(A)^(N-2) bold(B), ..., bold(B)
            ),
                hat(bold(C))
            )
            underbrace(mat(bold(u)_0; bold(u)_1; dots.v; bold(u)_(N-1)),
                bold(u)) +
            underbrace(mat(bold(A); bold(A)^2; dots.v; bold(A)^N),
                hat(bold(A)))
            bold(x)_0
            $
            we can rewrite it as
            $
            bold(x) = hat(bold(C)) bold(u) + hat(bold(A)) bold(x)_0
            $

            The cost function than looks like
            $
            hat(J)(bold(u), bold(x)_0) = 1/2 bold(u)^T underbrace(
                (hat(bold(C))^T overline(bold(Q)) hat(bold(C))
                + overline(bold(R))),
                bold(H)
            ) bold(u) +
            bold(x)_0^T underbrace(
                hat(bold(A))^T overline(bold(Q)) hat(bold(C)),
                bold(F)^T
            ) bold(u)
            $
            As gradient of this cost function is
            $
            gradient_bold(u) hat(J) = bold(H) bold(u) + bold(F) bold(x)_0 
            $
            we have to solve
            $
            bold(H) bold(u) = - bold(F) bold(x)_0
            $
            which has nice solution
            $
            bold(u) = -bold(H)^(-1) bold(F) bold(x)_0
            $
            in Matlab
            ```matlab
            u = - H \ F * x0;
            ```

            This can be further extended by adding
            $
            bold(u)_k <= bold(u)_"max"\
            bold(u)_k >= bold(u)_"min"
            $
            
            For constarints on state, we have to express it using
            $
            hat(bold(C)) bold(u) + hat(bold(A)) bold(x)_0 <= bold(x)_"max"
            $
        ]

        The major disadvantage of both these options is that the optimization
        has to be precalculated in advance, meaining that any divergence form
        the expected path introduces problems as it is by design open--loop.
    ]

    #question(name: [Explain the essence of receding horizon control also known
    as model predictive control (MPC). What are the major advantages and
    disadvantages?])[
        MPC (Model Predictive Control) takes the aformentioned optimization
        and uses it to control the system in real time.

        It calculates $N$ steps before the current state, and performs the
        first one. Than it repeats the entire procedure again, only shifted
        by one sample.

        This allows the controler to react to current state without compromising
        the ability of long--term planning.

        Main disadvantage is potential issues with real--time calculations, as
        it is computationaly expensive to preform the optimization in every
        step.
    ]


    #question(name: [Formulate the MPC regulation for a linear system and a
    quadratic cost as a quadratic program. Give both the simultaneous and
    sequential versions.])[
        The optimization is identical to open--loop formulation
        $
        min_(bold(u), bold(x))
        1/2 bold(x)_N^T bold(S) bold(x)_N &+ 1/2 sum_(k=1)^(N-1)
        (bold(x)_k^T bold(Q) bold(x)_k + bold(u)_k^T bold(R) bold(u)_k)\
        "subject to" &bold(x)_(k+1) = bold(A) bold(x)_k + bold(B) bold(u)_k\
        &bold(x)_t = "given"\
        &bold(x)_"min" <= bold(x)_k <= bold(x)_"max"\
        &bold(u)_"min" <= bold(u)_k <= bold(u)_"max"
        $

        #part(name: [Simultaneous (sparse) optimization])[
            This is already described in the previous question.
        ]

        #part(name: [Sequential (dense) optimization])[
            The sequential version without constrainst is equivalent to
            _state feedback control_.

            The rest is decribed in previous question.
        ]
        
    ]


    #question(name: [Formulate the MPC tracking for a linear system and a
    quadratic cost as a quadratic program. Explain the need for replacement of
    the control signals by their increments in the optimization problem. Give
    both the simultaneous and sequential versions.])[
        We have to rewirte the problem in another form
        $
        bold(e)_k = bold(r)_k - bold(y)_k
            = bold(r)_k - bold(C)bold(x)_k arrow.r bold(0)
        $

        To have a steady state, we have to optimize over $Delta bold(u)$ instead
        of $bold(u)$ as the input signal might be nonzero for the steady state.

        Now we have to rewrite the entire problem using this notation, and than
        we can form the two types of optimization.
    ]


    #question(name: [Discuss the anticipatory reference tracking (aka preview
    control) and show how this could be achieved using MPC.])[
        This is simmilar to regular tracking MPC, but as the reference can be
        set arbitralrily, we can set the future reference to other values.
    ]


    #question(name: [Show how soft constraints can be included in the MPC
    optimization problem and discuss the motivation for their introduction.])[
        We can add new optimization variable $epsilon$ in order to soften the
        constraints as
        $
        bold(y)_"min" - epsilon bold(v)_"max" <= bold(y)_k
            <= bold(y)_"max" + epsilon bold(v)_"max"
        $
        we also have add the $epsilon$ variable to the cost function
        $
        "min" [... + rho epsilon]
        $
        where $rho$ is a positive constant.
    ]


    #question(name: [Explain the difference between the prediction horizon and
    control horizon.])[
        Prediction horizon are the steps that are simulated in the MPC,
        control horizon are the steps for which the control sequence
        ($Delta bold(u)$) is non--zero.
    ]

]

#skills[
    #question(name: [Implement a simple model predictive controller (MPC) in
    both the simultaneous and sequential formats using Matlab. Rely on the
    availability of numerical solvers for quadratic programming, that is, you do
    not have to write your own optimization solver.])[]


]