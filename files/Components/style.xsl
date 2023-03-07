<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="bodyStyleCss">
font-family:arial; color:#333; margin:0; padding:0em; font-size:100%;
</xsl:template>

<xsl:template name="footerTableStyleCss">
background-color:#b1102b; width:100%; color:#fff; margin-top:1em; font-weight:700; line-height:1.5em; font-size: 100%;
</xsl:template>

<xsl:template name="generalStyle">
<style>
body { @@language_related_body_css@@ background-color:#fff; } 
h4 { line-height:0.1em; padding-top:0.5em; } 
.listing td { border-bottom:1px solid #eee; } 
.listing th { background-color:#f5f5f5; } 
.listing tr:hover td { background-color:#eee; } 
</style>
</xsl:template>

<xsl:template name="headerLogoStyleCss">
background-color:#fff; padding:1em;
</xsl:template>

<xsl:template name="headerTableStyleCss">
background-color:#b1102b; width:100%; text-align:center; color:#fff;
</xsl:template>

<xsl:template name="listStyleCss">
list-style:none; margin:0 0 0 0em; padding:0;
</xsl:template>

<xsl:template name="mainTableStyleCss">
width:100%; text-align:left;
</xsl:template>

</xsl:stylesheet>