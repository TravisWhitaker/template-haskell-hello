{-# LANGUAGE TemplateHaskell #-}

module Main where

import GenMain

main :: IO ()
main = $genMain
