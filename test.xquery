xquery version "3.0";

declare namespace xmldb="http://exist-db.org/xquery/xmldb";

declare variable $ThisFile := string-join(

let $pokemon := collection('Pokemon/')

for $p in $pokemon
let $name := $p//name
let $dex := $p//dexNum/string()
let $loc := $p//locations/string()=>tokenize("level.+")

let $test := $loc

let $locs := concat( $p//locations/string(), '&#x9;')

let $fix := concat($name,"&#x9;", $locs)

let $lvl := $p//lvl/string()

let $rate := $p//rate/string()=>tokenize("$")

return $fix);
let $filename := "test.tsv"
return $ThisFile