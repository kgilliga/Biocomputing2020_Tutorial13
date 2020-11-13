##Generate a script that simulates growth of the two sub-populations in the tumor to equilibrium followed by drug treatment. 
##Input basic information
timesteps=100
r=0.1
K=1000000
N0=100

#50% of its growth rate in the absence of the drug and the non-mutant sub-population declines rapidly.
#Assume in the absence of the cancer drug that the cells grow at a rate of 0.1 per day (rN = rM = 0.1) 
#and the carrying capapcity (K) of the tumor is one million cells. 
#The mutation of a single cell occurred early in the tumor growth and when it occurred there were 100 total cells in the tumor. 
#Drug treatment of non-mutant cells results in a negative growth rate of -0.1.
#Plot your results using a line graph.