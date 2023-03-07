<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="salutation"></xsl:template>

<xsl:template name="lastFooter">
<table role="presentation" border="0" cellspacing="0" cellpadding="0" width="100%">
    <xsl:attribute name="style">
        <xsl:call-template name="footerTableStyleCss" />
    </xsl:attribute>
    <tr>
        <td align="center" style="padding:1em;">
            <a href="https://www.facebook.com/FresnoStateLibrary">
                <img src="https://library.fresnostate.edu/sites/all/assets/img/brand/24x24-facebook.png" alt="Facebook" style="border:0; margin:5px;"></img>
            </a>
            <a href="https://twitter.com/FresnoStLibrary">
                <img src="https://library.fresnostate.edu/sites/all/assets/img/brand/24x24-twitter.png" alt="Twitter" style="border:0; margin:5px;"></img>
            </a>
            <a href="https://instagram.com/fresnostatelibrary/">
                <img src="https://library.fresnostate.edu/sites/all/assets/img/brand/24x24-instagram.png" alt="Instagram" style="border:0; margin:5px;"></img>
            </a>
            <br/>
            <a style="color:#fff; text-decoration:none;" href="mailto:hmlcirculation@listserv.csufresno.edu">Contact Us</a>     
            &#160; &#160; &#8212; &#160; &#160; 
            <a style="color:#fff; text-decoration:none;" href="https://csu-fresnostate.primo.exlibrisgroup.com/discovery/login?vid=01CALS_UFR:M">My Account</a>  
        </td>
    </tr>
</table>
</xsl:template>

<xsl:template name="contactUs">
</xsl:template>

<xsl:template name="myAccount">
</xsl:template>

</xsl:stylesheet>