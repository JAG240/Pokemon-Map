<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/> 
    
    <xsl:variable name="locations" as="document-node()+" select="collection('Locations/Landmarks/?select=*.xml')"/>
    <xsl:variable name="encounters" select="encounters"/>
    <!--ebb: Above is a variable in XSLT, defining the collection of Pokemon files and including only the files ending with a .xml file extension. We will call it with a dollar sign below.  -->
    
    <xsl:template match="/">
        <xsl:for-each select="$locations//location">
            <!--We make a new variable inside our xsl:for-each to collect each filename. We can alter it if you like.-->
            <xsl:variable name="filename">
                <xsl:value-of select="tokenize(base-uri(), '/')[last()] ! substring-before(., '.xml')"/>
            </xsl:variable>
            
            <xsl:result-document method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
                omit-xml-declaration="yes" href="landmarksHTMLOutput/{$filename}.html">
                <html>
                    <head>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <meta name="Pokemon Team" content="The Pokemon Map" />
                        <title><xsl:apply-templates select="current()//name/string()"/></title>
                        <link rel="shortcut icon" href="../Images/Pokeball.PNG"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/MainPage.css"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/navBar.css"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/aRef.css"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/pokemon.css"/>
                        <xsl:comment>#include virtual="../HTML/Navbar_Poke.html" </xsl:comment>
                    </head>
                    <body>
                        <div class="mon">
                            <!--ebb: This (below) is how you add a SSI with XSLT. See http://dh.obdurodon.org/ssi.xhtml for details. -->  
                            <h1><xsl:apply-templates select="current()//name/string()"/></h1> 
                            <img alt="{current()//name/string()}" src="../Images/{current()//name/string()}.png"/>
                            <p><xsl:apply-templates select="current()//des/string()"/></p>
                            <h2>Pokemon:</h2>
                            <ul>
                                <xsl:for-each select="current()//pokemon">
                                    <li><a href ="../pokemonHTMLOutput/{current()//@*}.html"><xsl:apply-templates select="current()" mode="multi"/></a></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>