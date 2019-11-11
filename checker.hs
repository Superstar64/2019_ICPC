
checker :: ([Int],[Int]) -> Int -> Int -> Bool
checker ((height:t),(width:t')) y x | y < height && x < width = True
checker ((height:t),(width:t')) y x | y >= height && x < width = not $ checker (t, (width:t')) (y - height) x
checker ((height:t),(width:t')) y x | y < height && x >= width = not $ checker ((height:t), t') y (x - width)
checker ((height:t),(width:t')) y x | y >= height && x >= width = checker (t,t') (y - height) (x - width)

toChar :: Bool -> Char
toChar True = 'B'
toChar False = 'W'

printer :: (Int -> Int -> Bool) -> Int -> Int -> [String]
printer f height width = map (\y -> map (\x -> toChar $ f y x) [0.. width - 1] ) [0 .. height- 1]

readInt :: String -> Int
readInt = read

main = do
 [r,c,v,h] <- fmap (fmap readInt . words) getLine
 a <- sequence $ replicate v (fmap readInt getLine)
 b <- sequence $ replicate h (fmap readInt getLine)
 traverse putStrLn $ printer (checker (a,b) ) r c
