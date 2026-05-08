<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />

  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />

  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" />
          <!-- style.xsl -->
        </xsl:attribute>
        <xsl:call-template name="head" />
        <!-- header.xsl -->


		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td>@@introduction_body_thanks@@ : <xsl:value-of select="notification_data/trial/title" /> .</td>
				</tr>
				<tr>
					<td>@@link@@ :
					<a>
                        <xsl:attribute name="href">
                          <xsl:value-of select="notification_data/participant_url" />
                        </xsl:attribute>
						<xsl:value-of select="notification_data/trial/title" />
					</a>
					</td>
				</tr>
				<xsl:if  test="notification_data/trial/electronic_collection != ''" >
					<tr>
						<td>@@linkToCollection@@ :
						<a>
                        	<xsl:attribute name="href">
                          	  <xsl:value-of select="notification_data/trial/electronic_collection" />
                        	</xsl:attribute>
							<xsl:value-of select="notification_data/poline_description" />
						</a>
						</td>
					</tr>
				</xsl:if>
					<tr>
						<td>@@schedule@@ <xsl:value-of select="notification_data/trial/start_date" />  - <xsl:value-of select="notification_data/trial/end_date" />  .</td>
					</tr>
					<xsl:choose >
						<xsl:when test="/notification_data/reminder='true'">
							<tr><td>@@reminder_end_thanks@@</td></tr>
							<tr><td>@@reminder_register_opinion@@</td></tr>
						</xsl:when>
					</xsl:choose>

			</table>
			<br />
				<table>

						<tr><td>@@sincerely@@</td></tr>
<br />
						<tr><td>@@department@@</td></tr>
						<tr><td>Fresno State Library</td></tr>
						<tr><td>California State University, Fresno</td></tr>
						<tr><td>5200 N. Barton Ave. M/S UL 34</td></tr>
						<tr><td>Fresno, CA 93740</td></tr>
						<tr><td>&#40;559&#41;<font color="white">&#41;</font>278&#45;2551</td></tr>
				</table>
          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
