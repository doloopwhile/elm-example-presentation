module Demo where

import StartApp.Simple as StartApp
import Html exposing (Html, div, button, text, img)
import Html.Attributes exposing (src, class)
import Html.Events exposing (onClick)
import Maybe


main =
  StartApp.start { model = model, view = view, update = update }

model = 0

pages = [
  img [src ("p-0.jpg")
, img [src ("p-1.jpg")
, img [src ("p-2.jpg")
, img [src ("p-3.jpg")
, img [src ("p-4.jpg")
, img [src ("p-5.jpg")
, img [src ("p-6.jpg")
, img [src ("p-7.jpg")
, img [src ("p-8.jpg")
, img [src ("p-9.jpg")
, img [src ("p-10.jpg")
, img [src ("p-11.jpg")
, img [src ("p-12.jpg")
]

pageCount = List.length pages

view address model =
  div []
    [ 
      button [ onClick address Decrement, class "btn btn-danger"] [ text "Prev" ]
    , button [ onClick address Increment, class "btn btn-primary"] [ text "Next" ]
    , text (toString model)
    , div [] [
        Maybe.withDefault (text "end") (List.head <| List.drop model pages)
      ]
    ]


type Action = Increment | Decrement


update action model =
  case action of
    Increment -> min (pageCount - 1) (model + 1)
    Decrement -> max 0 (model - 1)
