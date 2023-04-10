data Queue a = Queue [a] [a]
     deriving (Show)

create :: Queue a
create = Queue [] []

push :: a -> Queue a -> Queue a
push n (Queue xs xy) = Queue xs ([n]++xy)


pop :: Queue a -> Queue a
pop (Queue xs xy)
    | null xs = Queue a b
    | otherwise = Queue c d
    where
        a = (tail (xs++(reverse xy)))
        b = []
        c = (tail (xs))
        d = xy


top :: Queue a -> a
top (Queue xs xy)
    | null xs = last xy
    | otherwise = head xs

empty :: Queue a -> Bool
empty (Queue xs xy) = (null xs) && (null xy)



instance Eq a => Eq (Queue a)
    where
        (Queue xs xy) == (Queue ys yy) = (xs++(reverse xy)) == (ys ++ (reverse yy))

instance Functor Queue where
    fmap f (Queue xs ys) = Queue (map f xs) (map f ys)


translation :: Num b => b -> Queue b -> Queue b
translation n (Queue xs xy) = fmap (+n) (Queue xs xy)

unio:: (Queue a) -> (Queue a) -> Queue(a)
unio (Queue l1 r1) (Queue l2 r2) = Queue( l1 ++ (reverse r1) ++ l2 ++ (reverse r2) ) []


instance Applicative Queue where
     pure p = Queue [p] []
     (Queue l1 rl1) <*> (Queue l2 rl2) = Queue [f x | f <- l1 ++ reverse rl1, x <- l2 ++ reverse rl2] [] 

instance Monad Queue where
     return p = Queue [p] []
     (Queue l rl) >>= f = foldl unio create $ map f $ l ++ reverse rl
     


