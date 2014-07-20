import System.Environment

main :: IO ()
main = getArgs >>= print . happphotom . head

happphotom s = "Photometry " ++ s
