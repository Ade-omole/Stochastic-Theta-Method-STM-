Numerical simulation of stochastic SIR model

The stochastic SIR model is given as:


<img width="506" alt="Screenshot 2022-10-02 at 12 54 37" src="https://user-images.githubusercontent.com/92954583/193450583-523b6520-f87e-4983-ac97-aa17103f6240.png">

The model is approximated by stochastic theta method (STM) using MATLAB over the time interval $[0,T]$ with $\Delta t = \frac{T}{N}$, where $\theta \in [0,1]$, and $\Delta W_n = W(t_{n+1})-W(t_{n})$. The discretised equations is given as:


<img width="870" alt="Screenshot 2022-10-02 at 13 28 27" src="https://user-images.githubusercontent.com/92954583/193451658-a55f0385-85be-472c-8f01-7525a21f11fd.png">


The discretised equations becomes Euler-Maruyama (EM) method if $\theta = 0$, the trapezoidal method if $\theta = \frac{1}{2}$, and the implicit, or backward Euler method if $\theta = 1$. The solution of the stochastic SIR model is given in the interval $[0.1000]$ related to the initial values $[S(0), I(0), R(0)]^T = [0.7, 0.2. 0.1]^T$.
