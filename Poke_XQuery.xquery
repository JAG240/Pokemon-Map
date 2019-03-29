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
for $o in $loc

let $lvl := $p//locations//lvl/string()
for $i in $lvl

let $rate := $p//locations//rate/string()
for $r in $rate
return 

<tr><td>{$o}</td><td>{$i}</td><td>{$r}</td></tr>}
</table>
</body>
</html>
