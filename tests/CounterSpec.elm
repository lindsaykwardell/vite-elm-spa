module CounterSpec exposing (suite)

import Expect
import Pages.Counter as Counter
import Test exposing (Test)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector as Html


suite : Test
suite =
    Test.describe "Counter"
        [ Test.describe "init"
            [ Test.test "initializes to provided value" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Expect.equal { amount = 0, directSetValue = False }
            ]
        , Test.describe "update"
            [ Test.test "increments by one" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.update Counter.Increment
                        |> Tuple.first
                        |> Expect.equal { amount = 1, directSetValue = False }
            , Test.test "decrements by one" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.update Counter.Decrement
                        |> Tuple.first
                        |> Expect.equal { amount = -1, directSetValue = False }
            , Test.test "sets value directly" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.update (Counter.SetValue 5)
                        |> Tuple.first
                        |> Expect.equal { amount = 5, directSetValue = True }
            ]
        , Test.describe "view"
            [ Test.test "returns a view with the counter" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.counterElements
                        |> .body
                        |> Query.fromHtml
                        |> Query.has [ Html.text "Count is: 0" ]
            , Test.test "clicking on the 'Increment' button sends an increment message" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.counterElements
                        |> .body
                        |> Query.fromHtml
                        |> Query.find [ Html.tag "button", Html.containing [ Html.text "Increment" ] ]
                        |> Event.simulate Event.click
                        |> Event.expect Counter.Increment
             , Test.test "clicking on the 'Decrement' button sends a decrement message" <|
                \_ ->
                    Counter.init 0
                        |> Tuple.first
                        |> Counter.counterElements
                        |> .body
                        |> Query.fromHtml
                        |> Query.find [ Html.tag "button", Html.containing [ Html.text "Decrement" ] ]
                        |> Event.simulate Event.click
                        |> Event.expect Counter.Decrement
            ]
        ]
