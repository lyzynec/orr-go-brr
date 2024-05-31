#import "../lib.typ": *

#knowledge[
    #question(name: [Explain the necessary changes to the LQR framework in the case when the system is exposed to some random disturbances and the initial conditions are random as well (this is called stochastic LQR problem). The answer is that there are no changes needed, the same formulas for the optimal state-feedback gain can be used as in the deterministic case.])[]


    #question(name: [Discuss the guarantees on the stability margins for the LQR state-feedback regulator.])[]


    #question(name: [Discuss the possible extensions of the LQR framework in the situation when not all the states are measured. In particular, explain the idea behind the LQG controller, that is, a combination of a LQR state-feedback controller and a Kalman filter.])[]


    #question(name: [Discuss the guarantees on the stability margins for LQG controller. Here, John Doyle's famous abstract gives a sufficient answer: there are none...])[]


    #question(name: [Explain the key idea behind the Loop Transfer Recovery (LTR) control strategy as a heuristic means of restoring the robustness of an LQG controller.])[]


    #question(name: [Reformulate both the LQR and the LQG problems with the new setup featuring a generalized system and a feedback controller in the feedback loop.])[]


    #question(name: [Give the definition of the H2 system norm and explain how its minimization relates to LQR/LQG-optimal control.])[]


]

#skills[
    #question(name: [Design an LQG/LTR regulator/controller.])[]


]

