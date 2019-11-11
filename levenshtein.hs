import Data.List
leven :: [a] -> [a] -> [[a]]
leven alpha [] = fmap (:[]) alpha
leven alpha (h:t) = fmap (:t) alpha ++ fmap (:(h:t)) alpha ++ [t] ++ fmap (h:) (leven alpha t)

main = do
 alpha <- getLine
 str <- getLine
 let ans = filter (/=str) $ map head $ group $ sort $ leven alpha str
 traverse putStrLn ans
