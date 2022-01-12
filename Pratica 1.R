remove(list=ls())
install.packages("NonlinearRegression")

#  Instalacao do pacote pelo github se nao for possivel instalar pelo comando anterior.
#   if(!requireNamespace("devtools", quietly = TRUE))install.packages("devtools")
#   devtools::install_github("AlcineiAzevedo/NonlinearRegression")

library(NonlinearRegression) #Ativa o pacote

setwd_script()
DadosMED=read.table("DadosMED.txt",h=T)

plot(DadosMED$Dias,DadosMED$Altura)


?fit_regression   #Abrindo o manual da funcao
#dados sem repeticao
modelo=y~a*x^b/(c^b+x^b)  #Carregando um modelo
chute=list(a=36,b=2,c=30) #Definindo os chute inicial
#Ajustando o modelo
Ajuste1=fit_regression(Data =DadosMED,model = modelo,start = chute,design=1)
#Fazendo o grafico
?plot_regression
plot_regression(Ajuste1,plot=2)
plot_regression(Ajuste1,plot=3,xlabel = "Dias",ylabel = "Altura (cm)")

#Ajustando o Modelo logistico
Ajuste2=fit_regression(Data =DadosMED,model = 7,
                       start = c(a=30,b=4,c=0.1),design=1)
plot_regression(Ajuste2,plot=7,xlabel = "Dias",ylabel = "Altura (cm)")

