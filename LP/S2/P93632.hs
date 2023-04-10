eql :: [Int] -> [Int] -> Bool
eql xs ys = length xs == length ys && and (zipWith (==) xs ys)



--eql [] [] = True
--eql [] _ = False
--eql _ [] = False
--eql (x:xs) (y:ys)
    -- | x == y = True && eql xs ys
    -- | otherwise = False
    
    
prod :: [Int] -> Int
prod xs = foldl (*) 1 xs

--prod [] = 1
--prod (x:xs) = x * prod xs




prodOfEvens :: [Int] -> Int
prodOfEvens xs = prod (filter even xs)


--prodOfEvens [] = 1`
--prodOfEvens (x:xs)
    -- | even x = x * prodOfEvens xs
    -- | otherwise = 1 * prodOfEvens xs


    
powersOf2 :: [Int] 
powersOf2  = iterate (*2) 1


scalarProduct :: [Float] -> [Float] -> Float
scalarProduct (xs) (ys) = foldl (+) 0 (zipWith (*) xs ys)

--scalarProduct [] [] = 0.0
--scalarProduct (x:xs) (y:ys) = x*y + scalarProduct xs ys


