#import "../lib.typ": *

#knowledge[
    #question(name: [Give some examples of practically useful optimal control
    cost functions (aka performance indices).])[]


    #question(name: [Explain the challenges in designing controllers with a
    fixed structure (e.g. PID controllers) by optimizing over their
    coefficients.])[]


    #question(name: [Formulate the general (nonlinear) problem of optimal
    control design for a discrete-time system as a numerical optimization over
    (finite) control sequences. Discuss the two possible variants: simultaneous
    and sequential.])[]


    #question(name: [Formulate the problem of optimal regulator design for a
    discrete-time linear time-invariant (LTI) system over a finite time horizon
    and with a quadratic performance index as a quadratic program (QP). Develop
    fully both the simultaneous and sequential forms of the optimization problem
    and consider also including the inequality constraints. What is the major
    disadvantage of the control strategy based on the offline optimization over
    a control sequence?])[]


    #question(name: [Explain the essence of receding horizon control also known
    as model predictive control (MPC). What are the major advantages and
    disadvantages?])[]


    #question(name: [Formulate the MPC regulation for a linear system and a
    quadratic cost as a quadratic program. Give both the simultaneous and
    sequential versions.])[]


    #question(name: [Formulate the MPC tracking for a linear system and a
    quadratic cost as a quadratic program. Explain the need for replacement of
    the control signals by their increments in the optimization problem. Give
    both the simultaneous and sequential versions.])[]


    #question(name: [Discuss the anticipatory reference tracking (aka preview
    control) and show how this could be achieved using MPC.])[]


    #question(name: [Show how soft constraints can be included in the MPC
    optimization problem and discuss the motivation for their introduction.])[]


    #question(name: [Explain the difference between the prediction horizon and
    control horizon.])[]


]

#skills[
    #question(name: [Implement a simple model predictive controller (MPC) in
    both the simultaneous and sequential formats using Matlab. Rely on the
    availability of numerical solvers for quadratic programming, that is, you do
    not have to write your own optimization solver.])[]


]