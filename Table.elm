module Table exposing (table, Row, Cell)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


type alias Cell record msg =
    record -> Html msg


type alias Row record msg =
    List (Cell record msg)


table : Row record msg -> List record -> Html msg
table cells records =
    Html.div [ class "table" ] (List.map (tableRow cells) records)


tableRow : Row record msg -> record -> Html msg
tableRow row record =
    Html.div [ class "table-row" ] (List.map (tableCell record) row)


tableCell : record -> Cell record msg -> Html msg
tableCell record cell =
    Html.div [ class "table-cell" ] [ cell record ]


type Msg
    = Msg
