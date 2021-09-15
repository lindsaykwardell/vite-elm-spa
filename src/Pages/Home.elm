module Pages.Home exposing (..)

import Effect exposing (Effect)
import Html exposing (a, button, code, div, h1, img, p, text)
import Html.Attributes exposing (href, src, style)
import Html.Events exposing (onClick)
import Shared exposing (Shared)
import Spa.Page
import Time exposing (Month(..))
import View exposing (View)


page shared =
    Spa.Page.element
        { init = init
        , update = update
        , view = view shared
        , subscriptions = always Sub.none
        }


type Msg
    = Increment


type alias Model =
    {}


init : () -> ( Model, Effect Shared.Msg Msg )
init _ =
    ( {}, Effect.none )


update : Msg -> Model -> ( Model, Effect Shared.Msg Msg )
update msg model =
    case msg of
        Increment ->
            let
                _ =
                    Debug.log "Increment" "Incrementing"
            in
            model
                |> Effect.withShared Shared.Increment


view : Shared -> Model -> View Msg
view shared _ =
    { title = "Home"
    , body =
        div []
            [ img [ src "/logo.png", style "width" "300px" ] []
            , div []
                [ h1 [] [ text "Hello, Vite + Elm!" ]
                , p []
                    [ a [ href "https://vitejs.dev/guide/features.html" ] [ text "Vite Documentation" ]
                    , text " | "
                    , a [ href "https://guide.elm-lang.org/" ] [ text "Elm Documentation" ]
                    , text " | "
                    , a [ href "/about" ] [ text "About" ]
                    ]
                , button [ onClick Increment ] [ text ("count is: " ++ String.fromInt shared.count) ]
                , p []
                    [ text "Edit "
                    , code [] [ text "src/Main.elm" ]
                    , text " to test auto refresh"
                    ]
                ]
            ]
    }
