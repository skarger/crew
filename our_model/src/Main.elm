module Main exposing (..)

import Html exposing (h2, ul, li, text)
import Html.Attributes
import Svg exposing (..)
import Svg.Attributes exposing (..)


main : Html.Html msg
main =
    ourModelDiagram


darkOrange : String
darkOrange =
    "#e36a3c"


lightOrange : String
lightOrange =
    "#f69f00"


darkBlue : String
darkBlue =
    "#63C8F0"


lightBlue : String
lightBlue =
    "#2F87C3"


darkGreen : String
darkGreen =
    "#147F39"


lightGreen : String
lightGreen =
    "#4AAB3B"


ourModelDiagram : Html.Html msg
ourModelDiagram =
    svg
        [ width "2760", height "2740", viewBox "-100 -100 8048 8020" ]
        [ crewLogo, sectionContainer ]


crewLogo : Svg msg
crewLogo =
    g [ id "logo" ] [ orangeThird, blueThird, greenThird ]


sectionContainer : Svg msg
sectionContainer =
    g [ id "section-content", transform "translate(1500, 400)", width "2760", height "2740" ] [ educationSection ]


educationSection : Svg msg
educationSection =
    foreignObject [ width "100%", height "100%" ]
        [ h2 [ Html.Attributes.style [ ( "color", darkOrange ), ( "font-size", "48px" ) ] ] [ Html.text "Education about:" ]
        , ul
            [ Html.Attributes.style [ ( "font-size", "48px" ) ]
            ]
            [ li []
                [ Html.text "How residences, businesses, and communities can prepare for projected local climate impacts"
                ]
            , li []
                [ Html.text
                    "The links between existing social inequalities and vulnerability to climate change"
                ]
            , li []
                [ Html.text
                    "Connections between climate pollution, extreme weather events, and larger patterns of climate change"
                ]
            ]
        ]


orangeThird : Svg msg
orangeThird =
    g
        [ id "orange" ]
        [ polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill darkOrange
            ]
            []
        , polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill lightOrange
            , transform "scale(1, -1) translate(0, -1348) rotate(-60 666 674)"
            ]
            []
        ]


blueThird : Svg msg
blueThird =
    g
        [ id "blue", transform "scale(-1, 1) translate(-1380)" ]
        [ polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill darkBlue
            ]
            []
        , polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill lightBlue
            , transform "scale(1, -1) translate(0, -1348) rotate(-60 666 674)"
            ]
            []
        ]


greenThird : Svg msg
greenThird =
    g
        [ id "green", transform "translate(24 48) rotate(-120 666 674)" ]
        [ polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill darkGreen
            ]
            []
        , polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill lightGreen
            , transform "scale(1, -1) translate(0, -1348) rotate(-60 666 674)"
            ]
            []
        ]
