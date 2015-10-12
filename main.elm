import StartApp.Simple as StartApp
import Html exposing (Html, div, button, text, img)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import Maybe


main =
  StartApp.start { model = model, view = view, update = update }

model = 0


pageImages : List Html
pageImages = List.map (\x -> img [src ("p-" ++ (toString x) ++ ".jpg")] []) [0..12]

pageCount = List.length pageImages


view address model =
  div []
    [ 
      button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    , text (toString model)
    , div [] [
        Maybe.withDefault (text "hello") (List.head <| List.drop model pageImages)
      ]
    ]


type Action = Increment | Decrement


update action model =
  case action of
    Increment -> min (pageCount - 1) (model + 1)
    Decrement -> max 0 (model - 1)
