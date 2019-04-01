let $pokemon := collection('Pokemon/')

for $p in $pokemon return 
let $name := $p//name
let $dex := $p//dexNum/string()
let $loc := $p//locations/string()=>tokenize("level.+")

let $test := $loc

let $locs := concat( $p//locations/string(), '&#10;')
let $fix := <p>{$locs}</p>

let $lvl := $p//lvl/string()

let $rate := $p//rate/string()=>tokenize("$")

return $rate