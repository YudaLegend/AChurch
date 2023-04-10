countIf :: (Int -> Bool) -> [Int] -> Int
countIf f xs =  length $ filter f xs



pam :: [Int] -> [Int -> Int] -> [[Int]] 
pam xs fs = map (`map` xs) fs -- Porque se tiene que poner en `map` para que pueda compilar
    
pam2 :: [Int] -> [Int -> Int] -> [[Int]]
pam2 xs fs = map (\x -> map ($ x) fs) xs --



filterFoldl :: (Int -> Bool) -> (Int -> Int -> Int) -> Int -> [Int] -> Int
filterFoldl f g n xs = foldl (g) n (filter f  xs)  

insert :: (Int -> Int -> Bool) -> [Int] -> Int -> [Int]
insert f xs n = (takeWhile (not . f n) xs) ++  n:(dropWhile (not . f n) xs)

insertionSort :: (Int -> Int -> Bool) -> [Int] -> [Int]
insertionSort f xs = foldl (insert f) [] xs -- insert f solo tiene un parametro

