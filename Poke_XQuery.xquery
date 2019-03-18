let $pokemon := collection('Pokemon/')/*
for $p in $pokemon
let $name := $p//name/string()
let $dex := $p//dexNum/string()
let $type := $p//typing/string()
let $locs := $p//locations
return 
<html>
<head>
<title>{$name}</title>
</head>
<body>
<h1>{$name}</h1>
<table>
<tr><th>Location</th><th>Level</th><th>Encounter Rate</th></tr>
{
for $l in $locs
let $
<tr><td></td><td></td><td></td></tr>}
</table>
</body>
</html>
