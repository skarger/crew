module Main exposing (..)

import Html exposing (h2, ul, li, text, div)
import Html.Attributes exposing (style)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Svg.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type Msg
    = ShowEducationSection
    | ShowServiceProjectsSection
    | ShowPlanningSection


type alias Model =
    { selectedSection : Html.Html Msg
    }


model : Model
model =
    { selectedSection = div [] [] }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowEducationSection ->
            { model | selectedSection = educationSection }

        ShowServiceProjectsSection ->
            { model | selectedSection = serviceProjectsSection }

        ShowPlanningSection ->
            { model | selectedSection = planningSection }


view : Model -> Html.Html Msg
view model =
    div [ Html.Attributes.style [ ( "margin", "0%" ) ] ]
        [ div
            [ Html.Attributes.style [ ( "border-style", "double" ), ( "height", "100%" ), ( "width", "100%" ) ]
            ]
            [ whatWeDoAnimation model
            ]
        ]


whatWeDoAnimation : Model -> Html.Html Msg
whatWeDoAnimation model =
    svg
        [ width "100%"
        , height "100%"
        , viewBox "0 0 2078 4000"
        ]
        [ largeScreen
        , mediumScreen
        , smallScreen

        --educationSectionBorder
        , educationSectionContainer
        , educationSectionCover
        , sections
        , logoRockets
        ]


svgDefs : Svg Msg
svgDefs =
    defs [] [ largeScreen, mediumScreen, smallScreen ]


largeScreen : Svg Msg
largeScreen =
    Svg.style []
        [ Svg.text "@media (max-width: 1200px) { .large {display: none;}}"
        ]


mediumScreen : Svg Msg
mediumScreen =
    Svg.style []
        [ Svg.text
            ("@media (max-width: 600px) { .medium {display: none;}}"
                ++ ", @media (min-width: 1201px) { .medium {display: none;}}"
            )
        ]


smallScreen : Svg Msg
smallScreen =
    Svg.style []
        [ Svg.text "@media (min-width: 601px) { .small {display: none;}}"
        ]


logoRockets : Svg Msg
logoRockets =
    g [ id "rockets" ] [ planningRocket, serviceRocket, educationRocket ]


sections : Svg Msg
sections =
    g [ id "sections" ] [ planningHeader, serviceHeader, educationHeader ]


sectionHeader : String -> String -> List (Svg Msg) -> Svg Msg
sectionHeader sectionId color animations =
    g [ id sectionId, class "large" ]
        (animations
            ++ [ g [ transform "translate(-2078 0)" ]
                    [ polygon
                        [ points "100 495, 100 855, 1978 855, 1978 495"
                        , fill color
                        ]
                        []
                    ]
               ]
        )


educationSectionCover : Svg Msg
educationSectionCover =
    g []
        [ rect
            [ x "99"
            , y "-145"
            , width "1880"
            , height "1001"
            , stroke "transparent"
            , fill "white"
            ]
            []
        ]


educationSectionBorder : Svg Msg
educationSectionBorder =
    g []
        [ educationBorderAnimation
        , rect
            [ x "100"
            , y "-145"
            , width "1878"
            , height "1200"
            , stroke lightOrange
            , fill "transparent"
            ]
            []
        ]


educationBorderAnimation : Svg Msg
educationBorderAnimation =
    animateTransform
        [ attributeName "transform"
        , type_ "translate"
        , from "0 0"
        , to "0 855"
        , dur "1s"
        , repeatCount "1"
        , begin "3s"
        , fill "freeze"
        ]
        []


educationHeader : Svg Msg
educationHeader =
    sectionHeader "education" darkOrange educationAnimations


serviceHeader : Svg Msg
serviceHeader =
    sectionHeader "service" darkBlue serviceAnimations


planningHeader : Svg Msg
planningHeader =
    sectionHeader "planning" darkGreen planningAnimations


headerAnimation : String -> String -> String -> String -> Svg Msg
headerAnimation from_ to_ dur_ begin_ =
    animateTransform
        [ attributeName "transform"
        , type_ "translate"
        , from from_
        , to to_
        , dur dur_
        , repeatCount "1"
        , begin begin_
        , fill "freeze"
        ]
        []


planningAnimations : List (Svg Msg)
planningAnimations =
    [ headerAnimation "-2078 0" "-2078 0" "0.5" "0s"
    , headerAnimation "-2078 0" "2078 0" "1s" "0.5s"
    , headerAnimation "2078 0" "2078 400" "0.5s" "1.5s"
    , headerAnimation "2078 400" "2078 800" "0.5s" "2.5s"
    , headerAnimation "2078 800" "2078 2000" "1s" "3s"
    ]


