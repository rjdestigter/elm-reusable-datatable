module Main exposing (..)

import Html exposing (Html, div, text)
import Table exposing (table, Cell, Row)


type Msg
    = Msg


type alias Fruit =
    { id : Int
    , name : String
    , colour : String
    , available : Bool
    }


idCell : Fruit -> Html Msg
idCell fruit =
    Html.div [] [ text (toString fruit.id) ]


nameCell : Fruit -> Html Msg
nameCell fruit =
    Html.div [] [ text fruit.name ]


colourCell : Fruit -> Html Msg
colourCell fruit =
    Html.div [] [ text fruit.colour ]


availableCell : Cell Fruit Msg
availableCell fruit =
    Html.div []
        [ text
            (if fruit.available then
                "Yes"
             else
                " No"
            )
        ]


fruitRow : Row Fruit Msg
fruitRow =
    [ idCell
    , nameCell
    , colourCell
    , availableCell
    ]


fruits : List Fruit
fruits =
    [ Fruit 1 "Apple" "Red" True
    , Fruit 2 "Banana" "Yellow" False
    , Fruit 3 "Orange" "Orange" True
    ]


main : Html Msg
main =
    table fruitRow fruits
