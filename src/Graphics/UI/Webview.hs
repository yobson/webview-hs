module Graphics.UI.Webview 
( WebView
, WindowHint(..)
, createWindow
, destroyWindow
, runWebView
, setTitle
, setSize
, setHtml
) where

import Foreign.Ptr
import Foreign.C.Types
import Foreign.C.String
import Graphics.UI.LowLevel.Webview (WebView)
import qualified Graphics.UI.LowLevel.Webview as WV

data WindowHint = HintNone
                | HintMin
                | HintMax
                | HintFixed
                deriving (Show,Eq,Enum)


hint2C :: WindowHint -> CInt
hint2C HintNone  = WV.hintNone
hint2C HintMin   = WV.hintMin
hint2C HintMax   = WV.hintMax
hint2C HintFixed = WV.hintFixed

createWindow :: IO WebView
createWindow = WV.create 0 nullPtr

destroyWindow :: WebView -> IO ()
destroyWindow = WV.destroy

runWebView :: WebView -> IO ()
runWebView = WV.run

setTitle :: WebView -> String -> IO ()
setTitle wv title = withCString title $ WV.setTitle wv

setSize :: WebView -> Int -> Int -> WindowHint -> IO ()
setSize wv width height hint = 
  WV.setSize wv (fromIntegral width) (fromIntegral height) (hint2C hint)

setHtml :: WebView -> String -> IO ()
setHtml wv html = withCString html $ WV.setHtml wv
