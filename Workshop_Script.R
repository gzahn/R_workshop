#######################
### THE VERY BASICS ###
#######################

# What is R?

# R is an open source programming language and software environment
# for statistical computing and graphics that is supported by the 
# R Foundation for Statistical Computing. The R language is widely 
# used among statisticians and data miners for developing statistical 
# software and data analysis.

# "COMMENTS"

# This hastag symbol "#" denotes a comment. That means the computer will ignore everything on a line after it
# That's why each of these lines begins with a "#"
# It's good practice to use these comments to help lay out your plan in a readable manner
# Or just to give some useful information

# "EXPRESSIONS"

# R can handle all sorts of mathematical and logical expressions. 
3+4 # Here, it will evaluate 3 + 4, but it ignores everything after the hashtag on this line
5*2 # This evaluates 5 times 2
10/3 # Can you figure out this one? ;)

# ASSIGNMENTS

# You can assign values, vectors, lists, or even data tables to an object for later use
# There are two main ways of doing this: an equal sign (=), or a directional arrow (<-)

bob = 3+4 # This assigns the evaluated function (3 + 4) to an object (like a variable) called "bob"
# bob should equal 7
jane <- 5*2 # This assigns the value of 5 times 2 to an object called "jane" - Either symbol works

# LOGICAL EVALUATIONS

# R can process a host of logical evaluations.  For example we can ask whether bob or jane is greater...
bob > jane # This gives us the value "FALSE" - bob is 7, jane is 10
bob < jane # This gives the value "TRUE"

# The values "TRUE" and "FALSE" are special reserved values. You should never use them as a name for an object!!!
# This goes for numbers as well. The number "3" cannot be assigned to any other value, for obvious reasons.



###############
#    INPUT    #
###############

# You can just sit around in R naming numbers and doing arithmetic, but a calculator is probably faster for that
# What you really want is to work on data, most likely

# You can input your data into R manually, or you can import it from something like a spreadsheet

# One way to manually enter data is with the command c() 
# That stands for "concatenate" and allows you to enter a series of values to be saved to a single object:
billy = c(2,3,4,5,6) # "billy" is now a NUMERIC VECTOR of 5 values
# c() requires you to separate the various elements with a comma

# This works for STRINGS as well. Strings are made up of characters
suzy = c("This","is","a","character","vector") # notice how each string is enclosed in quotes. That tells R it is a string

# Think of these values (billy and suzy) like lists.  They have inherent order, so we can access any part of them:

billy[1] # The brackets [] allow you to pick one or more elements from an object.  Here, we asked for the first element
# What value would billy[3] give you?

# If our vectors are the same lengths, we can easily combine them to form "2-dimensional" data. Most data you
# want to explore will probably be 2-dimensional. If you have a series of observations and measured several variables
# during each observation, that is 2-dimensional. Let's input some fake biological data to take a look:
# we can pretend that we collected 10 random fruit flies and measured their wingspan and mass

observation = c(1,2,3,4,5,6,7,8,9,10) # our vector of observations from a reeated experiment
wingspan = c(1.2,1.4,1.0,1.2,1.8,2.0,2.2,1.1,2.3,2.0) # our vector of wingspans
mass = c(0.43,0.44,0.32,0.44,0.52,0.55,0.56,0.42,0.51,0.57) # our vector of mass

# we now have three vectors that are the same length. We can stick them together into a "matrix"
# one way to do this is the cbind() function. It stands for "column bind"

cbind(observation,wingspan,mass) # this will show us our matrix, but we want to assign it to an object!

data = cbind(observation,wingspan,mass) # assigned to an object called "data"

data

# Accessing elements of 2-dimensional data

# Just like a 1-dimensional vector, we can access any part of our matrix, but we need to provide 2 locations.
# We need to give a row position and a column position
# in R, the brackets to access an element accept input as follows: [row,column]
# So to get the element in row 1, column 3 we write:

data[1,3]

# This kind of access is very useful. To add the mass of the first 5 flies we caught, you can write:

data[1,3] + data[2,3] + data[3,3] + data[4,3] + data[5,3]

# or you could use the "sum" function, which adds all the elements inside it, separated by commas

sum(data[1,3],data[2,3],data[3,3],data[4,3],data[5,3])

# But there's an easier way...

data[1:5,3] # This gives you ROWS 1 through 5, and COLUMN 3 - 1:5 means "1 through 5"

sum(data[1:5,3]) # All you have to do is enclose that in the "sum" function!

# With 2-dimensional data, if you want ALL of the rows or columns you just leave that index blank

data[,3] # This gives you ALL rows, but only column 3
data[3,] # This gives you ONLY row 3, but all columns

# With our fake flies, we are fake interested in seeing whether wingspan correlates with total mass
# Check out how easy it is to start plotting that!

plot(x=data[,2], y=data[,3]) # the plot() function wants you to give it the vector for the x and y axes. DONE!
# We told the plot function that our x axis should be column 2 (wingspan) and the y axis should be column 3 (mass)

# Want to see if that correlation we see is statistically significant?  R makes that very simple as long as you 
# know what tests to use!

summary(glm(data[,3] ~ data[,2])) # this gives a summary table of a general linear model test

#########################
#    IMPORTING DATA     #
#########################

# Odds are that you will have a lot more than 10 flies and two measurements each
# These data are usually entered into something like excel
