#assignment_partA: native data structure (vector,factor,list,data frame,matrix)

library(tidyverse)

# vectors
scores <- c(10, 20, 25, 30)
student_names <- c("ama", "fave", "kofi", "abena")

scores * 2
scores > 10

student_names[1]
scores[c(2, 4)]
student_names[-1]
scores[scores > 10]

# factors
grade_f <- factor(c("A", "B", "C", "D"))
levels(grade_f)
table(grade_f)

# list
student <- list(
  name = "Dave",
  age = 20,
  scores = c(10, 17, 15),
  paid = TRUE
)

student$name
student["scores"]
student[4]

# matrix
m <- matrix(1:6, nrow = 2, ncol = 3)
m[1, ]
m[, 2]
m[2, 3]

# data frame
df <- data.frame(
  name = c("cedric", "polly", "luffy"),
  marks = c(53, 47, 15),
  paid = c(TRUE, FALSE, TRUE)
)

df[2, ]
df[, "marks"]
df[3, "name"]

#---------------------------------------------------------------------------

# part b: import and explore the starwars dataset
survey <- starwars
dim(survey)
glimpse(survey)
colSums(is.na(survey))

# -------------------------------------------------------------------------

# part c: filter, select, mutate and arrange the data
survey_clean <- survey %>%
  filter(height >= 100) %>%
  select(name, height, mass, gender) %>%
  drop_na(height, mass) %>%
  mutate(bmi_like = mass / (height / 100)^2) %>%
  arrange(desc(height))

survey_clean

# drop_na() removes rows with missing height and mass
survey_nona <- survey %>%
  drop_na(height, mass)

survey_nona

# pivot_longer() reshapes height and mass into one column of names and one of values
survey_long <- survey %>%
  select(name, height, mass) %>%
  pivot_longer(
    cols = c(height, mass),
    names_to = "measure",
    values_to = "value"
  )

survey_long
