module Shared exposing (..)

import Browser.Navigation as Nav


type alias Shared =
    { key : Nav.Key
    , count : Int
    }


type Msg
    = Increment


init : () -> Nav.Key -> ( Shared, Cmd Msg )
init _ key =
    ( { key = key
      , count = 0
      }
    , Cmd.none
    )


update : Msg -> Shared -> ( Shared, Cmd Msg )
update msg shared =
    case msg of
        Increment ->
            ( { shared | count = shared.count + 1 }, Cmd.none )


subscriptions : Shared -> Sub Msg
subscriptions =
    always Sub.none
