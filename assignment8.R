#Place the Assignment 6 dataset (tab‑ or space‑delimited) on your computer.
#In R, read it into a data frame:
# choose file interactively
student6 <- read.table(file.choose(),header=TRUE,sep=",")
#Load plyr and compute the mean of Grade by Sex:
library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
#Write the grouped means to a text file:
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

#Convert the data (if not already) to a data frame (see above).
#Select rows where Name contains “i” or “I”:
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
#Extract just the names and write them to a CSV:
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

#Save the full filtered data frame to a CSV:
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)

