#import "../lib.typ": *

#import "@preview/algo:0.3.3": algo, i, d

#knowledge[
    #question(name: [Explain the main principle of descent direction methods for
    unconstrained optimization. In particular, give the descent direction
    condition.])[

        First task is finding a descent direction, than we perform a line search
        of minimizing over that direction.
        $
        bold(x)_(k+1) = bold(x)_k + alpha_k bold(d)_k
        $

        Descent direction condition is
        $
        gradient f(bold(x)_k)^T bold(d)_k < bold(0)
        $
    ]


    #question(name: [Give an overview of approaches for line search, that is, a
    one--dimensional optimization.])[
        There are three main options:
        - fixed step
        - exact search
        - approximate search

        #part(name: [Fixed step])[
            Descent is poerfomed in fixed steps, meaining it must be estimated
            beforehand what step size will be taken. This may result in poor
            performance.
        ]

        #part(name: [Exact search])[
            In each step the step size is calculated to minimize the value.
            This can be done using for example:
            - bisection
            - golden section
            - Newton method

            For quadratic functions, there is even a closed--form formula.

            This may be computationaly expensive.
        ]

        #box(width: 100%)[
            *Approximate search:*
            Most popular method is backtracking, where the fixed step size is
            adjusted if it is too large:
            with given $bold(x)_k$, $bold(d)_k$, $s$, $beta$, $gamma$
            #algo[
                $alpha_k = s$\
                while $f(bold(x)_k) - f(bold(x)_k + alpha_k bold(d)_k) <
                    -gamma alpha_k bold(d)^T gradient f(bold(x)_k)$ do #i\
                $alpha_k = beta alpha_k$ #d\
                end\
            ]
        ]
    ]


    #question(name: [Explain the steepest descent (aka gradient) method. Discuss
    its shortcomings.])[
        Steepest descent is a method od making steps in the direction of the
        opposite of gradient.
        $
        bold(d)_k = -gradient f(bold(x)_k)\
        bold(x)_(k+1) = bold(x)_k - alpha_k gradient f(bold(x)_k)
        $

        Its greatest shortoming is, that it does not perform well in proximity
        of the local minimum, the approach significantly slows or zig--zags.
    ]


    #question(name: [Explain conditioning of a matrix and what impact it has on
    convergence of steepest descent algorithm. Propose a modification of a
    steepest descent method that includes scaling of the original matrix such
    that conditioning is improved.])[
        Matrix conditioning can be checked by calculating the condition number
        of given matrix
        $
        kappa(bold(A)) = norm(bold(A)^(-1)) dot norm(bold(A))
        $

        This can be also caluclated as ratio between largest and smallest
        singular number
        $
        kappa(bold(A)) = (sigma_"max" (bold(A)))/(sigma_"min" (bold(A)))
        $
        Ideally $kappa(bold(A)) approx 1$ as for larger condition number, the
        optimization algorithm will perform more steps.

        We can improve the performance by introducing matrix $bold(S)$ which
        transforms the vector $bold(x)$ into $bold(x) = bold(S) bold(y)$ ,thus
        changing the original function as
        $
        f(bold(x)) = f(bold(S) bold(y))
        $

        For steepest descent, the iterations change
        $
        underbrace(bold(S) bold(y)_(k+1), bold(x)_(k+1)) =
            underbrace(bold(S) bold(y)_k, bold(x)_k)
            - alpha_k underbrace(bold(S) bold(S)^T, bold(D))
            gradient underbrace( f(bold(S) bold(y)_k), f(bold(x)_k))
        $

        the iteration is than
        $
        bold(x)_(k+1) = bold(x)_k - alpha_k bold(D)_k gradient f(bold(x)_k)
        $

        The matrix $bold(S)$ should satisfy
        $
        gradient^2 f(bold(S) bold(y)) approx bold(I)
        $

        So good option is diagonal matrix $bold(D)$ with
        $
        bold(D)_(i i) = [gradient f(bold(x)_k)]_(i i)^(-1)
        $

    ]


    #question(name: [Explain the Newton method for unconstrained minimization.
    Give also the its interpretation as a method for root finding. Discuss its
    shortcomings.])[
        We are trying to find a location where
        $
        f'(bold(x)) = bold(0)
        $

        For that we can use Newton method as it provides algorithm for finding
        the root of a function.

        As such to find
        $
        op("min", limits: #true)_(bold(x) in RR^n) f(bold(x))
        $
        we perform
        $
        bold(x)_(k+1) = bold(x)_k -(gradient^2 f(bold(x)_k))^(-1)
            gradient f(bold(x)_k)
        $

        For rootfinding in scalar form the algoritm can be used as
        $
        x_(k+1) = x_k - g(x_k)/(g'(x_k))
        $
        when trying to find a root of $g(x) = 0$.

        The Newton method also scales the Hessian nicely, using the inverse
        resolves the issue of matrix conditioning.

        Main disadvantages of Newtons method for optimization are
        - need to compute Hessian
        - need to invert Hessian
        - Hessian needs to be nonsingular and positive definite

        Last two points may be resolved by using Quasi-Newton methods.

    ]


    #question(name: [Discuss the issue of solving a set of linear equations
    (in matrix-vector form) as they appear in the Newton method. Which matrix
    factorization will be appropriate?])[]


    #question(name: [Explain the key idea behind Quasi-Newton methods.])[
        Main idea is replacing the inverse of the Hessian by another matrix
        (denoted $bold(B)$). This may be perfomred using two main methods:
        - Gauss--Newton method
        - BFGS updates
    ]


    #question(name: [Explain the key idea behind trust region methods for
    unconstrained optimization. What are the advantages with respect to descent
    direction methods?])[
        Trust region method makes an approximation (often quadratic) of the
        surroundings of the current point in which it expects the approximation
        to hold.

        It is in essence other option for line-serach as it first estimate step
        size and than looks for direction in that region.

        It changes the size of the region by estimating the quality of
        approximation.


        Greatest advantage is that it can be used in non--convex settings.
    ]


]

#skills[
    #question(name: [Write Matlab code implementing a Quasi-Newton method for
    minimization of a provided function.])[
        ```matlab
        % first we initilize B
        B = eye(n);
        while norm(grad(x, f)) > epsilon
            step = - B \ grad(x, f);
            y = grad(x + step, f) - grad(x, f);
            B = B - (B * s * s' * B)/(s' * B * s) + (y * y')/(s' * y);
            x = x + step;
        end
        ```
    ]


]