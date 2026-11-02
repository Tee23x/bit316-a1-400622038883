#assignment_partA: native data structure (vector,factor,list,data frame,matrix)

library(tidyverse)

notes<-c(10,20,25,30)
names<-c("ama","fave","kofi","abena")

notes *2
notes>10

names[1]
notes[c(2,4)]
names[-1]
notes[notes>10]


grade_f<-factor(c("A","B","C","D"))
levels(grade_f)
table(grade_f)

studient<-list(name="Dave",
               age=20,
               scores=c(10,17,15),
               paid=TRUE            
)

studient$name
studient["scores"]
studient[4]


m<-matrix(1:6,nrow=2,ncol = 3)
m[1,]
m[,2]
m[2,3]

df<-data.frame(
  name = c("cedric","polly","luffy"),
  marks=c(53,47,15),
  paid=c(TRUE,FALSE,TRUE)
  
)
df[2, ]
df[,"marks"]
df[3,"name"]

#---------------------------------------------------------------------------

#part b:import and explore the starwars dataset
survey<-starwars
dim(survey)
glimpse(survey)
colSums(is.na(survey))

# -------------------------------------------------------------------------

#part c:filter,select,mutate and arrange the data

survey_clean<-survey %>%
  filter(height>=100) %>%
  select(name,height,mass,gender) %>%
  mutate(bmi_like = mass/(height/1000)^2)  %>%
  arrange(desc(height))

#drop_na() remove rows with missing height and mass
survey_nona<-survey %>%
  drop_na(height,mass)
survey_nona

#pivot_longer() reshapes heightand mass into one column of name and one of values
survey_long<-survey %>%
  select(name,height,mass) %>%
  pivot_longer(cols=c(height,mass),
               names_to = "measure",
               values_to = "value")
survey_long
