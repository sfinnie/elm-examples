module Main exposing (..)
import Html
import Color
-- Use Style-elements to layout & style instead of default Html lib
-- Still need to import Html because Element.layout generates Html.
import Element.Events exposing (onClick)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition

main : Program Never number Msg
main =
  Html.beginnerProgram { model = 0, view = view, update = update }

type Msg = Increment | Decrement

update : Msg -> number -> number
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view : a -> Html.Html Msg
view model =
  Element.layout stylesheet <|
    column None
      []
      [ el Label [] (text "Welcome to Countr!")
      , button None [ center, onClick Increment ] (text "+")
      , el None [ center ] (text (toString model))
      , button None [ center, onClick Decrement ] (text "-")
      ]
    


  -- div []
  --   [ button [ onClick Decrement ] [ text "-" ]
  --   , div [] [ text (toString model) ]
  --   , button [ onClick Increment ] [ text "+" ]
  --   ]

{-| Create a stylesheet.
Styles only deal with properties that are not related to layout, position, or size.
Generally all properties only have one allowed unit, which is usually px.
If you want to use something like em, you should check out the `Style.Scale` module, which will show how to make something similar to `em`.
-}

type Styles
    = None
    | Main
    | Page
    | Logo
    | NavOption
    | Box
    | Container
    | Label

sansSerif: List Font
sansSerif =
    [ Font.font "helvetica"
    , Font.font "arial"
    , Font.font "sans-serif"
    ]

stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None [] -- It's handy to have a blank style
        , style Main
            [ Border.all 1 -- set all border widths to 1 px.
            , Color.text Color.darkCharcoal
            , Color.background Color.white
            , Color.border Color.lightGrey
            , Font.typeface sansSerif
            , Font.size 16
            , Font.lineHeight 1.3 -- line height, given as a ratio of current font size.
            ]
        , style Page
            [ Border.all 5
            , Border.solid
            , Color.text Color.darkCharcoal
            , Color.background Color.white
            , Color.border Color.lightGrey
            ]
        , style Label
            [ Font.size 25 -- set font size to 25 px
            , Font.center
            ]
        , style Logo
            [ Font.size 25
            , Font.typeface sansSerif
            ]
        , style NavOption
            [ Font.size 16
            , Font.typeface sansSerif
            ]
        , style Box
            [ Transition.all
            , Color.text Color.white
            , Color.background Color.blue
            , Color.border Color.blue
            , Border.rounded 3 -- round all borders to 3px
            , hover
                [ Color.text Color.white
                , Color.background Color.red
                , Color.border Color.red
                , cursor "pointer"
                ]
            ]
        , style Container
            [ Color.text Color.black
            , Color.background Color.lightGrey
            , Color.border Color.lightGrey
            ]
        ]
