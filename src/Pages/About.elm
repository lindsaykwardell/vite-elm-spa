module Pages.About exposing (..)

import Shared exposing (Shared)
import Spa.Page
import View exposing (View)
import Html exposing (div)
import Html exposing (text)


page shared =
    Spa.Page.static (view shared)


view : Shared -> View ()
view _ =
    { title = "Home"
    , body =
        div []
        [ text "This is the about page"
        ]
    }