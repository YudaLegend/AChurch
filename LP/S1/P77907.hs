absValue :: Int -> Int
absValue n
    | n>= 0 = n
    | otherwise = -n


power:: Int -> Int -> Int
power _ 0 = 1
power x n
    | even n = y*y
    | otherwise = y*y*x
    where
        y = power x n_halved
        n_halved = div n 2


isPrime :: Int -> Bool 
isPrime 0 = False
isPrime 1 = False
isPrime n = not (n `esDividit` [2 .. (floor (sqrt (fromIntegral n))) ])


esDividit :: Int -> [Int] -> Bool
esDividit n [] = False
esDividit n (x:xs) = (mod n x == 0) || esDividit n xs


slowFib :: Int -> Int
slowFib 0 = 0
slowFib 1 = 1
slowFib n = slowFib (n - 1) + slowFib (n-2)


quickFib :: Int -> Int
quickFib n = multMat 0 1 n


multMat :: Int -> Int -> Int -> Int
multMat x y 0 = x
multMat x y n = multMat y (x+y) (n-1)















