factorial :: (Enum a, Num a) => a -> a
factorial n = product [1..n]

doubleme x = x + x
