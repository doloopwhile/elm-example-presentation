module Demo where

import StartApp.Simple as StartApp
import Html exposing (Html, div, button, text, img, h1, p, iframe, pre, a)
import Html.Attributes exposing (src, class, width, height, style, href)
import Html.Events exposing (onClick)
import Maybe


main =
  StartApp.start { model = model, view = view, update = update }

model = 0

embdPage url = iframe [src url, width 600, height 500] []

pages = [
    (img [(src "p-0.jpg")] [])
  , div [] [
      h1 [] [text "AngularJSは難しい！"]
    , p [] [text "3種類の言語(JS/HTML/CSS)"]
    , p [] [text "CRUDアプリに特化している！"]
    , p [] [text "ngXXXが多すぎる！"]
    , p [] [text "時代は関数型・静的型付け！"]
    ]
  , div [] [
      h1 [] [text "そこでElm！"]
    , p [] [text "AltJSの一種"]
    , p [] [text "1ソースからJS/HTML/CSSを生成"]
    , p [] [text "FRP(Functional Reactive Programing)！"]
    , p [] [text "Haskellベースの関数型言語"]
    , p [class "text-danger"] [text "まだVer.0.x"]
    ]
  , div [] [
      h1 [] [text "表示を直接操作できる独自ライブラリ"]
    , p [] [
        a [href "http://postd.cc/css-is-unnecessary/"] [text "c.f. 抽象化と組み合わせができるレイアウト言語があれば、CSSは必要ない"]
      ]
    ]
  , div [] [
      h1 [] [text "現実主義的なelm-html"]
    , p [class "text-danger"] [text "Blazing fastらしい"]
    , pre [] [text <|
           "div [] [\n"
        ++ "  h1 [] [text \"AngularJSは難しい！\"]\n"
        ++ "  , p [] [text \"3種類の言語(JS/HTML/CSS)\"]\n"
        ++ "  , p [] [text \"CRUDアプリに特化している！\"]\n"
        ++ "  , p [] [text \"ngXXXが多すぎる！\"]\n"
        ++ "  , p [] [text \"時代は関数型・静的型付け！\"]\n"
        ++ "  ]\n"
      ]
    ]
  , div [] [
      h1 [] [text "FRP"]
    , p [class "text-primary"] [text "ngXXXの一般化"]
    , pre [] [text <|
        "main =\n"
          ++ "  renderScene\n"
          ++ "  <~imageAPIResp\n"
          ++ "  ~ Mouse.position\n"
          ++ "  ~ Window.width\n"
          ++ "  ~ pagingAPIResp\n"
          ++ "  ~ (fps 30)"
        ]
    , p [class ""] [text "更新ロジック不要・コールバック地獄にオサラバ"]
    ]

  , div [ style [("font-size", "64px")] ] [
        img [src "elm-logo.png", height 100] []
      , text "　V.S.　"
      , img [src "angularjs-logo.png", height 100] []
      ]
  , div [ style [("font-size", "64px")] ] [
        img [src "elm-logo.png", height 100] []
      , text "　〜　"
      , img [src "haskell-logo.png", height 100] []
      ]
  , img [src "neck-pinch.jpg", width 400] []
  , div [] [
      h1 [class "text-danger"] [text "まだ Ver.0.x"]
    , img [src "elm-advent-calendar-2014.png", width 400] []
    ]
  , div [] [
      h1 [class "text-danger"] [text "Elmはやさしい"]
    , p [] [text "インタラクティブシェルが充実"]
    , p [] [text "目に見える物を作れる"]
    , p [] [text "改良された文法（モナドもない）"]
    , p [] [text ""]
    , p [class "text-primary"] [text "関数型言語・FRPなどの入門に最適？"]
    ]
  , div [] [
      img [src "spock.jpg", height 300] []
    , h1 [class "text-danger"] [text "皆さまの長寿と繁栄を"]
    ]
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
