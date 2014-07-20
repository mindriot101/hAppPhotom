import System.Environment

sourceFilename :: IO String
sourceFilename = do
    args <- getArgs
    return $ head args

main :: IO ()
main = do
    fname <- sourceFilename
    return ()
