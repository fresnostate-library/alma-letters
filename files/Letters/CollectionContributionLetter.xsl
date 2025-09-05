<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />

<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />
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
					<xsl:call-template name="toWhomIsConcerned" />
			<div class="messageArea">
				<div class="messageBody">
					 <table cellspacing="0" cellpadding="5" border="0">
           				<xsl:if test="/notification_data/package_name  !=''">
							<tr><td>
							<br /><a>&#160;@@packageName@@ </a>
							<xsl:value-of select="/notification_data/package_name" />
							<a>&#160;@@packageNameSecondPart@@ </a>
							</td></tr>
						</xsl:if>
						<tr><td>&#160;@@jobCompletion@@</td></tr>
						<xsl:if test="/notification_data/bib  !=''">
							<tr><td>
							<br /><xsl:value-of select="/notification_data/bib" /><a>&#160;@@bib@@ </a>
							</td></tr>
						</xsl:if>
						<xsl:if test="/notification_data/port  !=''">
							<tr><td>
							<br /><xsl:value-of select="/notification_data/port" /><a>&#160;@@port@@ </a>
							</td></tr>
						</xsl:if>
						<xsl:if test="/notification_data/multi_match  !=''">
							<tr><td>
							<br /><a>&#160;@@multiMatch@@ </a>
							<xsl:value-of select="/notification_data/multi_match" />
							</td></tr>
						</xsl:if>
						<br />
						<tr><td>&#160;@@mailMessage@@</td></tr>
					</table>
				</div>
			</div>
			<table>
				<tr><td>@@sincerely@@</td></tr>
<br/>
				<tr><td>Resource Management</td></tr>
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