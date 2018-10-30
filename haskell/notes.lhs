########################################
# Data Types

Lists
> [1, 2, 3, 4]
> [1..4]
> "hello"

Tuples
> (1, 2)
> ('a', 1)
> [(1, 2), (3, 4), (5, 6)]

########################################
# Operators

Addition
> 5 + 4

Concatenation
> "a" ++ "b"

Push
> 'a' : "b"
> 5 : [4, 3, 2, 1]

Indexing
> "Testing" !! 0
> reverse [1, 2, 3] !! 0

Leftward Associativity
> succ $ succ 8
> max 10 $ max 9 8

########################################
# List Comprehensions

First 10 powers of 2
> [ 2^x | x <- [0..9]]

########################################
# Reimplementations

> length' xs = sum [ 1 | _ <- xs ]

########################################
# Class Constraints

* EQ -- == and /=
* Ord -- ordering between members (requires EQ)
* Show -- can be converted to string
* Read -- converts from string to some other type
* Enum -- sequentially ordered types (can be used in list)
* Bounded -- defines minBound and maxBound
* Num -- class acts like number
* Integral -- whole numbers, Int and Integer
* Floating -- floating point numbers, Float and Double

########################################
# Pattern Matching

as pattern matching:

> capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

