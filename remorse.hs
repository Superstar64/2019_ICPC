import qualified Data.Map.Strict as Map
import Data.Char
import Data.List
import Data.Maybe
type Morse = Map.Map Char Int


fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
odds = map (\x -> x * 2 + 1) [0..]
nth = concat $ zipWith replicate (tail fibs) odds

count :: String -> Morse
count [] = Map.empty
count (h:t) = Map.insertWith (+) h 1 $ count t

applyFibs :: Morse -> Morse
applyFibs m = Map.fromList $ zipWith (\(k,v) n -> (k,n) ) (reverse $ sortOn snd $ Map.toList m) (nth)


main = do
 str <- fmap (filter isUpper .  map toUpper) getLine
 let morse = applyFibs (count str)
 let lengths = map (\c -> fromJust $ Map.lookup c morse) str
 print $ sum lengths + (length str - 1) * 3
