#Instalacao do pacote
install.packages("NonlinearRegression")

#  Instalacao do pacote pelo github se nao for possivel instalar pelo comando anterior.
# if(!requireNamespace("devtools", quietly = TRUE))install.packages("devtools")
#   devtools::install_github("AlcineiAzevedo/NonlinearRegression")



#####################################################
#Comparacao de modelos
#####################################################
remove(list=ls()) #Apagando a memoria do r
library(NonlinearRegression)   #Ativando o pacote

#Indicando a pasta de trabalho
setwd("D:/Backup Pendrive/UFMG/Disciplinas/Tópicos Avançados em Estatística experimental/2021/Regressao nl")


#Exemplo com dados sem repeticao
Dados=read.table("DadosMED.txt",h=T)

modelo=y~a*x^b/(c^b+x^b)
chute=list(a=36,b=2,c=30)
Ajuste1=fit_regression(Data =Dados,model = modelo,start = chute,design=1)
plot_regression(Ajuste1,plot=2)
plot_regression(Ajuste1,plot=7,xlabel = "Dias",ylabel = "Altura (cm)")

#Modelo logistico
Ajuste2=fit_regression(Data =Dados,model = 7,start = c(a=30,b=5,c=0.1),design=1)
plot_regression(Ajuste2,plot=7,xlabel = "Dias",ylabel = "Altura (cm)")


#Modelo Gompertz
Ajuste3=fit_regression(Data =Dados,model = 6,start = c(a=30,b=5,c=0.1),design=1)
plot_regression(Ajuste3,plot=7,xlabel = "Dias",ylabel = "Altura (cm)")


#Modelo Brody
Ajuste4=fit_regression(Data =Dados,model = 10,start = c(a=30,b=1,c=0.05),design=1)
plot_regression(Ajuste4,plot=7,xlabel = "Dias",ylabel = "Altura (cm)")


m=list(Ajuste1,Ajuste2,Ajuste3,Ajuste4)
CompareModels(m)
