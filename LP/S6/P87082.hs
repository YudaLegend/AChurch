main = do
    line <- getLine
    if line /= "*" then do
        let w = words line
        let name = w !! 0
        let weight = read (w !! 1) :: Float
        let height = read (w !! 2) :: Float
        let bmi = weight / (height * height)

        if bmi < 18 then putStrLn $ name ++ ": underweight"
        else if bmi < 25 then putStrLn $ name ++ ": normal weight"
        else if bmi < 30 then putStrLn $ name ++ ": overweight"
        else if bmi < 40 then putStrLn $ name ++ ": obese"
        else putStrLn $ name ++ ": severely obese"
        main
    else
        return()
