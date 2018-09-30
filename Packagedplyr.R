#data analysis using dplry

install.packages(dplyr)
library(dplyr)
?mtcars
dplyr::filter(mtcars,mpg>25&am==1)
filter(mtcars,mpg>25&am==1) #no need to append dplyr the second time
mtcars%>%filter(mpg>25&am==1)
mtcars%>%filter(mpg>25&am==1)%>%arrange(wt)%>%summarise(n()) #piping the filters
count(mtcars)
mtcars%>%group_by(am)%>%summarise(mean(mpg))
mtcars%>%group_by(am)%>%summarise(mean())
?select
mtcars%>%group_by(am)%>%select(mpg,starts_with("21"))
mtcars%>%group_by(am)%>%select(mpg,ends_with("21"))
mtcars%>%group_by(am)%>%select(mpg,matches("21.4"))
