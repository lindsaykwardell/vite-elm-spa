module Route exposing (..)

import Url exposing (Url)
import Url.Parser exposing (..)


type Route
    = Home
    | About
    | NotFound Url


route : Parser (Route -> a) a
route =
    oneOf
        [ map Home top
        , map About <| s "about"
        ]


toRoute : Url -> Route
toRoute url =
    url
        |> parse route
        |> Maybe.withDefault (NotFound url)


toUrl : Route -> String
toUrl r =
    case r of
        Home ->
            "/"

        About ->
            "/about"

        NotFound url ->
            Url.toString url


matchAny : Route -> Route -> Maybe ()
matchAny any r =
    if any == r then
        Just ()

    else
        Nothing


matchHome : Route -> Maybe ()
matchHome =
    matchAny Home

matchAbout : Route -> Maybe ()
matchAbout =
    matchAny About