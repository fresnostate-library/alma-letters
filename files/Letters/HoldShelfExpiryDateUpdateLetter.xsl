<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template match="/">
	<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

		<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<!-- REMOVED: SenderReceiver.xsl -->

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->


					<div class="messageArea">
						<div class="messageBody">
							<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
								<tr>
									<td>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <xsl:value-of select="notification_data/request/assigned_unit_name"/> @@circulation_desk@@.</td>
								</tr>

								<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
									<tr>
										<td>
										 @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
										 </td>
									</tr>
								</xsl:if>

								<tr>
									<td><strong><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></strong></td>
								</tr>

								<xsl:if test="notification_data/request/system_notes !=''">
								<tr>
									<td>@@notes_affect_loan@@:</td>
								</tr>
								<tr>
									<td><xsl:value-of select="notification_data/request/system_notes" /></td>
								</tr>
								</xsl:if>
								
							</table>

							<br />

							<table>
								<tr><td>@@sincerely@@</td></tr>
								<tr><td><br/>@@department@@</td></tr>
								<tr><td>Fresno State Library</td></tr>
								<tr><td>California State University, Fresno</td></tr>
								<tr><td>5200 N. Barton Ave. M/S UL 34</td></tr>
								<tr><td>Fresno, CA 93740</td></tr>
								<tr><td>&#40;559&#41; 278&#45;2551</td></tr>
							</table>

						</div>
					</div>


				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
	</xsl:template>

</xsl:stylesheet>
