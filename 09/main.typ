#import "../lib.typ": *

#import "@preview/cetz:0.2.2"

#knowledge[
    #question(name: [Explain the necessary changes to the LQR framework in the
    case when the system is exposed to some random disturbances and the initial
    conditions are random as well (this is called _stochastic_ LQR problem). The
    answer is that there are no changes needed, the same formulas for the
    optimal state--feedback gain can be used as in the deterministic case.])[
        The answer is laready there.
    ]


    #question(name: [Discuss the guarantees on the stability margins for the LQR
    state--feedback regulator.])[
        #align(center)[#grid(columns: 2,
            row-gutter: 10pt, column-gutter: 10pt, align: left, inset: 5pt,
            [gain margin], $"GM"_+ &= oo\ "GM"_- &= 1/2$,
            [phase margin], $"PM"_+ &>= 60 deg\ "PM"_- &<= -60 deg$
        )]
    ]


    #question(name: [Discuss the possible extensions of the LQR framework in the
    situation when not all the states are measured. In particular, explain the
    idea behind the LQG controller, that is, a combination of a LQR
    state--feedback controller and a Kalman filter.])[
        The idea is, that we use the optimal Gaussian obserer -- the Kalman
        filter, and use it as a source of information for LQR controller.
    ]


    #question(name: [Discuss the guarantees on the stability margins for LQG
    controller. Here, John Doyle's famous abstract gives a sufficient answer:
    there are none...])[
        The robustness, loop--by--loop could be any, but put together, there
        are none of these guarantees.
    ]


    #question(name: [Explain the key idea behind the Loop Transfer Recovery
    (LTR) control strategy as a heuristic means of restoring the robustness of
    an LQG controller.])[
        In order to force Kalman not to trust so heavily the input information,
        introduce noise to that signal.
    ]


    #question(name: [Reformulate both the LQR and the LQG problems with the new
    setup featuring a _generalized system_ and a feedback controller in the
    feedback loop.])[

    ]


    #question(name: [Give the definition of the $H^2$ system norm and explain
    how its minimization relates to LQR/LQG--optimal control.])[
        $H^2$ norm is defined for stable and strictly proper system
        $
        norm(bold(G))_2 = sqrt(
        1/(2 pi) integral_(-oo)^(oo) op("tr")
        [bold(G)^* (j omega) bold(G) (j omega)] upright(d) omega)
        $
        in time domain
        $
        norm(bold(G))_2 = sqrt(
            integral_0^oo op("tr")
            [bold(g)^T (t) bold(g) (t)] upright(d) t
        )
        $

        $H^2$ norm indicates the amplification of white noise
        $
        E{bold(y)^T (oo) bold(y) (oo)} = norm(bold(G))_2^2 S_w
        $
    ]


]

#skills[
    #question(name: [Design an LQG/LTR regulator/controller.])[]


]

