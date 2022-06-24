module Pages.Home exposing (page)

import Html exposing (a, code, div, h1, img, p, text)
import Html.Attributes exposing (href, src, style)
import Shared exposing (Shared)
import Spa.Page
import View exposing (View)


page : Shared -> Spa.Page.Page () Shared.Msg (View ()) () ()
page shared =
    Spa.Page.static (view shared)


view : Shared -> View ()
view shared =
    { title = "Home"
    , body =
        div []
            [ img [ src "/logo.png", style "width" "300px" ] []
            , h1 [] [ text "Hello, Vite + Elm + SPA!" ]
            , p []
                [ case Shared.identity shared of
                    Just identity ->
                        text <| "Welcome Home " ++ identity ++ "!"

                    Nothing ->
                        text "Welcome Home!"
                ]
            , div [ style "display" "flex", style "justify-content" "space-between" ]
                [ div [] [ a [ href "/counter" ] [ text "See counter" ] ]
                , div [] [ a [ href "/time" ] [ text "See time" ] ]
                , div [] [ a [ href "/about" ] [ text "About vite-elm-spa" ] ]
                ]
            , p []
                [ a [ href "https://vitejs.dev/guide/features.html" ] [ text "Vite Documentation" ]
                , text " | "
                , a [ href "https://guide.elm-lang.org/" ] [ text "Elm Documentation" ]
                ]
            , p []
                [ text "Edit "
                , code [] [ text "src/Main.elm" ]
                , text " to test auto refresh"
                ]
            ]
    }
