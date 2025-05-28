#import "../lib.typ": *

#knowledge[
    #question(name: [Explain the concept of _Linear Matrix Inequality_ (LMI).
    Characterize the feasible set of such inequalitiy(--ies). In particular, is
    the feasible set convex? Show a few simple examples of an LMI from linear
    algebra or control theory.])[
        Such inequality looks like this
        $
        underbrace(bold(F)_0 + bold(F)_1 x_1 + bold(F)_2 x_2 + ...
        + bold(F)_m x_m, bold(F)(bold(x))) succ 0
        $
        Stating the positive--definitness of the matrix.

        As example
        $
        mat(1, 0, 0; 0, 2, -1; 0, -1, 2) +
        mat(1, 0, 0; 0, 0, -1; 0, -1, 0) x_1 +
        mat(0, 0, 1; 0, 0, 0; 1, 0, 0) x_2 succ 0\
        mat(
            x_1 + 1, 0, x_2;
            0, 2, -x_1 - 1;
            x_2, -x_1 - 1, 2;
        ) succ 0
        $
        to solve we get the principal minors as
        $
        d_1 &= x_1 + 1 > 0\
        d_2 &= 2 x_1 + 2 > 0\
        d_3 &= -x_1^3 -3 x_1^2 -2 x_2^2 + x_1 + 3 > 0
        $
        the solution looks like
        #align(center)[#image("includes/lmi_solution.svg", width: 50%)]

        If the feasible set exists it will be convex.
    ]


    #question(name: [Explain the concept of semidefinite programming (SDP). Show
    a few simple examples from linear algebra or control theory.])[
        Linear optimization with LMI constraints:
        $
        min_(bold(x) in RR^n) bold(c)^T bold(x)\
        "subject to" bold(F)(bold(x)) succ 0
        $

        As example we can solve asymptotic stability of a system
        $
        dot(bold(x)) = bold(A) bold(x)(t)
        $
        entails asking for $bold(X)$
        $
        bold(X) = bold(X)^T succ 0
        $
        solving the Lyapunov equation
        $
        bold(A)^T bold(X) + bold(X) bold(A) = - bold(Y)
        $
        for
        $
        bold(Y) = bold(Y)^T succ 0
        $

        That can be formulated as LMI problem
        $
        bold(A)^T bold(X) + bold(X) bold(A) &prec 0\
        bold(X) &succ 0
        $
        or in one matrix
        $
        mat(
            bold(X), bold(0);
            bold(0), -bold(A)^T bold(X) - bold(X) bold(A)
        ) succ 0
        $
    ]


]

#skills[
    #question(name: [Express a given simple linear--algebraic or
    control--theoretic problem as an LMI (or, generally, semidefinite program)
    and solve the optimization problem in Matlab (using Yalmip or another). ])[]


]

