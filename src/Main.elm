module Main exposing (..)

import Browser exposing (Document)
import Pages.Home as Home
import Pages.About as About
import Route
import Shared exposing (Shared)
import Spa
import View exposing (View)


mappers =
    ( View.map, View.map )


toDocument : Shared -> View msg -> Document msg
toDocument _ view =
    { title = view.title
    , body =
        [ view.body
        ]
    }


main =
    Spa.init
        { init = Shared.init
        , subscriptions = Shared.subscriptions
        , update = Shared.update
        , defaultView = View.defaultView
        , toRoute = Route.toRoute
        , extractIdentity = (\_ -> Nothing)
        , protectPage = Route.toUrl -- >> Just >> Route.SignIn >> Route.toUrl
        }
        |> Spa.addPublicPage mappers Route.matchHome Home.page
        |> Spa.addPublicPage mappers Route.matchAbout About.page
        |> Spa.application { toDocument = toDocument }
        |> Browser.application