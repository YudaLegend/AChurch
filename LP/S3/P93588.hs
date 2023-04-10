myMap :: (a -> b) -> [a] -> [b]
myMap f xs = [ f x | x <- xs]



myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = [x | x <- xs, f x]


myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f xs xy = [ f x y | (x,y) <- zip xs xy ]


thingify :: [Int] -> [Int] -> [(Int, Int)]
thingify xs xy = [(x,y) | x <- xs, y <- xy, mod x y == 0]


factors :: Int -> [Int]
factors n = [ x | x <- [1..n], mod n x == 0]

countIf :: (Int -> Bool) -> [Int] -> Int
countIf f xs =  length $ filter f xs



pam :: [Int] -> [Int -> Int] -> [[Int]]
pam xs fs = map (\f -> map f xs) fs -- Porque se tiene que poner en `map` para que pueda compilar

pam2 :: [Int] -> [Int -> Int] -> [[Int]]
pam2 xs fs = map (\x -> map ($ x) fs) xs --



filterFoldl :: (Int -> Bool) -> (Int -> Int -> Int) -> Int -> [Int] -> Int
filterFoldl f g n xs = foldl (g) n (filter f  xs)

insert :: (Int -> Int -> Bool) -> [Int] -> Int -> [Int]
insert f xs n = (takeWhile (not . f n) xs) ++  n:(dropWhile (not . f n) xs)

insertionSort :: (Int -> Int -> Bool) -> [Int] -> [Int]
insertionSort f xs = foldl (insert f) [] xs -- insert f solo tiene un parametro
