#Practice Exercise 

#Create a 100 row DF with following variables
#gender, spl, age, experience, grade, placement
(gender=sample(c('M','F'),size=100,replace=T,prob=c(.6,.4)))
(spl=sample(c('Finance','Marketing','HR'),size=100,replace=T,prob=c(0.3,0.4,0.3)))
(grade=sample(c('A','B','C','D'),size=100,replace=T,prob=c(0.3,0.4,0.2,0.1)))
(placement=sample(c('Yes','No'),size=100,replace=T,prob=c(.6,.4)))
(age=sample(c(21,22,23,24,25,26,27,28,29,30),size=100,replace=T))
(experience=rnorm(100,4,1))
(students=data.frame(gender,spl,grade,placement,age,experience))
students$gender=factor(students$gender)
plot(students$spl,col=students$gender)
head(students)
str(students)
summary(students)

#storing contents to file
write.csv(students,"XIMB Students.csv")

#summarise the data in varous ways using dplyr
library(dplyr)
names(students)
#piping and filtering
students%>%group_by(placement,gender)%>%summarise(mean(experience),max(experience),mean(age)) 

students%>%filter(spl=='Marketing')%>%group_by(spl)%>%summarise(mean(age),mean(experience))
students%>%filter(spl!='Marketing')%>%group_by(spl)%>%summarise(mean(age),mean(experience))

#draw few graphs to understand distribution of data

hist(students$age)
t1=table(students$placement)
boxplot(t1,col=1:2)
boxplot(students$age)
pairs(students[,c('age','experience')])
pie(t1)

par(mfrow=c(2,2))  #mfcol for columnwise traversal
pie(table(students$gender))
pie(table(students$placement))
pie(table(students$grade))
pie(table(students$spl))
par(mfrow=c(1,1))
table(students$gender,students$placement,students$spl)


#find students having largest experience in each spl for each gender
students%>%group_by(spl,gender)%>%arrange(spl,gender,experience)%>%top_n(1,experience)

#Read contents from file
write.csv(students,'./data/XIMB.csv')

students2=read.csv('./data/XIMB.csv') #Creating a new data frame from CSV
head(students2)


#Clustering
km3=kmeans(students[,c('age','experience')],centers=3) #Kmeans for 3 clusters
km3
km3$centers
plot(students[,c('age','experience')],col=km3$cluster)

#Decision Tree
library(rpart) #library required
library(rpart.plot)

tree=rpart(placement~.,data=students) #selec all other variables
tree
rpart.plot(tree,nn=T,cex=.8) #plotting a tree
printcp(tree)
ndata=sample_n(students,5) #sample of 3 records
ndata
predict(tree, newdata=ndata, type='class')
predict(tree, newdata=ndata, type='prob')

#logistic Regression
logitmodel1=glm(placement~.,data=students,family='binomial')
summary(logitmodel1)
logitmodel2=glm(placement~age+gender,data=students,family='binomial')
summary(logitmodel2)
logitmodel1a=glm(placement~age,data=students,family='binomial')
summary(logitmodel1a)

#linear Regression
linear1=lm(age~.,data=students)
summary(linear1)

#it is not necessary to have a linear or logistic model to do a prediction. It depends on the data. 
