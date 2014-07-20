import System.Environment (getArgs)
import System.IO (readFile)

data Pixel = Pixel {
                    x :: Float,
                    y :: Float,
                    value :: Float
                    } deriving (Show)
data Aperture = Aperture {
                    xAp :: Float,
                    yAp :: Float,
                    radius :: Float
                    } deriving (Show)
                    
type ApertureList = [Aperture]
type Image = [Pixel]
type Flux = Float

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
    "" -> []
    s' -> w : wordsWhen p s''
        where (w, s'') = break p s'

getFileLines :: FilePath -> IO [String]
getFileLines f = do
    text <- readFile f
    return $ wordsWhen (=='\n') text

readImage :: FilePath -> IO Image
readImage f = do
    text <- getFileLines f
    return $ map parseImageLine text

parseImageLine :: String -> Pixel
parseImageLine s = Pixel { x=x, y=y, value=value }
    where [x, y, value] = map read $ words s

performAperturePhotometry :: Image -> ApertureList -> IO ()
performAperturePhotometry image apertures = do
    let fluxes = map (extractFlux image) apertures
    return ()

extractFlux :: Image -> Aperture -> Flux
extractFlux = undefined

readApertures :: FilePath -> IO ApertureList
readApertures f = do
    text <- getFileLines f
    return $ map parseApertureLine text

parseApertureLine :: String -> Aperture
parseApertureLine s = Aperture { xAp = x, yAp = y, radius=radius }
    where [x, y, radius] = map read $ words s

main :: IO ()
main = do
    args <- getArgs
    case args of
        [sourceFilename, apertureList] -> do
            image <- readImage sourceFilename
            apertures <- readApertures apertureList
            performAperturePhotometry image apertures
        _ -> error "Program usage: hAppPhotom <image> <aperturelist>"
