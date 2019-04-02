(: 2019-04-01 ebb: I wrote this to explore the location elements in the Pokemon collection to see how data is stored. I determined that there are two ways, through a <location> and a <route> element.  :)
let $pokemon := collection('Pokemon/')/*
let $name := $pokemon//name/string()
let $dex := $pokemon//dexNum/string()
let $type := $pokemon//typing/string()
let $locs := $pokemon//locations
let $locsLandmarks := $locs[landmark]
let $locsNotLandmarks := $locs[not(landmark)]
let $locsChildElems := $locs/*/name() => distinct-values()
return 
$locsChildElems