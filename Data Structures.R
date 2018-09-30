# Data structures in R


#Vectors----
x=1:10  #create sequence of numbers from 1 to 10
x
x1<- 1:20
x1
(x1=1:30)
(x2=c(1,2,13,4,5))
class(x2)
(x3=letters[1:10])
class(x3)
LETTERS[1:26]
?c
(x3b=c('a',"Suman","4"))
class(x3b)
(x4=c(T,FALSE,TRUE,T,F))
class(x4)
x5=c(3L,5L)
class(x5)
(x5b=c(1,'a',T,4L))
class(x5b)

#access elements
(x6=seq(0,100,by=3))
methods(class='data.frame')
methods(class='numeric')
?seq
#[1] 0 2 4 6 8 10
ls() #variables in my environment
x6
length(x6)
x6[20]
x6[3] #access 3rd element
x6[-c(1,5,20)]
x6[-c(1:10,15:20)]
(x7=c(x6,x2)) #combine 2 vecotrs into vector

#sorting
sort(x6,decreasing=T)
sort(x6[-c(1,2)])
rev(x6)

seq(-3,10,by=.2)
(x=-3:2)
x[2]<-0;  #modify 2nd element

#[1] -3 0 -1 0 1 2
x
x<0
x[x<0]=5 #modify elements less than 0
x[x<=1&x>=1]=100
x[x<=1&x>=-1]=100

#delete vector
(x=seq(1,5,length.out=10))
x=NULL
x
#NULL
x[4]

(x=rnorm(100))
(x1=rnorm(1000,mean=50,sd=5))
plot(density(x1))
mean(x1)
abline(v=mean(x1),h=0.04)


#matrices----
100:111
(m1=matrix(1:12,nrow=4))
(m2=matrix(1:12,ncol=3,byrow=T))
x=101:124
length(x)
matrix(x,ncol=6)

class(m1)

attributes(m1)
dim(m1)
m1

#access elements of matrix
m1[1,2:3]
m1[c(1,3),]
m1[,1]
m1[,-c(1,3)]

paste("C","D",sep="-")

(colnames(m1)=paste('C',1:3,sep=''))
m1
(rownames(m1)=paste('R',1:4,sep=''))
m1
attributes(m1)

#Vector to Matrix
(m3=1:24)
dim(m3)=c(6,4)
m3

m2[1:5] #matrix is like vector
m2
m2[c(TRUE,F,T,F),c(2,3)] #logical indexing
m2[m2>5 &m2<10]
m2
m1;m2
m1[1:2,1:2]


#modify vector

m2
m2[2,2]
m2[2,2]=10
m2
rbind(m2,c(50,60,70))
m2
cbind(m2,c(50,60,70,80))
cbind(m2,m2)

#row and col wise summary
m1
colSums(m1);rowSums(m1)
colMeans(m1);rowMeans(m1)

t(m1) #transpose
sweep(m1,MARGIN=1,STATS=c(2,3,4,5),FUN="+") #rowwise
sweep(m1,MARGIN=2,STATS=c(2,3,4),FUN="*") #colwise

?sweep

#addmargins
m1
?addmargins
addmargins(m1,margin=1,sum) #colwise function
addmargins(m1,1,sd) #colwise function

addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function

addmargins(m1,c(1,2),list(list(mean,sum,max),list(var,sd))) #row and col wise function

#Arrays----



#Data Frame----
#Create vectors to be combined into DF
(rollno=1:30)
(sname=paste('student',1:30,sep=''))
(gender=sample(c('M','F'),size=30,replace=T,prob=c(.7,.3)))
(marks=floor(rnorm(30,mean=50,sd=10)))
#set.seed(1234)
(marks2=ceiling(rnorm(30,40,5)))
(course=sample(c('BBA','MBA'),size=30,replace=T,prob=c(.5,.5)))
rollno;sname;gender
marks;marks2;course


#create DF
df1=data.frame(rollno,sname,gender,marks,marks2,course,stringsAsFactors=F)

str(df1) #structure of DF
head(df1)#top 6 rows
head(df1,n=3) #top 3 rows
?summary

#Factors----


#Lists----