module Main where

import Graphics.UI.Webview

main :: IO ()
main = do
  w <- createWindow
  setTitle w "Hello, World"
  setSize w 480 320 HintNone
  setHtml w "Welcome to my window"
  runWebView w
  destroyWindow w
