#' --- Day 2: Sonar Sweep pt 1 ---
#' https://adventofcode.com/2021/day/2
#'
#' It seems like the submarine can take a series of commands:
#' 
#' - Forward X increases the horizontal position by X units.
#' - Down X increases the depth by X units.
#' - Up X decreases the depth by X units.
#' 
#' Note that since you're on a submarine, down and up affect your depth,
#' and so they have the opposite result of what you might expect.
#' 
#' The submarine seems to already have a planned course - your puzzle input.
#' Calculate the horizontal position and depth you would have after following
#' the planned course. What do you get if you multiply your final horizontal
#' position by your final depth?


# Reading the data
course <- read.table("day2_data.txt", header = TRUE, sep = " ")

# Calculating the length of the data
length <- nrow(course)

#' We will count how many times the words "forward", "up" and "down" appear.
#' Obs: It was my interest to count how many times the words "forward", "up" and
#' "down" appear, but it's not necessary for this challenge.
forward = 0
up = 0
down = 0

# We want to find the final results of the horizontal position and depth
horizontal_position = 0
depth = 0

# To figure out where the submarine is going, we will use the for function
i = 1
for (i in 1:length){
  
  if (course[i,1] == "forward"){
    
    #print(course[i,1])
    #print(course[i,2])
    forward = forward + 1
    horizontal_position = horizontal_position + course[i,2]
    
  } else if (course[i,1] == "up"){
    
    #print(course[i,1])
    #print(course[i,2])
    up = up + 1
    depth = depth - course[i,2]
    
  } else if (course[i,1] == "down"){
    
    #print(course[i,1])
    #print(course[i,2])
    down = down + 1    
    depth = depth + course[i,2]

  }
  
  i = i + 1
  
}

# Now we can finally multiply the horizontal position and the depth
answer = horizontal_position * depth
  
cat("What do you get if you multiply your final horizontal position by your final depth?", answer)
