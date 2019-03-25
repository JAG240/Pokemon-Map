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
        <meta name="Pokemon Team" content="The Pokemon Map" />
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="../CSS/MainPage.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/navBar.css"/>
        <link rel="stylesheet" type="text/css" href="../CSS/aRef.css"/>
        <!--#include file="Navbar_HTML.html"-->
</head>
<body>
<h1>{$name}</h1>
<table>
<tr><th>Location</th><th>Level</th><th>Encounter Rate</th></tr>
{
for $l in $locs
let $loc := $l/string()=>tokenize("level.+")

if $l//rate=>exsist(.)
let $rate := $l//rate/string()
else
let := $rate := 'N/A'

let $level := $pokemon//locations//lvl/string()
for $v in $level

return

<tr><td>{$loc}</td><td>{$v}</td><td>{$rate}</td></tr>}
</table>
</body>
</html>
