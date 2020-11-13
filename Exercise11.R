##Generate a script that simulates growth of the two sub-populations in the tumor to equilibrium followed by drug treatment. 
##Input basic information
timesteps=10000
r=0.1
K=1000000
N0=100
M0=1

#vectors to store 
NsEvents=numeric(length=timesteps)
NsEvents[1]=N0
MsEvents=numeric(length=timesteps)
MsEvents[1]=M0
#variable for changes in growth rate
rnc=-0.1
rmc=0.5*0.1
#Original- normal
for(t in 1:(timesteps-1)){
  NsEvents[t+1]<- NsEvents[t]+r*NsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)  
}

#Original-mutant
for(t in 1:(timesteps-1)){
MsEvents[t+1]<- MsEvents[t]+r*MsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)}

#plot:
library(ggplot2)
normal<-data.frame(time=1:timesteps,N=NsEvents)
ggplot(data=normal,aes(x=time,y=N))+geom_line()+theme_classic()

mutant<-data.frame(time=1:timesteps,M=MsEvents)
ggplot(data=mutant,aes(x=time,y=M))+geom_line()+theme_classic()
#This would help me find the equilibrium, to know when to introduce the drug
#Since, I cant figure that out, based on this I will write the rest of the code as though equilibrium occurred at t=50
#Simulation with new events- normal subpopulation
for(t in 1:(timesteps-1)){
  if(t==50){
    NsEvents[t+1] <- NsEvents[t]+rnc*NsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)
  }
  else{
    NsEvents[t+1] <- NsEvents[t]+r*NsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)
  }
}
#Simulation with new events-Mutant subpopulation
for(t in 1:(timesteps-1)){
  if(t==50){
    MsEvents[t+1] <- MsEvents[t]+rmc*MsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)
  }
  else{
    MsEvents[t+1] <- MsEvents[t]+r*MsEvents[t]*(1-(NsEvents[t]+MsEvents[t])/K)
  }
}
#Plot your results using a line graph.


