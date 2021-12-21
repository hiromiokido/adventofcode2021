#' --- Day 1: Sonar Sweep pt 2 ---
#' https://adventofcode.com/2021/day/1


#' Report indicates that, scanning outward from the submarine,
#' the sonar sweep found depths of the following vector:
report <- read.table("day1pt2_data.txt", header = TRUE, sep = "")

#' Compare the first and second three-measurement windows.
#' Count the number of times the sum of measurements in this sliding window
#' increases from the previous sum. So, compare A with B, then compare B
#' with C, then C with D, and so on. Stop when there aren't enough measurements
#' left to create a new three-measurement sum.


k = 1; 
length <- nrow(report) # Length of the report is the number of rows in the table.

sum = numeric(0)

#' We have to stop when there aren't enough measurements left to create a new
#' three-measurement sum. Because is a three-measurement sum, we have to stop
#' in length-2 to prevent the program of adding non-existent numbers
for (k in 1:(length-2)){
  sum[k] = report[k,] + report[k+1,] + report[k+2,]
  k = k + 1
}

write(sum, "day1pt2_sum.txt", sep = "\n")

# -- Now we do the same step as part 1 -- #
i = 1; j = 0 # j is counting the number of times the depth measurement increased.
answer <- character(0) # Here we create an empty character vector.
answer[i] <- "N/A" # As we know, there is no measurement before the first measurement.
length2 <- length(sum)

for (i in 1:length2){
  if ((i+1) <= length2 && sum[i+1] > sum[i]){
    #print(sum[i+1,])
    answer[i+1] <- "increased"
    j = j + 1
  } else if ((i+1) != (length2+1)){
    answer[i+1] <- "decreased"
  }
  i = i + 1
}

answer <- matrix(answer) # Table in which we can see the increases and decreases of the data.

write(answer, "day1pt2_answer.txt") # Output where we can see when the measurement increased or decreased.

cat("Number of times the depth measurement increased: ", j)
