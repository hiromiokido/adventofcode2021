#' --- Day 3: Binary Diagnostic pt 2 ---
#' https://adventofcode.com/2021/day/3
#'
#' Next, you should verify the life support rating, which can be determined
#' by multiplying the oxygen generator rating by the CO2 scrubber rating.

library(readr) # To read the table
library(tidyverse) # To subset or extract data frame rows based on certain criteria

binary <- nchar(readLines("day3_data.txt", n = 1))
report <- read_fwf("day3_data.txt", fwf_widths(rep(1, binary)), show_col_types = FALSE)

# Data frame of the most common and less common numbers of the column 
most_common <- data.frame(report)
less_common <- data.frame(report)

# Column length of the binary number
length_column <- ncol(report) 
# Counting by columns
column = 1 

# TO find the oxygen generator rating we use the tail function
for (column in 1:length_column){
  oxygengenerator_test <- tail(names(sort(table(most_common[,column]))), n = 1)
  if (oxygengenerator_test == "1"){
    most_common <- most_common  %>% filter(most_common[,column] == oxygengenerator_test)
  } else {
    most_common <- most_common  %>% filter(most_common[,column] == oxygengenerator_test)
  }
  column = column + 1
}

# TO find the CO2 Scrubber rating we use the head function
for (column in 1:length_column){
  CO2_scrubber_test <- head(names(sort(table(less_common[,column]))), n = 1)
    if (oxygengenerator_test == "1"){
      less_common <- less_common  %>% filter(less_common[,column] == CO2_scrubber_test)
    } else {
      less_common <- less_common  %>% filter(less_common[,column] == CO2_scrubber_test)
    }
  column = column + 1
}

# Collapsing values to be able to identify the decimal number
oxygen_generator_rating <- paste(most_common, collapse ="")
CO2_scrubber_rating <- paste(less_common, collapse ="")

cat("The oxygen generator rating is the binary number", oxygen_generator_rating)
cat("The CO2 scrubber rating is the binary number", CO2_scrubber_rating)

# Transforming binary number to decimal number
oxygen_generator_rating <- strtoi(oxygen_generator_rating, base = 2)
CO2_scrubber_rating <- strtoi(CO2_scrubber_rating, base = 2)

# Multiplying the results to find the life support rating
life_support_rating = oxygen_generator_rating * CO2_scrubber_rating

cat("The life support rating of the submarine is:", life_support_rating)
