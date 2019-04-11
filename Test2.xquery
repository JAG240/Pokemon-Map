let $pokemon := collection('Pokemon/')

let $name := $pokemon//name/string()

for $p in $pokemon
let $loc := $p//locations

return if($loc=>matches("Power Plant"))
then 
let $names := concat($p//name/string(), "&#10;")
return concat("&#x9;", $names, "&#x9;", "Power Plant")
else
let $na := ""
return tokenize($na, " ")
