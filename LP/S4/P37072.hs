data Tree a = Node a (Tree a) (Tree a) | Empty deriving (Show)

size :: Tree a -> Int
size Empty = 0
size (Node _ fe fd) = 1 + (size fe) + (size fd)


height :: Tree a -> Int
height Empty = 0
height (Node _ fe fd) = 1 + max (height fe) (height fd)



equal :: Eq a => Tree a -> Tree a -> Bool
equal Empty Empty = True
equal Empty _ = False
equal _ Empty = False
equal (Node x fe1 fd1) (Node y fe2 fd2) = (x == y) && (equal fe1 fe2) && (equal fd1 fd2)



isomorphic :: Eq a => Tree a -> Tree a -> Bool
isomorphic Empty Empty = True
isomorphic _ Empty = False
isomorphic Empty _ = False
isomorphic (Node t1 lt1 rt1) (Node t2 lt2 rt2) =
    t1 == t2 &&
    ((isomorphic lt1 lt2) && (isomorphic rt1 rt2) || (isomorphic lt1 rt2) && (isomorphic rt1 lt2))



preOrder :: Tree a -> [a]
preOrder Empty = []
preOrder (Node x fe fd) = [x] ++ (preOrder fe) ++ (preOrder fd)


postOrder :: Tree a -> [a]
postOrder Empty = []
postOrder (Node x fe fd) = (postOrder fe) ++ (postOrder fd) ++ [x]


inOrder :: Tree a -> [a]
inOrder Empty = []
inOrder (Node x fe fd) = (inOrder fe) ++ [x] ++ (inOrder fd)



-- Recorregut d'arbres per nivells, es trata de convertir l'arbre en una cua d'arbres,
breadthFirst :: Tree a -> [a]
breadthFirst t = bf [t]
    where
        bf :: [Tree a] -> [a]
        bf [] = []
        bf (Empty:ts) = bf ts
        bf ((Node x fe fd):ts) = [x] ++ (bf (ts++[fe,fd])) --Aqui lo que tenemos que observar es que estamos convertiendo el arbol binario como si fuera una lista de arboles, en que supones que "ts" esta ordenados mediante niveles en que comenzamos el primer nodo del nivel izquierda y nos vamos en esta direccion ->.



build :: Eq a => [a] -> [a] -> Tree a
build [] [] = Empty
build (x:xs) (y) = Node x (build postOrderL inOrderL) (build postOrderR inOrderR)
    where
        inOrderL = takeWhile (/=x) y
        postOrderL = take (length inOrderL) xs
        
        inOrderR = drop 1 (dropWhile (/=x) y) 
        postOrderR = drop (length inOrderL) xs
        
overlap :: (a -> a -> a) -> Tree a -> Tree a -> Tree a 
overlap _ Empty b = b
overlap _ a Empty = a
overlap f (Node x fe1 fd1) (Node y fe2 fd2) = Node (f x y) (overlap f fe1 fe2) (overlap f fd1 fd2) 






