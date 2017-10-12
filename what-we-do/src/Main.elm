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
    model


view : Model -> Html.Html Msg
view model =
    div
        [ Html.Attributes.style [ ( "height", "100%" ), ( "width", "100%" ) ]
        ]
        [ whatWeDoAnimation model
        ]


whatWeDoAnimation : Model -> Html.Html Msg
whatWeDoAnimation model =
    svg
        [ width "100%"
        , height "100%"
        , viewBox "0 0 2078 3510"
        ]
        [ svgDefs
        , planningSectionContainer
        , planningSectionCover
        , serviceSectionContainer
        , serviceSectionCover
        , educationSectionContainer
        , educationSectionCover
        , sections
        , logoRockets
        ]


svgDefs : Svg Msg
svgDefs =
    defs [] [ allScreens, largeScreen, mediumScreen, smallScreen, smallestScreen ]


allScreens : Svg Msg
allScreens =
    Svg.style []
        [ Svg.text
            (".what-we-do-list {"
                ++ "font-family: \"Lato\",Helvetica,Arial,sans-serif;"
                ++ "font-size: 48px ;"
                ++ "line-height: 72px;"
                ++ "margin-left: 5%;"
                ++ "margin-right: 5%;"
                ++ "color: "
                ++ textColor
                ++ "}"
            )
        ]


textColor : String
textColor =
    "#353535"


largeScreen : Svg Msg
largeScreen =
    Svg.style []
        [ Svg.text "@media (max-width: 1024x) { .large {display: none;}}"
        ]


mediumScreen : Svg Msg
mediumScreen =
    Svg.style []
        [ Svg.text
            ("@media (max-width: 1024px) and (min-width: 768px)"
                ++ "{"
                ++ " .medium { display: none; }"
                ++ " .what-we-do-list {"
                ++ "   font-size: 64px ;"
                ++ "   line-height: 96px;"
                ++ " }"
                ++ "}"
            )
        ]


smallScreen : Svg Msg
smallScreen =
    Svg.style []
        [ Svg.text
            ("@media (max-width: 768px)"
                ++ "{"
                ++ " .small { display: none; }"
                ++ " .what-we-do-list {"
                ++ "   font-size: 96px ;"
                ++ "   line-height: 144px;"
                ++ " }"
                ++ "}"
            )
        ]


smallestScreen : Svg Msg
smallestScreen =
    Svg.style []
        [ Svg.text
            ("@media (max-width: 480px)"
                ++ "{"
                ++ " .smallest { display: none; }"
                ++ " .what-we-do-list {"
                ++ "   font-size: 120px ;"
                ++ "   line-height: 180px;"
                ++ " }"
                ++ "}"
            )
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
                        [ points "0 495, 0 855, 2078 855, 2078 495"
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
            [ x "-1"
            , y "0"
            , width "2079"
            , height "854"
            , stroke "transparent"
            , fill "white"
            ]
            []
        ]


serviceSectionCover : Svg Msg
serviceSectionCover =
    g []
        [ rect
            [ x "-1"
            , y "0"
            , width "2079"
            , height "1754"
            , stroke "transparent"
            , fill "white"
            ]
            []
        ]


planningSectionCover : Svg Msg
planningSectionCover =
    g []
        [ rect
            [ x "-1"
            , y "0"
            , width "2079"
            , height "2654"
            , stroke "transparent"
            , fill "white"
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
    , headerAnimation "2078 400" "2078 900" "0.5s" "2.5s"
    , headerAnimation "2078 800" "2078 1800" "1s" "3s"
    ]


serviceAnimations : List (Svg Msg)
serviceAnimations =
    [ headerAnimation "-2078 0" "-2078 0" "1.5" "0s"
    , headerAnimation "-2078 0" "2078 0" "1s" "1.5s"
    , headerAnimation "2078 0" "2078 400" "0.5s" "2.5s"
    , headerAnimation "2078 400" "2078 900" "1s" "3s"
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
            , from "-1312 0"
            , to "-1312 0"
            , dur "0.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1312 0"
            , to "2844 0"
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
            , from "-1312 0"
            , to "-1312 0"
            , dur "1.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1312 0"
            , to "2844 0"
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
            , from "-1312 0"
            , to "-1312 0"
            , dur "2.5s"
            , repeatCount "1"
            , begin "0s"
            , fill "freeze"
            ]
            []
        , animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "-1312 0"
            , to "2844 0"
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
        , foreignObject [ x "0", y "0", width "2078", height "855" ] [ educationSection ]
        ]


serviceSectionContainer : Svg Msg
serviceSectionContainer =
    g
        [ id "service-section-content"
        ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "0 0"
            , to "0 1755"
            , dur "1s"
            , repeatCount "1"
            , begin "3s"
            , fill "freeze"
            ]
            []
        , foreignObject [ x "0", y "0", width "2078", height "855" ] [ serviceSection ]
        ]


planningSectionContainer : Svg Msg
planningSectionContainer =
    g
        [ id "planning-section-content"
        ]
        [ animateTransform
            [ attributeName "transform"
            , type_ "translate"
            , from "0 0"
            , to "0 2655"
            , dur "1s"
            , repeatCount "1"
            , begin "3s"
            , fill "freeze"
            ]
            []
        , foreignObject [ x "0", y "0", width "2078", height "855" ] [ planningSection ]
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


serviceSection : Html.Html msg
serviceSection =
    div [ Html.Attributes.style [ ( "border", "2px solid " ++ lightBlue ) ] ]
        [ ul
            [ Html.Attributes.class "what-we-do-list"
            ]
            [ li []
                [ Html.text
                    "Build local resilience, especially for individuals and communities particularly vulnerable to climate change"
                ]
            , li []
                [ Html.text
                    "Collaborate with emergency management agencies and other local partners to respond before, during, and after extreme weather events"
                ]
            ]
        ]


planningSection : Html.Html msg
planningSection =
    div [ Html.Attributes.style [ ( "border", "2px solid " ++ lightGreen ) ] ]
        [ ul
            [ Html.Attributes.class "what-we-do-list"
            ]
            [ li []
                [ Html.text
                    "Build long-term climate resilience at the municipal and state levels"
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
