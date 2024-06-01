#import "../lib.typ": *

#knowledge[

    #question(name: [Give a rigorous definition of a _local minimum_ (and
    _maximum_) and explain how it differs from a _global minimum_
    (_maximum_).])[
        Local minimum (maximum) $e_x$ of a function is a point in the domain of
        the function for which exists some $epsilon$ for which the values of the
        points closer than $epsilon$ are larger (smaller) than $e_x$.

        In other words, it is a point which is the largest (smallest) in some
        neighbourhood.
    ]


    #question(name: [Define _convex function_, _convex set_ and _convex
    optimization problem_ and explain the impact the convexity has on the
    optimization.])[
        A _convex function_ $f$ is a function such that for all its poins a line
        segment connecting those point lies above the function.

        A _convex set_ is a set in which all poinst can be connected by a line
        segment which is entirely conained in the set.

        A _convex optimization problem_ is an optimization problem in which
        the function is convex.

        Impact of convexity on the optimization is, that any optimum found will
        be a global optimum.
    ]


    #question(name: [State the _Weierstrass_ (extreme value) theorem on
    existence of minimum (maximum).])[
        The theorem states, that if function is continuous, on closed and
        bounded interval, it will attain minimum and maximum at least once.
    ]


    #question(name: [Explain the concepts of _big_ $O()$ and _little_ $o()$
    within the framework of truncated Taylor series.])[
        For a function $f$, if we translate it to a Taylor series and truncate
        the series at a certain point, it states the proportion of the error.
        For
        $
        f(x) = ...\
        f(x) approx a_0 + a_1(x-x_0) + a_2(x-x_0)^2 + ... + a_n(x-x_0)^n
        $
        error is $ <= O(x^(n+1))$

        Little $o()$ is stronger and implies $O()$. It is non--tight bound on
        the asymptotic value as error $< o(x^n)$.
    ]


    #question(name: [Give _first--order necessary conditions of optimality_ for
    a scalar function of a scalar argument and define _critical_ (or
    _stationary_) _point_. Extend these to the vector argument case. Formulate
    them both using a _Fréchet_ and _Gateaux_ derivatives. Specialize the result
    to quadratic functions.])[
        #part(name: [For scalar functions])[
            $
            upright(d)/(upright(d) x) f(x) = 0
            $
            is the first order necessary condition for optimality.

            _Critical point_ is a point satisfing the necessary condition.
        ]

        #part(name: [For vector functions])[
            _Gateaux_ derivative states that the derivative is zero at critical
            point $x^*$ if $f(x^* + alpha bold(d))$ has a minimum at at $x^*$
            for all directions bold(d).

            _Fréchet_ derivative states that the derivative is zero at critical
            point $bold(x)^*$ if $gradient bold(f)(bold(x)^*) = bold(0)$. It
            works directly with perturbation and the error is scaled by
            $norm(bold(d))$ (norm of perturbation).
        ]

        #part(name: [For quadratic functions])[
            $
            f(bold(x)) = 1/2 bold(x)^T Q bold(x) + bold(b)^T bold(x) + c
            $
            if looking for $min f(bold(x))$ the first--order necessary conditions
            are
            $
            gradient f(bold(x)) = (Q^T + Q)/2 bold(x) + bold(b)^T = bold(0)
            $
            for symmetric matrix $Q$ it simplifies to
            $
            gradient f(bold(x)) = Q bold(x) + bold(b)^T = bold(0)
            $
        ]


    ]


    #question(name: [Give second--order sufficient conditions of optimality for
    a scalar function of a scalar argument. How can we distinguish between
    a minimum, maximum, and an inflection point? Extend these to the vector
    case. Define Hessian and show how it can be used to classify the critical
    points into minimum, maximum, saddle point, and singularity point.
    Specialize the results to quadratic functions.])[

        #part(name: [For scalar functions])[
            $
            upright(d)^2 / (upright(d) x^2) f(x) > 0
            $
            is the second order sufficient condition for optimality.

            Minimum is defined by positive second derivative, maximum by
            negative, zero second derivative implies inflextion point.
        ]

        #part(name: [For vector functions])[
            $
            gradient^2 f(x) = H > 0
            $
            meaining the Hessian is _positive definite_.

            Minimum is defined by positive definite Hessian, maximum by
            negative definite, indefinite Hessian implies saddle point.

            Singularity point is defined by zero Hessian.

        ]

        #part(name: [For quadratic functions])[
            $
            f(bold(x)) = 1/2 bold(x)^T Q bold(x) + bold(b)^T bold(x) + c
            $
            if looking for $min f(bold(x))$ the second--order sufficient
            conditions are
            $
            gradient^2 f(bold(x)) = (Q^T + Q)/2 = H > 0
            $
            for symmetric matrix $Q$ it simplifies to
            $
            gradient^2 f(bold(x)) = Q = H > 0
            $
        ]

        

    ]


    #question(name: [Give first-order necessary condition of optimality for an
    equality--constrained optimization problem using Lagrange multipliers.
    Specialize the results to quadratic cost functions and linear
    constraints.])[
        For optimization
        $
        op("min", limits: #true)_(bold(x) in RR^n) f(bold(x))\
        "subject to" bold(h)(bold(x)) = bold(0)
        $

        the Lagrange function is
        $
        cal(L)(bold(x), bold(lambda)) = f(bold(x))
            + bold(lambda)^T bold(h)(bold(x))
        $

        and the first--order necessary condition is
        $
        gradient cal(L)(bold(x), bold(lambda)) = bold(0)
        $

        which implies
        $
        gradient f(bold(x)) + sum_(i = 1)^m lambda_i gradient h_i(bold(x))
        & = bold(0)\
        bold(h)(bold(x)) & = bold(0)
        $


        #part(name: [For quadratic cost functions and linear constraints])[
            $
            op("min", limits: #true)_(bold(x) in RR^n)
            1/2 bold(x)^T bold(Q) bold(x) + bold(b)^T bold(x)
            "subject to" bold(A) bold(x) + bold(b) = bold(0)
            $

            the first--order necessary condition is
            $
            mat(
                bold(Q), bold(A)^T;
                bold(A), bold(0)
            )
            vec(bold(x), bold(lambda)) = vec(-bold(r), bold(b))
            $

        ]

    ]


    #question(name: [Characterize the regular point (for a given set of equality
    constraints). Give an example of equality constraints lacking
    regularity.])[
        Regular point is a point $x$ for which the Jacobian
        $gradient bold(h)(bold(x))^T$ is regular. Lack of regularity implies
        defect in formulation.

        Singular Jacobian can be obtained by introducing two identical
        constraints.
    ]


    #question(name: [Give second-order sufficient conditions of optimality for
    an equality-constrained optimization problem using the concept of a
    projected Hessian.])[
        Projected Hessian is defined as
        $
        bold(H)_P = bold(Z)^T gradient_(bold(x)bold(x))^2
        cal(L)(bold(x), bold(lambda)) bold(Z)
        $
        where $bold(Z)$ is orthonormal basis of the nullspace of the Jacobian
        $gradient bold(h)(bold(x))^T$.

        The sufficient condition is $bold(H)_P > 0$.

        Using unconstrained Hessian $gradient_(bold(x)bold(x))^2
        cal(L)(bold(x), bold(lambda))$ is unnecessarily strong.

    ]


    #question(name: [State and explain the Karush-Kuhn-Tucker (KKT) conditions
    for inequality-constrained optimization problems.])[
        For optimization
        $
        op("min", limits: #true)_(bold(x) in RR^n) f(bold(x))\
        "subject to" bold(g)(bold(x)) <= bold(0)
        $
        the KKT conditions are
        $
        gradient f(bold(x)) + sum_(i=1)^p mu_i gradient g_i(bold(x)) &= bold(0)\
        bold(g) &<= bold(0)\
        mu_i g_i(bold(x)) &= 0 "for" i = 1,2, ..., m\
        mu_i &>= 0 "for" i = 1, 2, ..., m
        $

        The first line states (in domain of real numbers) that
        $
        op("sign")(f'(x) = -op("sign")(g'(x)))
        $
        meaining, that either we are inside the domain and $f$ is minimal or
        we are at the boundary.

        The third line states that for $g(x) < 0$ the $mu = 0$

    ]

]

#skills[
    #question(name: [Formulate a provided problem as an instance of mathematical
    optimization: identify the cost function, the constraints, decide if the
    problems fits into one of the (numerous) families of optimization problems
    such as linear program, quadratic program (with linear constraints, with
    quadratic constraints), (general) nonlinear program, ...])[]

    
    #question(name: [Solve a provided linear and/or quadratic programming
    problem using a solver of your choice.])[]

]
