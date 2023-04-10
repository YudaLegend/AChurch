flatten :: [[Int]] -> [Int]
flatten xs = foldl (++) [] xs

myLength :: String -> Int
myLength xs = sum $ map (const 1) xs



myReverse :: [Int] -> [Int]
myReverse list = foldl (\xs x -> x:xs) [] list



countIn :: [[Int]] -> Int -> [Int] 
countIn xs n = map (\x -> length( filter (==n) x)) xs


firstWord :: String -> String
firstWord xs = takeWhile (/= ' ') (dropWhile (== ' ') xs)





