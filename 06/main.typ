#import "../lib.typ": *

#knowledge[
    #question(name: [Formulate the general problem of calculus of variations.
    Explain the difference between the _variation_ and _differential_.])[

        #part(name: [General problem of calculus of variations])[
            $
            y(a) = y_a, y(b) = y_b\
            J(y) = integral_a^b L(x, y(x), y'(x)) upright(d) x\
            op("min", limits: #true)_(y(x) in cal(C)^1 [a, b])
            J(y(x))
            $
            - $y in cal(C)^1$ means that the function $cal(C)^1$ continous, meainig
                its derivative is also continous.
        ]

        #part(name: [Variation and differential])[
            _Differential_ is applying a small change to the input of a
            function in order to approximate sensitivity and direction of that
            function at point.

            _Variation_ is applying a small change to the function itself,
            meaining changing some values of the function somewhat.

            As we try to find the _function_ that minimizes some integral, not
            a countable number of values (vector) this makes sense.

            You can imagine it as making differential of a function with output
            of infinite--size vector, values of that vector are values in all
            points of the original varied function.

            _Or not, I don't know, but this would make sense._
        ]

    ]


    #question(name: [Write down the Euler--Lagrange equation and explain that it
    constitutes the first--order necessary condition of optimality for the
    calculus of variations problem
    $op("min", limits: #true)_y(x) integral_a^b L(x, y(x), y'(x))$.])[
        $
        (diff L(x, y(x), y'(x))) / (diff y(x))
        - upright(d)/(upright(d) x) (diff L(x, y(x), y'(x))) / (diff y'(x)) = 0
        $
        
        This gives the first--order necessary condition of optimality #footnote[
            You may remember it from physics as this ugly thing
            $
            (diff L)/(diff q^i) (t, bold(q(t)), dot(bold(q))(t))
            - upright(d)/(upright(d) t)
            (diff L)/(diff dot(q)^i)(t, bold(q(t)), dot(bold(q))(t)),
            i = 1, 2, ..., n
            $
        ].

        - Functions that satisfy this are called _extremals_.

        _I do not really have a intuitive explanation why it is like that._
    ]


    #question(name: [Give the first--order necessary conditions of optimality
    for a general (possibly nonlinear) optimal control problem on a fixed and
    finite time interval. Highlight that it comes in the form of a set of
    differential and algebraic equations together with the boundary conditions
    that reflect the type of the problem.])[
        
    ]


    #question(name: [Give the first--order necessary conditions for an optimal
    control problem on a fixed and finite time interval with a continous LTI
    system and a quadratic cost -- so--called LQ problem. Discuss how the
    boundary conditions change if the final state if regarded fixed or free.])[]


    #question(name: [Characterize qualitatively the solution to the LQ--optimal
    control problem on a fixed and finite time interval with a fixed final
    state. Namely, you should emphasize that it is an open--loop control.])[]


    #question(name: [Characterize qualitatively the solution to the LQ--optimal
    control problem on a fixed and finite time interval with a free final state.
    Namely, you should emphasize that it is a time--varying state--feedback
    control and that the time-varying feedback gains are computed from the
    solution to the differential Riccati equation.])[]


    #question(name: [Explain the basic facts about LQ--optimal control on an
    _infinite time interval_ with a free final state. Namely, you should explain
    that it comes in the form of a state feedback and that the feedback gain can
    be computed either as the limiting solution to the differential Riccati
    equation or (and this is preferrable) as a solution to Algebraic Riccati
    Equation (ARE). The latter option brings in some issues related to existence
    and uniqueness of a stabilizing controller, which you should discuss.])[]


]

#skills[
    #question(name: [Solve the continuous-time LQ-optimal control problem using
    solvers available in Matlab.])[]


]

