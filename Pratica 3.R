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


#Exemplo com dados de experimento em dic
DadosDIC=read.table("DadosDIC.txt",h=T)
?fit_regression

modelo=y~a*x^b/(c^b+x^b)
chute=list(a=36,b=2,c=30)
AjusteDIC=fit_regression(Data =DadosDIC,model = modelo,start = chute,design=2)
plot_regression(AjusteDIC,plot=7,xlabel = "Doses",ylabel = "Altura (cm)")

DadosMed=aggregate(DadosDIC,by=list(DadosDIC$Doses),mean)[,-c(1,3)]
DadosMed
AjusteMED=fit_regression(Data =DadosMed,model = modelo,start = chute,design=1)
plot_regression(AjusteMED,plot=7,xlabel = "Doses",ylabel = "Altura (cm)")

