<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/> 

    <xsl:variable name="pokemon" as="document-node()+" select="collection('Pokemon/?select=*.xml')"/>
    <!--ebb: Above is a variable in XSLT, defining the collection of Pokemon files and including only the files ending with a .xml file extension. We will call it with a dollar sign below.  -->
    
    <xsl:template match="/">
        <xsl:for-each select="$pokemon//pokemon">
        <!--We make a new variable inside our xsl:for-each to collect each filename. We can alter it if you like.-->
            <xsl:variable name="filename">
                <xsl:value-of select="tokenize(base-uri(), '/')[last()] ! substring-before(., '.xml')"/>
            </xsl:variable>
          
            <xsl:result-document method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
                omit-xml-declaration="yes" href="pokemonHTMLOutput/{$filename}.html">
                <html>
                    <head>
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <meta name="Pokemon Team" content="The Pokemon Map" />
                        <title><xsl:apply-templates select="current()//name"/></title>
                        <link rel="stylesheet" type="text/css" href="../CSS/MainPage.css"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/navBar.css"/>
                        <link rel="stylesheet" type="text/css" href="../CSS/aRef.css"/>
                    </head>
                    <body>
                        <!--ebb: This (below) is how you add a SSI with XSLT. See http://dh.obdurodon.org/ssi.xhtml for details. -->  
                        <xsl:comment>#include virtual="Navbar_HTML.html" </xsl:comment>    <h1><xsl:apply-templates select="current()//name"/></h1> 
                        <img alt="{current()//name}" src=""/>
   <h2>Pokedex Number: <xsl:apply-templates select="current()//dexNum"/></h2>           <h2>Locations:</h2> 
  <ul>
    <xsl:apply-templates select="current()//locations"/>
  </ul>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>   
 <xsl:template match="locations">
     <xsl:if test="count(child::landmark) gt 1">
       <li>Landmarks: <ul><a href=""><xsl:apply-templates select="landmark" mode="multi"/></a></ul></li>
     </xsl:if>
   <xsl:if test="count(child::landmark) = 1">
       <li>Landmark: <xsl:apply-templates select="landmark"/></li>
   </xsl:if>
     <xsl:if test="child::route">
         <li>Routes: <ul><xsl:apply-templates select="route"/></ul>
        </li>
     </xsl:if>
 </xsl:template>
    <xsl:template match="landmark" mode="multi">
        <li><a href=""><xsl:apply-templates/></a></li>
    </xsl:template>
    <xsl:template match="route">
        <li><a href=""><xsl:apply-templates/></a></li>
    </xsl:template>
   
</xsl:stylesheet>