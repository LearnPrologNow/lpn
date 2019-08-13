comment('Continuant', "An entity that exists in full at any time in which it exists at all, persists through time while maintaining its identity and has no temporal parts.").
comment('Disposition', "The disposition or capability to do something, distinct from actually doing it.").
comment('Function', "The disposition the thing was designed to perform, its reason for existence.").
comment('GenericallyDependentContinuant', "A continuant that is dependent on one or other independent continuant bearers. For every instance of A requires some instance of (an independent continuant type) B but which instance of B serves can change from time to time.").
comment('ImmaterialEntity', "An Immaterial Entity").
comment('IndependentContinuant', "A continuant that is a bearer of quality and realizable entity entities, in which other entities inhere and which itself cannot inhere in anything.").
comment('MaterialEntity', "An independent continuant that is spatially extended whose identity is independent of that of other entities and can be maintained through time.").
comment('Occurant', "An entity that has temporal parts and that happens, unfolds or develops through time.").
comment('Process', "An occurrent that has temporal proper parts and for some time t, p s-depends_on some material entity at t.").
comment('Quality', "A quality of an Independent Entity, something that describes that Independent Entity.").
comment('RealizableEntity', "A specifically dependent continuant  that inheres in continuant  entities and are not exhibited in full at every time in which it inheres in an entity or group of entities. The exhibition or actualization of a realizable entity is a particular manifestation, functioning or process that occurs under certain circumstances.").
comment('Role', "A realizable entity  the manifestation of which brings about some result or end that is not essential to a continuant  in virtue of the kind of thing that it is but that can be served or participated in by that kind of continuant  in some kinds of natural, social or institutional contexts.").
comment('SpatialRegion', "A region of space").
comment('SpecificallyDependentContinuant', "A continuant that inheres in or is borne by other entities. Every instance of A requires some specific instance of B which must always be the same.").
comment('Thing', "A thing in the described universe").
'Continuant'(comment, "An entity that exists in full at any time in which it exists at all, persists through time while maintaining its identity and has no temporal parts.").
'Continuant'(label, "Continuant").
'Continuant'(subClassOf, 'Thing').
'Disposition'(comment, "The disposition or capability to do something, distinct from actually doing it.").
'Disposition'(label, "Disposition").
'Disposition'(subClassOf, 'RealizableEntity').
'Function'(comment, "The disposition the thing was designed to perform, its reason for existence.").
'Function'(label, "Function").
'Function'(subClassOf, 'Disposition').
'GenericallyDependentContinuant'(comment, "A continuant that is dependent on one or other independent continuant bearers. For every instance of A requires some instance of (an independent continuant type) B but which instance of B serves can change from time to time.").
'GenericallyDependentContinuant'(label, "Generically Dependent Continuant").
'GenericallyDependentContinuant'(subClassOf, 'Continuant').
'ImmaterialEntity'(comment, "An Immaterial Entity").
'ImmaterialEntity'(label, "Immaterial Entity").
'ImmaterialEntity'(subClassOf, 'IndependentContinuant').
'IndependentContinuant'(comment, "A continuant that is a bearer of quality and realizable entity entities, in which other entities inhere and which itself cannot inhere in anything.").
'IndependentContinuant'(label, "Independent Continuant").
'IndependentContinuant'(subClassOf, 'Continuant').
label('Continuant', "Continuant").
label('Disposition', "Disposition").
label('Function', "Function").
label('GenericallyDependentContinuant', "Generically Dependent Continuant").
label('ImmaterialEntity', "Immaterial Entity").
label('IndependentContinuant', "Independent Continuant").
label('MaterialEntity', "Material Entity").
label('Occurant', "Occurant").
label('Process', "Process").
label('Quality', "Quality").
label('RealizableEntity', "Realizable Entity").
label('Role', "Role").
label('SpatialRegion', "Spatial Region").
label('SpecificallyDependentContinuant', "Specifically Dependent Continuant").
label('Thing', "Thing").
'MaterialEntity'(comment, "An independent continuant that is spatially extended whose identity is independent of that of other entities and can be maintained through time.").
'MaterialEntity'(label, "Material Entity").
'MaterialEntity'(subClassOf, 'IndependentContinuant').
'Occurant'(comment, "An entity that has temporal parts and that happens, unfolds or develops through time.").
'Occurant'(label, "Occurant").
'Occurant'(subClassOf, 'Thing').
'Process'(comment, "An occurrent that has temporal proper parts and for some time t, p s-depends_on some material entity at t.").
'Process'(label, "Process").
'Process'(subClassOf, 'Occurant').
'Quality'(comment, "A quality of an Independent Entity, something that describes that Independent Entity.").
'Quality'(label, "Quality").
'Quality'(subClassOf, 'SpecificallyDependentContinuant').
'RealizableEntity'(comment, "A specifically dependent continuant  that inheres in continuant  entities and are not exhibited in full at every time in which it inheres in an entity or group of entities. The exhibition or actualization of a realizable entity is a particular manifestation, functioning or process that occurs under certain circumstances.").
'RealizableEntity'(label, "Realizable Entity").
'RealizableEntity'(subClassOf, 'SpecificallyDependentContinuant').
'Role'(comment, "A realizable entity  the manifestation of which brings about some result or end that is not essential to a continuant  in virtue of the kind of thing that it is but that can be served or participated in by that kind of continuant  in some kinds of natural, social or institutional contexts.").
'Role'(label, "Role").
'Role'(subClassOf, 'RealizableEntity').
'SpatialRegion'(comment, "A region of space").
'SpatialRegion'(label, "Spatial Region").
'SpatialRegion'(subClassOf, 'ImmaterialEntity').
'SpecificallyDependentContinuant'(comment, "A continuant that inheres in or is borne by other entities. Every instance of A requires some specific instance of B which must always be the same.").
'SpecificallyDependentContinuant'(label, "Specifically Dependent Continuant").
'SpecificallyDependentContinuant'(subClassOf, 'Continuant').
subClassOf('Continuant', 'Thing').
subClassOf('Disposition', 'RealizableEntity').
subClassOf('Function', 'Disposition').
subClassOf('GenericallyDependentContinuant', 'Continuant').
subClassOf('ImmaterialEntity', 'IndependentContinuant').
subClassOf('IndependentContinuant', 'Continuant').
subClassOf('MaterialEntity', 'IndependentContinuant').
subClassOf('Occurant', 'Thing').
subClassOf('Process', 'Occurant').
subClassOf('Quality', 'SpecificallyDependentContinuant').
subClassOf('RealizableEntity', 'SpecificallyDependentContinuant').
subClassOf('Role', 'RealizableEntity').
subClassOf('SpatialRegion', 'ImmaterialEntity').
subClassOf('SpecificallyDependentContinuant', 'Continuant').
'Thing'(comment, "A thing in the described universe").
'Thing'(label, "Thing").
