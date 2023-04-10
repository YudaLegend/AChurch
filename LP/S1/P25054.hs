myLength :: [Int] -> Int
myLength (xs) = length(xs)


myMaximum :: [Int] -> Int
myMaximum [x] = x
myMaximum (x:x':xs) = myMaximum( (if x < x' then x' else x):xs)

average :: [Int] -> Float
average [] = 0
average xs = (fromIntegral $ sumatorio xs ) / (fromIntegral $ length xs )


sumatorio :: [Int] -> Int
sumatorio [] = 0
sumatorio (x:xs) = x + sumatorio xs


buildPalindrome :: [Int] -> [Int] 
buildPalindrome xs = reverse xs ++ xs


remove :: [Int] -> [Int] -> [Int]
remove [] _ = []
remove (x:xs) xa 
    | x `elem` xa = remove xs xa
    | otherwise = x : remove xs xa



flatten :: [[Int]] -> [Int] 
flatten xs = concat xs

oddsNevens :: [Int] -> ([Int],[Int])
oddsNevens [] = ([],[])
oddsNevens (x:xs)
    | even x = ( xo, x : xe)
    | otherwise = (x : xo, xe)
        where
            (xo,xe) = oddsNevens xs
            

            
isPrime :: Int -> Bool 
isPrime 0 = False
isPrime 1 = False
isPrime n = not (n `esDividit` [2 .. (floor (sqrt (fromIntegral n))) ])


esDividit :: Int -> [Int] -> Bool
esDividit n [] = False
esDividit n (x:xs) = (mod n x == 0) || esDividit n xs       
            
            
            
primeDivisors :: Int -> [Int]
primeDivisors n = [x | x <- [1..n], rem n x == 0 && isPrime x]

