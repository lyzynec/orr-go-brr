#import "../lib.typ": *

#knowledge[
    #question(name: [Give the general optimization criterion for the
    control--design procedure based on minimizing the $cal(H)_oo$--norm of the
    mixed sensitivity function.])[
        $
        min_(K "stabilizing") norm(mat(W_1 S; W_2 K S; W_3 T))_oo
        $

        $W_i$ are called _shaping filters_ and have to be strictly stable
        - $W_1$ expresses our performance requitements, typically a low pass
            filter as we do not care about performance at higher frequencies.
        - $W_2$ is typically a high pass filter, dampening regulator eagerness
            at given frequancies.
        - $W_3$ is typically a high pass filter, stating that we want low $T$
            (transfer) in higher frequencies for robustness.
    ]


    #question(name: [Explain the control design procedure based on minimizing
    the $cal(H)_oo$--norm of the linear fractional transformation (LFT) of a
    generalized plant and a stabilizing controller.])[
        + design the plant such that it makes sense I guess
        + $min_(K "stabilizing") norm(F_l (P, K))_oo$
        + cry
    ]


]

#skills[
    #question(name: [Design a robust controller by $cal(H)_oo$ *norm
    minimization* (your task is actually just to formulate the control design
    problem as the optimization problem, the actual numerical job of
    optimization can be relegated to an available numerical solver). Namely, you
    should master the technique of control design by minimizing the $cal(H)_oo$
    *norm of mixed sensitivity* function but you should also be able to
    formulate (and use Matlab to solve) the *general* $cal(H)_oo$*--optimal
    control problem*.])[]


]

