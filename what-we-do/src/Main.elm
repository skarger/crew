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
    clickableLogoDiagram model


clickableLogoDiagram : Model -> Html.Html Msg
clickableLogoDiagram model =
    svg
        [ Html.Attributes.style [ ( "margin-left", "auto" ), ( "margin-right", "auto" ), ( "display", "block" ) ]
        , width "1380"
        , height "1370"
        , viewBox "0 0 4040 4010"
        ]
        [ crewLogo
        , sectionContainer model
        ]


crewLogo : Svg Msg
crewLogo =
    g [ id "logo" ] [ orangeThird, blueThird, greenThird ]


sectionContainer : Model -> Svg Msg
sectionContainer model =
    g
        [ id "section-content"
        , transform "translate(1500, 446)"
        , width "2760"
        , height "2740"
        ]
        [ foreignObject [ width "100%", height "100%" ] [ model.selectedSection ] ]


educationSection : Html.Html msg
educationSection =
    div []
        [ h2
            []
            [ Html.span
                [ Html.Attributes.style
                    [ ( "color", darkOrange )
                    , ( "font-size", "48px" )
                    ]
                ]
                [ Html.text "Education" ]
            , Html.span
                [ Html.Attributes.style
                    [ ( "font-size", "48px" )
                    , ( "font-weight", "normal" )
                    ]
                ]
                [ Html.text " about:" ]
            ]
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
