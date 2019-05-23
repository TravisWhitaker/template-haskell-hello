{-# LANGUAGE TemplateHaskell #-}

module GenMain where

import Language.Haskell.TH.Syntax

genMain :: Q Exp
genMain = do
    runIO (putStrLn "Hello from template haskell!")
    n <- newName "x"
    runIO $ do putStr "We just made the name "
               print n
    l <- location
    runIO $ do putStr "We're at "
               print l
    [| putStrLn "TemplateHaskell was here." |]
