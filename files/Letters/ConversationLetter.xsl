<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />

<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

				<br />
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
				<xsl:for-each select="notification_data/conversation_messages/message">
				<xsl:value-of select="message_subject"/>
						<br /><xsl:value-of select="message_body" disable-output-escaping="yes"/>
						<br />
				</xsl:for-each>
					</td>
					</tr>

				</table>
				<br />
				<table>
						<tr><td>@@sincerely@@</td></tr>
<br/>
						<tr><td>@@department@@</td></tr>
						<tr><td>Fresno State Library</td></tr>
						<tr><td>California State University, Fresno</td></tr>
						<tr><td>5200 N. Barton Ave. M/S UL 34</td></tr>
						<tr><td>Fresno, CA 93740</td></tr>
						<tr><td>&#40;559&#41;<font color="white">&#41;</font>278&#45;2551</td></tr>
				</table>
<xsl:template name="lastFooter">
	<table>
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	<tr>
<td align="center">


<br/>

<a style="color:white; text-decoration:none" href="mailto:hmlcirculation@listserv.csufresno.edu">Contact Us</a>     

<br/>
<br/>

</td>
	</tr>
	</table>
</xsl:template>
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>