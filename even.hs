
both :: Int -> Int
both n | n `mod` 2 == 1 = 0
both n | otherwise = if sum `mod` 2 == 0 then 2 else 1 where
 sum = n * (n + 1) `quot` 2

main = do
 n <- fmap read getLine
 print (both n)
