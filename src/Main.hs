import System.Environment (getArgs)
import System.IO (readFile)

data Pixel = Pixel {
                    x :: Float,
                    y :: Float,
                    value :: Float
                    } deriving (Show)
type Image = [Pixel]

sourceFilename :: IO String
sourceFilename = do
    args <- getArgs
    return $ head args

main :: IO ()
main = do
    fname <- sourceFilename
    return ()
