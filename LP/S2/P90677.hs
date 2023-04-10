myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ a [] = a
myFoldl f a (b:b1) = myFoldl f (f a b) b1 


myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ a [] = a
myFoldr f a (b:b1) = f b (myFoldr f a b1)


myIterate :: (a -> a) -> a -> [a]
myIterate f a = [a] ++ myIterate f (f a)


myUntil :: (a -> Bool) -> (a -> a) -> a -> a
myUntil f g a = if not (f a) then myUntil f g (g a) else a

myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldl (\a b -> a ++ [f b] ) [] xs


myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = myFoldl (\a x -> if (f x) then a ++ [x] else a ++ []) [] xs 


myAll :: (a -> Bool) -> [a] -> Bool
myAll f xs = myFoldr (\current acumulated -> (f current) && acumulated) False xs
--myAll f xs = myFoldl (\ a b -> (f a) && b) True xs Esto no compila

myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = myFoldr (\current acumulated -> (f current) || acumulated) False xs
--myAny f xs = myFoldl (\ a b -> (f a) && b) True xs  Esto no compila

myZip :: [a] -> [b] -> [(a, b)]
myZip [] _ = []
myZip _ [] = []
myZip (x:xs) (y:ys) = (x,y):(myZip xs ys)

myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith f xs xy = foldl (\a (x,y)  -> a ++ [(f x y)] ) [] (myZip xs xy) 
