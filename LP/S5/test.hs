es:: [Int]
es = do
    x <- [1]
    y <- [2]
    return (x+y)
    
    
d:: [Int]
d = [1,2,3] >>= \x -> [4,5] >>= \y -> return x  
    
    
