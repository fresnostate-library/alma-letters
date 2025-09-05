<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />
  <xsl:variable name="conta1">0</xsl:variable>
  <xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
  <xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
  <xsl:variable name="externalSystem" select="/notification_data/external_system" />
  <xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
  <xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />

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
        <xsl:call-template name="senderReceiver" />
        <!-- SenderReceiver.xsl -->
        <div class="messageArea">
          <div class="messageBody">

          	<table cellspacing="0" cellpadding="5" border="0">
          		<tr>
					<td>@@your_request@@.</td>
				</tr>
				<tr>
					<td>@@title@@: <xsl:value-of select="notification_data/phys_item_display/title"/></td>
				</tr>
				<tr>
					<td>@@to_see_the_resource@@</td>
				</tr>
<!--
				<tr>
					<td>@@for_local_users@@<a><xsl:attribute name="href"><xsl:value-of select="notification_data/download_url_local" /></xsl:attribute>@@click_here@@</a></td>
				</tr>
-->
				<tr>
					<td>@@for_saml_users@@<a><xsl:attribute name="href"><xsl:value-of select="notification_data/download_url_saml" /></xsl:attribute>@@click_here@@</a></td>
				</tr>
<!--
				<tr>
					<td>@@for_cas_users@@<a><xsl:attribute name="href"><xsl:value-of select="notification_data/download_url_cas" /></xsl:attribute>@@click_here@@</a></td>
				</tr>
-->
<!--
				<tr>
					<td>@@max_num_of_views@@ <xsl:value-of select="notification_data/request/document_delivery_max_num_of_views"/>.</td>
				</tr>
-->
				<tr>
				<tr><td>@@sincerely@@</td></tr>
<br/>
				<tr><td>@@department@@</td></tr>
                                <tr><td>Fresno State Library</td></tr>
                                <tr><td>California State University, Fresno</td></tr>
                                <tr><td>5200 N. Barton Ave. M/S UL 34</td></tr>
                                <tr><td>Fresno, CA 93740</td></tr>
                                <tr><td>&#40;559&#41;<font color="white">&#41;</font>278&#45;3032</td></tr>
				</tr>
          	</table>
          </div>
        </div>
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />


      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
