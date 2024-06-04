#import "../lib.typ": *

#knowledge[
    #question(name: [Explain how the peak in the sensitivity and complementary
    sensitivity functions relate to gain and phase margins.])[
        $
        alpha_min = 1 / norm(S(s))_oo
        $

        $
        "GM" &= 1/(1-alpha_1), &"PM" &= 2 arcsin(alpha_2/2)\
        "GM" &>= M_S / (M_S -1), &"PM" &>= 2 arcsin(1/(2 M_S)) 
        $
    ]


    #question(name: [Explain the concept of a _bandwidth_. Shall we define it
    using the sensitivity or the complementary sensitivity functions?])[
        - Using $T$, bandwidth is the frequency from which the gain starts
            rolling off.
        - Using $S$, bandwidth is the frequency up to which the gain is
            small.

        Usually, the difference is small, but for some cases it could be
        significant.
    ]


    #question(name: [Give the two "waterbed effect" integral formulas. You do
    not have to remember the formulas exactly but at least the essence.])[
        Waterbed effect states that one can not have small gain for all
        frequencies, if there is unstable pole involved.
    ]


    #question(name: [Give the SISO version of interpolation conditions of
    internal stability. Namely, assuming that the transfer function of the
    system vanishes at $z$ in the right half plane of the complex plane, it must
    hold that $S(z) = 1$. Similarly, for an unstable pole p of the system, it
    must hold that $T(p) = 1$.])[
        $S(z) = 1$ and $T(p) = 1$
    ]


    #question(name: [Give the lower bound on the peaks in the weighted
    sensitivity function in presence of poles and/or zeros in the right half
    plane.])[
        $
        norm(S)_oo > c\
        norm(T)_oo > c\
        c = (|z + p|)/(|z - p|)
        $
    ]


    #question(name: [How does the time delay in the system affects the
    achievable bandwidth?])[
        As ideal delay transfer function is
        $
        T(s) = e^(- theta s)
        $
        its sensitivity function would be
        $
        S(s) = 1 - e^(- theta s) approx theta s
        $

        As such gain 1 would be achieved at $omega_c = 1/theta$
        $
        omega_c < 1/theta
        $

    ]


    #question(name: [How does the presence of disturbance affect the achievable
    bandwidth?])[
        $
        omega_B > omega_d
        $
        where
        $
        |G_d (j omega_d)| = 1
        $
    ]


    #question(name: [What conditions on system transfer function(s) are imposed
    by the saturation of actuators? More accurately, under which conditions is
    it guaranteed that the actuators do not saturate?])[
        Actuators do not saturate if
        $
        |G^(-1) (j omega) G_d (j omega)| < 1, forall omega
        $
    ]


    #question(name: [Explain the concept of directionality in MIMO systems.])[]


    #question(name: [Explain the condition number of the matrix of transfer
    functions. How can it be computed? Perhaps only approximately.])[
        $
        gamma(G) = (overline(sigma)(G))/(underline(sigma)(G))
        $

        System is ill--conditioned for $gamma(G) > 10$.
        Depends on scaling.

        $
        gamma^* (G) = min_(D_1, D_2) gamma(D_1 G D_2)
        $
        It can be difficult to compute.

        Good approximation comes from Relative Gain Array (RGA)
        $
        Lambda(G) = G circle.small (G^(-1))^T
        $
        $circle.small$ is called Hadamard product, in Matlab it is denoted `.*`.

        Sum of absolute values of elements is close to $gamma^*$.
    ]


    #question(name: [How does the presence of input multiplicative uncertainty
    affect the achievable behaviour of the closed--loop transfer functions?])[]


]

#skills[
    #question(name: [Analyze the provided linear model of dynamics of the system
    to be controlled in order to learn the limitations on achievable performance
    such as bandwidth, resonant peak, steady-state regulation error etc.])[]


]

