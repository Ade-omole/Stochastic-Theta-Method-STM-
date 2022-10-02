Numerical simulation of stochastic SIR model

The stochastic SIR model is given as:


<img width="506" alt="Screenshot 2022-10-02 at 12 54 37" src="https://user-images.githubusercontent.com/92954583/193450583-523b6520-f87e-4983-ac97-aa17103f6240.png">

The model is approximated by stochastic theta method (STM) using MATLAB over the time interval $[0,T]$ with $\Delta t = \frac{T}{N}$. Where $\theta \in [0,1]$, and $\Delta W_n = W(t_{n+1})-W(t_{n})$.
