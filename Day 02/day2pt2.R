#' --- Day 2: Sonar Sweep pt 2 ---
#' https://adventofcode.com/2021/day/2
#'
#' In addition to horizontal position and depth, you'll also need to track a
#' third value, aim, which also starts at 0. The commands also mean something
#' entirely different than you first thought:
#' 
#' - Down X increases your aim by X units.
#' - Up X decreases your aim by X units.
#' - Forward X does two things:
#'   -  It increases your horizontal position by X units.
#'   -  It increases your depth by your aim multiplied by X.
#'   
#' Using this new interpretation of the commands, calculate the horizontal
#' position and depth you would have after following the planned course.
#' What do you get if you multiply your final horizontal position by your
#' final depth?


# Reading the data
course <- read.table("day2_data.txt", header = TRUE, sep = " ")

# Calculating the length of the data
length <- nrow(course)

#' We will count how many times the words "forward", "up" and "down" appear.
#' Obs: It was my interest to count how many times the words "forward", "up" and
#' "down" appear, but it's not necessary for this challenge.
# forward = 0
# up = 0
# down = 0

# We want to find the final results of the horizontal position, depth and aim
horizontal_position = 0
depth = 0
aim  = 0

# To figure out where the submarine is going, we will use the for function
i = 1
for (i in 1:length){
  
  if (course[i,1] == "forward"){
    
    #print(course[i,1])
    #print(course[i,2])
    #forward = forward + 1
    horizontal_position = horizontal_position + course[i,2]
    depth = depth + aim*course[i,2]
    
    
  } else if (course[i,1] == "up"){
    
    #print(course[i,1])
    #print(course[i,2])
    #up = up + 1
    aim = aim - course[i,2]
    
  } else if (course[i,1] == "down"){
    
    #print(course[i,1])
    #print(course[i,2])
    #down = down + 1    
    aim = aim + course[i,2]

  }
  
  i = i + 1
  
}

# Now we can multiply the final horizontal position and the final depth
answer = horizontal_position * depth
  
cat("What do you get if you multiply your final horizontal position by your final depth?", answer)