serviceAnimations : List (Svg Msg)
serviceAnimations =
    [ headerAnimation "-2078 0" "-2078 0" "1.5" "0s"
    , headerAnimation "-2078 0" "2078 0" "1s" "1.5s"
    , headerAnimation "2078 0" "2078 400" "0.5s" "2.5s"
    , headerAnimation "2078 400" "2078 1600" "1s" "3s"
    ]


educationAnimations : List (Svg Msg)
educationAnimations =
    [ headerAnimation "-2078 0" "-2078 0" "2.5" "0s"
    , headerAnimation "-2078 0" "2078 0" "1s" "2.5s"
    ]


planningRocket : Svg Msg
planningRocket =
    g [ id "educationRocket" ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "-1412 0"
            , dur "0.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "2744 0"
            , dur "1s"
            , repeatCount "1"
            , begin "0.5s"
            , fill "freeze"
            ]
            []
        , g [ transform "translate(-666 0) rotate(-30 666 674)" ]
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
        ]


serviceRocket : Svg Msg
serviceRocket =
    g [ id "serviceRocket" ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "-1412 0"
            , dur "1.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "2744 0"
            , dur "1s"
            , repeatCount "1"
            , begin "1.5s"
            , fill "freeze"
            ]
            []
        , g [ transform "translate(-666 0) rotate(-30 666 674)" ]
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
        ]


educationRocket : Svg Msg
educationRocket =
    g [ id "planningRocket" ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "-1412 0"
            , dur "2.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1412 0"
            , to "2744 0"
            , dur "1s"
            , repeatCount "1"
            , begin "2.5s"
            , fill "freeze"
            ]
            []
        , g [ transform "translate(-666 0) rotate(-30 666 674)" ]
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
        ]


educationSectionContainer : Svg Msg
educationSectionContainer =
    g
        [ id "section-content"
        ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "0 0"
            , to "0 855"
            , dur "1s"
            , repeatCount "1"
            , begin "3s"
            , fill "freeze"
            ]
            []
        , foreignObject [ x "100", y "0", width "1878", height "855" ] [ educationSection ]
        ]


educationSection : Html.Html msg
educationSection =
    div [ Html.Attributes.style [ ( "border", "2px solid " ++ lightOrange ) ] ]
        [ ul
            [ Html.Attributes.class "what-we-do-list"
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


serviceProjectsSection : Html.Html msg
serviceProjectsSection =
    div []
        [ h2
            []
            [ Html.span
                [ Html.Attributes.style
                    [ ( "color", darkBlue )
                    , ( "font-size", "48px" )
                    ]
                ]
                [ Html.text "Service Projects" ]
            , Html.span
                [ Html.Attributes.style
                    [ ( "font-size", "48px" )
                    , ( "font-weight", "normal" )
                    ]
                ]
                [ Html.text " that:" ]
            ]
        , ul
            [ Html.Attributes.style [ ( "font-size", "48px" ) ]
            ]
            [ li []
                [ Html.text "Build local resilience, especially for individuals and communities particularly vulnerable to climate change"
                ]
            , li []
                [ Html.text
                    "Collaborate with emergency management agencies and other local partners to respond before, during, and after extreme weather events"
                ]
            ]
        ]


planningSection : Html.Html msg
planningSection =
    div []
        [ h2
            []
            [ Html.span
                [ Html.Attributes.style
                    [ ( "color", darkGreen )
                    , ( "font-size", "48px" )
                    ]
                ]
                [ Html.text "Planning policies and programs" ]
            , Html.span
                [ Html.Attributes.style
                    [ ( "font-size", "48px" )
                    , ( "font-weight", "normal" )
                    ]
                ]
                [ Html.text " that:" ]
            ]
        , ul
            [ Html.Attributes.style [ ( "font-size", "48px" ) ]
            ]
            [ li []
                [ Html.text "Build long-term climate resilience at the municipal and state levels"
                ]
            , li []
                [ Html.text
                    "Strengthen the health and equity of our communities"
                ]
            , li []
                [ Html.text
                    "Advance constructive solutions to help society achieve a just transition to a clean energy economy"
                ]
            ]
        ]


orangeThird : Svg Msg
orangeThird =
    g
        [ id "orange", onClick ShowEducationSection ]
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


blueThird : Svg Msg
blueThird =
    g
        [ id "blue", transform "scale(-1, 1) translate(-1380)", onClick ShowServiceProjectsSection ]
        [ polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill lightBlue
            ]
            []
        , polygon
            [ points "510 0, 666 0, 666 674, 96 346, 190 186, 510 366"
            , fill darkBlue
            , transform "scale(1, -1) translate(0, -1348) rotate(-60 666 674)"
            ]
            []
        ]


greenThird : Svg Msg
greenThird =
    g
        [ id "green", transform "translate(24 48) rotate(-120 666 674)", onClick ShowPlanningSection ]
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
