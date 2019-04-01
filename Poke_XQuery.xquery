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
<h2>Pokedex Number: {$dex}</h2>
<h2>Locations:</h2>
<ul>
{
for $l in $locs
let $loc := $l/string()=>tokenize("  ")
for $o in $loc
where string-length($o)>0

return
<li>{$o}</li>}
</ul>
</body>
</html>
