insert :: [Int] -> Int -> [Int]
insert [] n = [n]
insert (x:xs) n
    | x < n = x : insert xs n
    | x >= n = n : x:xs
    
    
isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert xy x
    where
        xy = isort xs


remove :: [Int] -> Int -> [Int] 
remove [] _ = []
remove (x:xs) n
    | x == n = remove xs n
    | otherwise = x : remove xs n

    
    
ssort :: [Int] -> [Int]
ssort [] = []
ssort (x:xs)
    | null xs = [x]
    | min < x   = min : ssort ys
    | otherwise = x : ssort xs
    where
        ys = remove xs min ++ [x]
        min = minimum xs



merge :: [Int] -> [Int] -> [Int]
merge [] [] = []
merge [] xs = xs
merge xa [] = xa
merge (d:xa) (x:xs)
    | d < x = d : merge (xa) (x:xs)
    | otherwise = x : merge (d:xa) (xs)

msort :: [Int] -> [Int]
msort [] = []
msort [x] = [x]
msort xs = merge (msort left) (msort right)
    where
        left = take n xs
        right = drop n xs
        n = length xs `div` 2
        


qsort :: [Int] -> [Int]
qsort [] = []
qsort (p:xs) = qsort lower ++ [p] ++ qsort greater
    where
        lower = [x | x <- xs, x < p]
        greater = [x | x <- xs, x >= p]


genQsort :: Ord a => [a] -> [a]
genQsort [] = []
genQsort (p:xs) = genQsort lower ++ [p] ++ genQsort greater
    where
        lower = [x | x <- xs, x < p]
        greater = [x | x <- xs, x >= p]



    
    
