
atob :: Int -> Int -> Int
atob a b | a == b = 0
atob a b | a < b = b - a
atob a b | a `mod` 2 == 0 =  1 + atob (a `quot` 2) (b)
atob a b = 1 + atob (a + 1) b
main = do
 [a,b] <- fmap (fmap read . words) getLine
 print $ atob a b 
