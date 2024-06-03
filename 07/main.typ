#import "../lib.typ": *

#knowledge[
    #question(name: [Discuss what kind of changes to the necessary conditions of
    optimality in the form of Euler--Lagrange equations must be made if the
    final time is relaxed. Consider, in addition, that the final state must be
    on some (hyper)surface.])[

        In addition to regular Euler--Lagrange conditions
        $
        (diff L(x, y(x), y'(x))) / (diff y(x))
        - upright(d)/(upright(d) x) (diff L(x, y(x), y'(x))) / (diff y'(x)) = 0
        $
        there is new condition added
        $
        (diff L (x, y(x), y'(x)))/(diff y') |_(x = b) delta y(b)
        + L(x, y(x), y'(x))|_(x=b) Delta b = 0
        $

    ]


    #question(name: [Explain the essence of Pontryagin's principle of maximum.
    Give the first-order necessary conditions of optimality (for optimal
    control) using Pontryagin's principle (instead of the equation of
    stationarity).])[
        It states, that for the optimal control trajectory, the Hamiltonian
        will be maximized, with state and costate being derived from it.
        $
        H(t, bold(x)^*, bold(u)^*, bold(lambda)^*) >=
        H(t, bold(x)^*, bold(u), bold(lambda)^*), bold(u) in cal(U)
        $

        The Hamiltonian is defined as
        $
        H(t, bold(x),  bold(u), bold(lambda))
        = bold(lambda)^T bold(f)(bold(x), bold(u), t) - L(bold(x), bold(u), t)
        $
        this is so called "eastern notation" and it means we want to maximize
        the Hamiltonian.

        As a result
        $
        (diff H)/(diff bold(u)) = 0
        $

        These are the first--order necessary conditions
        $
        dot(bold(x)) &= gradient_bold(lambda) H\
        dot(bold(lambda)) &= - gradient_bold(x) H
        $
    ]


    #question(name: [Give (a sketch of) the derivation of time--optimal control
    for a double integrator with bounds on the control signal -- bang-bang
    control. Discuss the key properties of the resulting controller. Discuss
    also the practical issues related to implementation. What kind of heuristics
    could be used to compensate those issues?])[
        The point is, that by setting $L = 1$, we get a cost function
        $
        J = integral_(t_i)^(t_f) 1 upright(d) t = (t_f - t_i)
        $
        Now for the system
        $
        dot(bold(x)) = bold(A) bold(x) + bold(B) bold(u)\
        t_i = 0, bold(x)(t_i) = bold(r)_0
        $
        with
        $
        bold(x)(t_f) = bold(0)
        $

        With boundary set on control to
        $
        abs(bold(u)_i (t)) <= 1
        $

        The hamiltonian is formed as
        $
        H = bold(lambda)^T (bold(A) bold(x) + bold(B) bold(u)) -1
        $
        meaning the necessary conditions are
        $
        dot(bold(x)) &= gradient_bold(lambda) H
            = bold(A) bold(x) + bold(B) bold(u)\
        dot(bold(lambda)) &= - gradient_bold(x) H
            = - bold(A)^T bold(lambda)
        $

        Now applying the Pontryagin principle of maximality
        $
        H(t, bold(x)^*, bold(u)^*, bold(lambda)^*) >=
        H(t, bold(x)^*, bold(u), bold(lambda)^*), bold(u) in cal(U)
        $
        after cancellations
        $
        (bold(lambda)^*)^T bold(B) bold(u)^* >= 
        (bold(lambda)^*)^T bold(B) bold(u), u_i in [-1, 1]
        $

        the only valid way to get this result is
        $
        bold(u)^* = op("sgn")((bold(lambda)^*)^T bold(B))
        $

        Now for the double integrator
        $
        bold(A) = mat(0, 1; 0, 0), bold(B) = mat(0; 1);
        $
        it means the switching function is simply
        $
        u(t) = op("sgn")(lambda_2 (t))
        $
        in order to get values of the $lambda_2 (t)$ costate, we need to solve
        $
        dot(bold(lambda)) = - gradient_bold(x) H = - bold(A)^T bold(lambda)
        = - mat(0, 1; 0, 0) mat(lambda_1; lambda_2)
        $


        This can be solved analyticaly as
        $
        lambda_1 (t) &= c_1\
        lambda_2 (t) &= c_1 t + c_2
        $

        Now the boundary constraint for the dinal time is simple. As condition
        $
        H(t_f) = 0 => lambda_2 (t_f) u (t_f) = 1
        $
        That means that at final time, as the $u(t_f) = plus.minus 1$ the
        costate is $lambda_2 (t_f) = 1/(u(t_f)) => lambda_2 (t_f) = u(t_f)$.
        That this, rather odd, observation states, is that as $lambda_2 (t)$ is
        a linear function, regardless of where it starts, it will switch the
        output signal
        $
        u(t) = op("sgn")(lambda_2 (t))
        $
        at most once.

        The final issue is usability while facing the real world:
        - hysteresis -- works fine, does not gurantee anything
        - PTOC (_proximate time--optimal control_)
    ]


]

#skills[
    #question(name: [Design a time--optimal controller for a continuous--time
    systems.])[]


]

