#import "../lib.typ": *

#knowledge[
    #question(name: [Explain and demonstrate how we can describe _uncertainty in
    a linear model of a dynamical system in frequency domain_ (using a
    _weighting filter_ $W$ and the $Delta$ term). Discuss the _additive_ and
    _multiplicative_ (input and output) models of uncertainty and their
    inverses.])[
        Most basic model of uncertainty is $Delta(s)$
        $
        max_omega |Delta(j omega)| <= 1, Delta "stable"
        $
        we can imagine $Delta(s)$ as some kind of wobbly function that whose
        norm of value on imaginary axis is less than or equal to zero.

        Now, as uncertainty is higher at higher frequency, we introduce
        new function $w(omega)$ approximated by $W(s)$ as
        $W(j omega) approx w(omega)$.

        The transfer function of _uncertainty_ is than
        $
        W(s) Delta(s), max_omega |Delta(j omega)| <= 1, Delta "stable"
        $

        #part(name: [Additive Model])[
            Described as
            $
            G(s) = underbrace(G_0 (s), "nominal model")
            + underbrace(W(s) Delta(s), "additive uncertainty")
            $
            with
            $
            |G(j omega) - G_0 (j omega)| < |W(j omega)|
            $

            #align(center)[#image("includes/add.png", width: 60%)]
        ]

        #part(name: [Multiplicative Model])[
            Described as
            $
            G(s) = underbrace((1 + W(s) Delta(s)), "multiplicative uncertainty")
            G_0 (s)
            $
            with
            $
            (|G(j omega) - G_0 (j omega)|)/(|G_0 (j omega|)) < |W(j omega)|
            $

            #align(center)[#image("includes/mul.png", width: 60%)]
        ]

        #part(name: [Inverse Additive Model])[
            You get the picture
            #align(center)[#image("includes/inv_add.png", width: 60%)]
        ]

        #part(name: [Inverse Multiplicative Model])[
            You get the picture
            #align(center)[#image("includes/inv_mul.png", width: 60%)]
        ]
    ]


    #question(name: [Explain and demonstrate the usage of _Linear Franctional
    Transformation_ (LFT) as a general (unifying) framework for modeling
    uncertainty.])[
        For
        $
        P, N in RR^((n_1 + n_2) times (m_1 + m_2))
        $
        where
        $
        P = mat(
            P_(1 1), P_(1 2);
            P_(2 1), P_(2 2)
        ),
        N = mat(
            N_(1 1), N_(1 2);
            N_(2 1), N_(2 2)
        )
        $

        And matricies
        $
        Delta &in RR^(m_1 times n_1)\
        K &in RR^(m_2 times n_2)
        $

        The *lower* and *upper* LFT is
        $
        cal(F)_l (P, K)
        &= P_(1 1) + P_(1 2) K (I - P_(2 2) K)^(-1) P_(2 1)\
        cal(F)_u (N, Delta)
        &= N_(2 2) + N_(2 1) Delta (I - N_(1 1) Delta)^(-1) N_(1 2)
        $
        #grid(columns: 2, column-gutter: 3em,
            image("includes/lft_pk.png"),
            image("includes/lft_dn.png")
        )

        As example the multiplicative uncertainty
        #align(center)[#image("includes/lft_input_mul.png", width: 60%)]
        will put
        $
        P = mat(
            0, W;
            G_0, G_0
        )
        $
    ]


    #question(name: [Define the $cal(H)_oo$ norm of a system. Both SISO and
    MIMO. In the MIMO case this is related to SVD decomposition of a matrix,
    therefore be ready to explaining the decomposition itself (and, for example,
    to explain the difference between SVD and eigen decomposition).])[

        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left,
            [SISO], $norm(bold(G))_oo = sup_(omega in RR) |bold(G) (j omega)|$,
            [MIMO], $norm(bold(G))_oo = sup_(omega in RR)
            overline(sigma) (bold(G) (j omega))$
        )]
        where $overline(sigma)$ is the largest singular value (from SVD).

        In Matlab callable as
        ```matlab
        norm(G, Inf)
        ```

        Singluar values for symmetric positive definite matrix are eigenvalues.
        But in general singular values of matrix $X$ are square roots of
        eigenvalues of $X^* X$.
    ]


    #question(name: [State the conditions of robust (closed-loop) stability in
    presence of additive or multiplicative uncertainty in the system. State them
    both in the form of a frequency--wise inequality but also in the form
    utilizing the $cal(H)_oo$ norm of a closed-loop transfer function.])[
        $
        |W(j omega) L_0 (j omega)| &< |1 + L_0 (j omega)|, forall omega\
        norm(W T)_oo &<= 1
        $
    ]


    #question(name: [State the conditions of robust (closed-loop) stability
    within the LFT framework (hint: _small gain theorem_).])[
        For
        $
        cal(F)_u (N, Delta) = N_(2 2) + N_(2 1) Delta
        (I - N_(1 1) Delta)^(-1) N_(1 2)
        $
        where
        $
        M := N_(1 1)
        $
        $
        |1 - M(j omega) Delta (j omega)| > 0, forall omega, forall |Delta| <= 1
        $

        The condition is
        $
        1 - |M(j omega)| > 0, forall omega\
        norm(M)_oo < 1
        $
    ]


    #question(name: [State the conditions of robust performance in presence of
    multiplicative uncertainty and discuss how it could be approximated using
    the bound on the $cal(H)_oo$ norm of some related closed--loop transfer
    function.])[
        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left, inset: 5pt,
        
            [nominal performance], $norm(W_P S)_oo < 1$,
            [robust performance], $
            &|W_P S| + |W T| > 1, forall omega\ 
            &norm(mat(W_P S; W T))_oo = max_omega sqrt(|W_P S|^2 + |W T|^2) < 1
            $
        )]
    ]


]

#skills[
    #question(name: [Create a model of an uncertain system in frequency domain,
    that is, you should provide a (model of a) nominal system and a weighting
    filter together with the specification which kind of uncertainty structure
    they are representing (additive, input/output multiplicative, inverse...).
    Design some decent controller using the techniques that you already master
    and check if the resulting feedback interconnection is robustly stable and
    if the performance is robust as well.])[]


]

