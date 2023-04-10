ones :: [Integer]
ones = iterate (*1) 1


nats :: [Integer]
nats = iterate (+1) 0

ints :: [Integer]

ints = iterate (\x -> if x > 0 then -x else -x+1) 0


triangulars :: [Integer]
triangulars = 0:(scanl (+) 1 [2..])



factorials :: [Integer]
factorials = (scanl (*) 1 [1..])


fibs :: [Integer]
fibs = fibs' 0 1
    where
        fibs' m n = m : fibs' n (n+m)

        
primes :: [Integer]
primes = garbell [2..]
    where
        garbell (p:xs) = p : garbell [x | x <- xs, (mod x p) /= 0]

        
        
        
hammings :: [Integer]
hammings = 1: map (*2) hammings `merge` map(*3) hammings `merge` map(*5) hammings
    where
        merge (x:xs) (y:ys)
            | x < y = x: xs `merge` (y:ys)
            | x > y = y: (x:xs) `merge` ys
            | otherwise = x: xs `merge` (ys)

            
            
            
lookNsay :: [Integer]
lookNsay = map toInteger $ iterate next "1"
    where
        toInteger :: String -> Integer
        toInteger = read

        next :: String -> String
        next [] = []
        next x = convert prefix ++ next suffix
            where
                prefix = takeWhile (== head x) x
                suffix = dropWhile (== head x) x
                convert s = show (length s) ++ [head s]
                
                
                

tartaglia :: [[Integer]]

tartaglia = iterate next [1]
    where next xs = zipWith (+) ([0] ++ xs) (xs ++ [0]) --No entiendo como se tiene que hacer esto





