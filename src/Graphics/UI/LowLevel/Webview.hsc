
module Graphics.UI.LowLevel.Webview where

#include "webview.h"

import Foreign
import Foreign.C.String
import Foreign.C.Types

type WebView = Ptr ()
type Window = Ptr

type WindowHint = CInt

hintNone, hintMin, hintMax, hintFixed :: WindowHint
hintNone  = #const WEBVIEW_HINT_NONE
hintMin   = #const WEBVIEW_HINT_MIN
hintMax   = #const WEBVIEW_HINT_MAX
hintFixed = #const WEBVIEW_HINT_FIXED

foreign import ccall "webview_create" create :: CInt -> Window a -> IO WebView
foreign import ccall "webview_destroy" destroy :: WebView -> IO ()
foreign import ccall "webview_run" run :: WebView -> IO ()
foreign import ccall "webview_terminate" terminate :: WebView -> IO ()
foreign import ccall "webview_dispatch" dispatch :: WebView -> FunPtr (WebView -> CString -> IO ()) -> IO ()
foreign import ccall "webview_get_window" getWindow :: WebView -> IO (Ptr ())
foreign import ccall "webview_set_title" setTitle :: WebView -> CString -> IO () 
foreign import ccall "webview_set_size" setSize :: WebView -> CInt -> CInt -> WindowHint -> IO () 
foreign import ccall "webview_navigate" navigate :: WebView -> CString -> IO () 
foreign import ccall "webview_set_html" setHtml :: WebView -> CString -> IO () 
foreign import ccall "webview_init" init :: WebView -> CString -> IO () 
foreign import ccall "webview_eval" eval :: WebView -> CString -> IO () 
foreign import ccall "webview_unbind" unbind :: WebView -> CString -> IO () 
foreign import ccall "webview_return" return :: WebView -> CString -> CInt -> CString -> IO () 

foreign import ccall "wrapper" createCallback :: (WebView -> CString -> IO ()) -> IO (FunPtr (WebView -> CString -> IO ()))
