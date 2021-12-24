#' --- Day 3: Binary Diagnostic pt 1 ---
#' https://adventofcode.com/2021/day/3
#'
#' The diagnostic report (your puzzle input) consists of a list of binary
#' numbers which, when decoded properly, can tell you many useful things
#' about the conditions of the submarine. The first parameter to check is
#' the power consumption.
#' 
#' You need to use the binary numbers in the diagnostic report to generate
#' two new binary numbers (called the gamma rate and the epsilon rate). 
#' The power consumption can then be found by multiplying the gamma rate 
#' by the epsilon rate.
#' 
#' Each bit in the gamma rate can be determined by finding the most common 
#' bit in the corresponding position of all numbers in the diagnostic report.
#' 
#' power_consumption = gamma_rate * epsilon_rate
#' 
#' Use the binary numbers in your diagnostic report to calculate the gamma 
#' rate and epsilon rate, then multiply them together. What is the power 
#' consumption of the submarine? Be sure to represent your answer in decimal,
#' not binary.

library(readr) # To read the table

binary <- nchar(readLines("day3_data.txt", n = 1))
report <- read_fwf("day3_data.txt", fwf_widths(rep(1, binary)), show_col_types = FALSE)

# Column length of the binary number
length_column <- ncol(report) 
# Counting by columns
column = 1 

# vectors of the most common and less common numbers of the column 
most_common <- numeric()
less_common <- numeric()

# Created a loop to study the report columns
for (column in 1:length_column){
  # Inside the loop, we select the most common value using tail, names, sort and table
  test <- tail(names(sort(table(report[,column]))), n = 1)
  # Now we sort it. If 0 is the common value, it will append zero to the vector
  if (test == "0"){
    most_common <- append(most_common, 0)
    less_common <- append(less_common, 1)
  } else { # If 1 is the most common, it will append one instead of zero
    most_common <- append(most_common, 1)
    less_common <- append(less_common, 0)    
  }
  column = column + 1
}

# Collapsing values to be able to identify the decimal number
most_common <- paste(most_common, collapse ="")
less_common <- paste(less_common, collapse ="")

cat("The gamma rate is the binary number", most_common)
cat("The epsilon rate is the binary number", less_common)

# Transforming binary number to decimal number
gamma_rate <- strtoi(most_common, base = 2)
epsilon_rate <- strtoi(less_common, base = 2)

# Multiplying the results to find the power consumption
power_consumption = gamma_rate * epsilon_rate

cat("The power consumption of the submarine is:", power_consumption)


###########################################################
#
# Checking the number of zeros and ones in the table:
# 
#length_row <- nrow(report) # Line length of binary number
#length_column <- ncol(report) # Column length of the binary number
# 
#row = 1
#column = 1
#
#zero = 1 # Number of zeros
#one = 1 # Number of ones
#
#for (column in 1:length_column){
#  for(row in 1:length_row){
#    if (report[row,column] == "0"){
#      zero = zero + 1
#    } else if (report[row,column] == "1"){
#      one = one + 1
#    }
#    row = row + 1
#  }
#  column = column + 1
#}
#