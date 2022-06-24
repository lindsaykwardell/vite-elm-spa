module Pages.About exposing (page)

import Html exposing (a, div, text)
import Html.Attributes exposing (href)
import Shared exposing (Shared)
import Spa.Page
import View exposing (View)


page : Shared -> Spa.Page.Page () Shared.Msg (View ()) () ()
page shared =
    Spa.Page.static (view shared)


view : Shared -> View ()
view _ =
    { title = "Home"
    , body =
        div []
            [ text "This is the about page"
            , div [] [ a [ href "/" ] [ text "Go Home" ] ]
            ]
    }
