#' --- Day 1: Sonar Sweep pt 1 ---
#' https://adventofcode.com/2021/day/1


#' Report indicates that, scanning outward from the submarine,
#' the sonar sweep found depths of the following vector:
#report <- c(199, 200, 208, 210, 200, 207, 240, 269, 260, 263)
report <- read.table("day1pt1_data.txt", header = TRUE, sep = "")

#' The first order of business is to figure out how quickly the depth increases.
#' To do this, count the number of times a depth measurement increases from the 
#' previous measurement. There is no measurement before the first measurement.

# j is counting the number of times the depth measurement increased.
i = 1; j = 0

# Here we create an empty character vector.
answer <- character(0)
# Length of the report is the number of rows in the table.
length <- nrow(report)
# As we know, there is no measurement before the first measurement.
answer[i] <- "N/A"

for (i in 1:length){
  if ((i+1) <= length && report[i+1,] > report[i,]){
    #print(report[i+1,])
    answer[i+1] <- "increased"
    j = j + 1
  } else if ((i+1) != (length+1)){
    answer[i+1] <- "decreased"
  }
  i = i + 1
}

# Table in which we can see the increases and decreases of the data.
answer <- matrix(answer)

# Output where we can see when the measurement increased or decreased.
write(answer, "day1pt1_answer.txt")

# Other way to create an output.
#' teste1pt1 <- file("dia1pt1_answer.txt")
#' writeLines(answer, teste1pt1)
#' close(teste1pt1)

#cat("Number of lines of the data: ", length)
cat("Numer of times the depth measurement increased: ", j)
