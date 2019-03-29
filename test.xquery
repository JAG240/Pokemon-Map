let $pokemon := collection('Pokemon/')

for $p in $pokemon
let $name := $p//name
let $loc := $p//locations/string()=>tokenize("level.+")
let $lvl := $p//lvl
for $l in $lvl
let $fix := concat($l/string(), '
')

let $rate := $p//locations//rate
for $r in $rate
let $rFix := concat($r/string(), '
')
return $rFix