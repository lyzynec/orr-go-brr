#import "../lib.typ": *

#knowledge[
    #question(name: [Give the problem statement for the indirect approach to
    continuous--time optimal control. Explain the essence of one or two
    algorithms that are based on the indirect approach (for example, iteration
    over the control, shooting, multiple shooting, collocation)])[
        The indirect approach calls for removing the control from the problem
        using algebraic operations.

        The problem statement thus is
        $
        min_(bold(x), bold(u)) [ phi.alt(bold(x)(t_f))
        &+ integral_(t_i)^(t_f) L(bold(x)(t), bold(u)(t), t) upright(d) t ]\
        $
        suject to
        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left,
            [system dynamics], $dot(bold(x))(t) - bold(f)(bold(x), bold(u), t)
                = bold(0)$,
            [path constarints],
            $bold(h)(bold(x)(t), bold(u)(t), t) <= bold(0)$,
            [initial value],
            $bold(x)(0) - bold(x)_0 = bold(0)$,
            [terminal constraints],
            $bold(r)(bold(x)(t_f)) <= bold(0)$,
        )]

        #part(name: [Indirect single shooting])[
            With the initial guess of $bold(lambda)_0$ we can calculate the
            state--costate trajectory of the entire system, we can than find the
            optimal $bold(lambda)_0$ by Newtons method.

            It creates a map
            $
            bold(lambda)_0 |-> bold(lambda)(t_f, bold(lambda)_0, bold(x)_0)
            $ 
            This map is very nonlinear and thus hard to solve using the
            Newtons method, without accurate initial guess of $bold(lambda)_0$.
        ]

        #part(name: [Indirect Multiple Mhooting])[
            In multiple shooting, we deiide the time iterval into $N$ parts.
            This allows us to make arbitarily short intervals, in which the
            linear approach of shooting method will be increasingly accurate.

            This performs well even without good initial guess $bold(lambda)_0$.

            But same as the single shooting it still is essentialy unusable for
            strongly unstable systems.
        ]

        #part(name: [Indirect Collocation])[
            It does the obvious thing and divide the states and costates
            in time into polynomials, the solvers work through magic fuelled
            by caffeine addiction of its developers.
        ]
        
    ]


    #question(name: [Give the problem statement for the direct approach to
    continous--time optimal control. Explain the essence of one or two
    algorithms from this group such as direct single shooting, direct multiple
    shooting, direct collocation. ])[
        This approach "discretizes" the problem into finite dimensional
        nonlinear ptogram (NLP), and utilizes numerizal NLP methods.

        The problem statement thus is
        $
        min_(bold(x), bold(u)) [ phi.alt(bold(x)(t_f))
        &+ integral_(t_i)^(t_f) L(bold(x)(t), bold(u)(t), t) upright(d) t ]\
        $
        suject to
        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left,
            [system dynamics], $dot(bold(x))(t) - bold(f)(bold(x), bold(u), t)
                = bold(0)$,
            [path constarints],
            $bold(h)(bold(x)(t), bold(u)(t), t) <= bold(0)$,
            [initial value],
            $bold(x)(0) - bold(x)_0 = bold(0)$,
            [terminal constraints],
            $bold(r)(bold(x)(t_f)) <= bold(0)$,
        )]

        #part(name: [Direct single shooting])[
            This method parametrizes the control $bold(u)(t)$ using piecewise 
            constant functions (such as polynomials). Than we somehow wiggle the
            control signal and watch as the systems responds.

            This thing is also nonlinear as hell, and without good initial guess
            of nearly every value it will not work.
        ]

        #part(name: [Direct multiple shooting method])[
            You split the time interval and approximate using some polynomials
            the state and the control using _some_ intial staes.

            Now you have many solved problems, that does not fit together,
            congratulations you have made your problem worse.

            Luckily there are some methods that solve this issue, but we cant be
            really bothered to learn them. Just use CasADi.
        ]
    ]


]

#skills[
    #question(name: [Solve a continuous-time optimal control problem for a
    nonlinear system using a direct method (direct collocation).])[]


]

