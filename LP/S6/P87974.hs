main::IO()
main = do
    name <- getLine
    let y = take 1 name
    if ( y == "A" || y == "a") then do 
        putStrLn "Hello!"
    else putStrLn "Bye!"
                  
