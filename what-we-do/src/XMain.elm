module Main exposing (..)

import Html exposing (Html, h2, ul, li, text, div)
import Html.Attributes exposing (style)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    view


view : Html msg
view =
    div []
        [ div [ Html.Attributes.class "section-container" ]
            [ div [ Html.Attributes.class "header-container" ]
                [ sectionHeader
                , educationList
                ]
            , div [ Html.Attributes.class "svg-container", Html.Attributes.id "sun" ]
                [ rocket ]
            ]
        , div [ Html.Attributes.class "section-container" ]
            [ div [ Html.Attributes.class "header-container" ]
                [ planningHeader
                ]

            --, div [ Html.Attributes.class "svg-container", Html.Attributes.id "sun" ]
            --    [ rocket ]
            ]
        ]


rocket : Html msg
rocket =
    svg
        [ viewBox "0 -674 666 674"
        , Svg.Attributes.class "svg"
        ]
        [ --svgDefs
          educationRocket
        ]


educationRocket : Svg msg
educationRocket =
    g
        [ Svg.Attributes.transform "scale(1, -1)" ]
        [ polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill lightOrange
            , transform "rotate(-30 666 674)"
            ]
            []
        ]


educationList : Html msg
educationList =
    div [ Html.Attributes.class "list" ]
        [ ul []
            [ li [] [ Html.text "Lorem ipsum" ]
            , li [] [ Html.text "Lorem ipsum" ]
            , li [] [ Html.text "Lorem ipsum" ]
            ]
        ]


sectionHeader : Html msg
sectionHeader =
    div [ Html.Attributes.class "header", Html.Attributes.style [ ( "background-color", darkOrange ) ] ] []


planningHeader : Html msg
planningHeader =
    div [ Html.Attributes.class "planning-header", Html.Attributes.style [ ( "background-color", darkBlue ) ] ] []


xsectionHeader : String -> String -> List (Svg msg) -> Svg msg
xsectionHeader sectionId color animations =
    g [ id sectionId, class "large" ]
        (animations
            ++ [ g [ transform "translate(0 -674)" ]
                    [ polygon
                        [ points "0 0, 0 180, 2078 180, 2078 0"
                        , fill color
                        , opacity "0.70"
                        ]
                        []
                    , text_ [ x "1000", y "100", Svg.Attributes.style "font-size: 84; fill: #fff" ] [ Svg.text "Education" ]
                    ]
               ]
        )


darkOrange : String
darkOrange =
    "#e36a3c"


lightOrange : String
lightOrange =
    "#f69f00"


darkBlue : String
darkBlue =
    "#2F87C3"


lightBlue : String
lightBlue =
    "#63C8F0"


darkGreen : String
darkGreen =
    "#147F39"


lightGreen : String
lightGreen =
    "#4AAB3B"
