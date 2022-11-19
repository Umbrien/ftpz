round2 :: RealFrac a => a -> a
round2 num = (fromIntegral . round $ num * f) / f
  where f = 100 -- 10^2

volumeCoefficient :: Int -> Float
volumeCoefficient v
    | v <= 50   = 0.6
    | v <= 70   = 1
    | v <= 100  = 1.1
    | v <= 120  = 1.2
    | v <= 150  = 1.4
    | otherwise = 1.6

ageCoefficient :: Int -> Int -> Float
ageCoefficient a e
    | a <= 22 && e <= 3 = 1.8
    | a <= 22           = 1.6
    | e <= 3            = 1.7
    | otherwise         = 1

tarif :: Int -> Int -> Int -> Float
tarif v a e = round2 $ base * volume * age
  where base = 227.37
        volume = volumeCoefficient v
        age = ageCoefficient a e

main :: IO ()
main = do
    putStrLn "Engine volume: "
    volume <- getLine
    putStrLn "Driver's age: "
    age <- getLine
    putStrLn "Driver's exprerience: "
    experience <- getLine
    let volumeI = read volume :: Int
    let price = tarif volumeI (read age) (read experience)
    print price

