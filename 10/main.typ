#import "../lib.typ": *

#knowledge[
    #question(name: [Explain and demonstrate how we can describe uncertainty in a linear model of a dynamical system in frequency domain (using a weighting filter W and the Δ term). Discuss the additive and multiplicative (input and output) models of uncertainty and their inverses. ])[]


    #question(name: [Explain and demonstrate the usage of Linear Franctional Transformation (LFT) as a general (unifying) framework for modeling uncertainty.])[]


    #question(name: [Define the H∞ norm of a system. Both SISO and MIMO. In the MIMO case this is related to SVD decomposition of a matrix, therefore be ready to explaining the decomposition itself (and, for example, to explain the difference between SVD and eigen decomposition).])[]


    #question(name: [State the conditions of robust (closed-loop) stability in presence of additive or multiplicative uncertainty in the system. State them both in the form of a frequency-wise inequality but also in the form utilizing the H∞ norm of a closed-loop transfer function.])[]


    #question(name: [State the conditions of robust (closed-loop) stability within the LFT framework (hint: small gain theorem).])[]


    #question(name: [State the conditions of robust performance in presence of multiplicative uncertainty and discuss how it could be approximated using the bound on the H∞ norm of some related closed-loop transfer function.])[]


]

#skills[
    #question(name: [Create a model of an uncertain system in frequency domain, that is, you should provide a (model of a) nominal system and a weighting filter together with the specification which kind of uncertainty structure they are representing (additive, input/output multiplicative, inverse...). Design some decent controller using the techniques that you already master and check if the resulting feedback interconnection is robustly stable and if the performance is robust as well.])[]


]
