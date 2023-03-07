<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="head">
<table role="presentation" border="0" cellspacing="0" cellpadding="0" width="100%">
	<xsl:attribute name="style">
		<xsl:call-template name="headerTableStyleCss" />
	</xsl:attribute>
	<tr>
		<xsl:attribute name="style">
			<xsl:call-template name="headerLogoStyleCss" />
		</xsl:attribute>
		<td>
			<img src="https://library.fresnostate.edu/sites/all/assets/img/brand/library-logo.png" alt="Fresno State Library" />
		</td>
	</tr>
	<tr>
  		<xsl:for-each select="notification_data/general_data">
		<td align="center" style="vertical-align:middle; padding:1em;">
			<h2><xsl:value-of select="letter_name" /></h2>
		</td>
  		</xsl:for-each>
	</tr>
</table>
</xsl:template>

</xsl:stylesheet>