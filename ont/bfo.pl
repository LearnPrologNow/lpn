concept('Thing',
    [ comment-"A thing in the described universe"
    , label-"Thing"
    ]
).

    concept('Continuant',
        [ comment-"An entity that exists in full at any time in which it exists at all, persists through time while maintaining its identity and has no temporal parts."
        , label-"Continuant"
        , subClassOf-'Thing'
        ]
    ).

        concept('GenericallyDependentContinuant',
            [ comment-"A continuant that is dependent on one or other independent continuant bearers. For every instance of A requires some instance of (an independent continuant type) B but which instance of B serves can change from time to time."
            , label-"Generically Dependent Continuant"
            , subClassOf-'Continuant'
            ]
        ).

        concept('IndependentContinuant',
            [ comment-"A continuant that is a bearer of quality and realizable entity entities, in which other entities inhere and which itself cannot inhere in anything."
            , label-"Independent Continuant"
            , subClassOf-'Continuant'
            ]
        ).

            concept('ImmaterialEntity',
                [ comment-"An Immaterial Entity"
                , label-"Immaterial Entity"
                , subClassOf-'IndependentContinuant'
                ]
            ).

                concept('SpatialRegion',
                    [ comment-"A region of space"
                    , label-"Spatial Region"
                    , subClassOf-'ImmaterialEntity'
                    ]
                ).

            concept('MaterialEntity',
                [ comment-"An independent continuant that is spatially extended whose identity is independent of that of other entities and can be maintained through time."
                , label-"Material Entity"
                , subClassOf-'IndependentContinuant'
                ]
            ).

        concept('SpecificallyDependentContinuant',
            [ comment-"A continuant that inheres in or is borne by other entities. Every instance of A requires some specific instance of B which must always be the same."
            , label-"Specifically Dependent Continuant"
            , subClassOf-'Continuant'
            ]
        ).

            concept('Quality',
                [ comment-"A quality of an Independent Entity, something that describes that Independent Entity."
                , label-"Quality"
                , subClassOf-'SpecificallyDependentContinuant'
                ]
            ).

            concept('RealizableEntity',
                [ comment-"A specifically dependent continuant  that inheres in continuant  entities and are not exhibited in full at every time in which it inheres in an entity or group of entities. The exhibition or actualization of a realizable entity is a particular manifestation, functioning or process that occurs under certain circumstances."
                , label-"Realizable Entity"
                , subClassOf-'SpecificallyDependentContinuant'
                ]
            ).

                concept('Disposition',
                    [ comment-"The disposition or capability to do something, distinct from actually doing it."
                    , label-"Disposition"
                    , subClassOf-'RealizableEntity'
                    ]
                ).

                    concept('Function',
                        [ comment-"The disposition the thing was designed to perform, its reason for existence."
                        , label-"Function"
                        , subClassOf-'Disposition'
                        ]
                    ).

                concept('Role',
                    [ comment-"A realizable entity  the manifestation of which brings about some result or end that is not essential to a continuant  in virtue of the kind of thing that it is but that can be served or participated in by that kind of continuant  in some kinds of natural, social or institutional contexts."
                    , label-"Role"
                    , subClassOf-'RealizableEntity'
                    ]
                ).

    concept('Occurant',
        [ comment-"An entity that has temporal parts and that happens, unfolds or develops through time."
        , label-"Occurant"
        , subClassOf-'Thing'
        ]
    ).

        concept('Process',
            [ comment-"An occurrent that has temporal proper parts and for some time t, p s-depends_on some material entity at t."
            , label-"Process"
            , subClassOf-'Occurant'
            ]
        ).
