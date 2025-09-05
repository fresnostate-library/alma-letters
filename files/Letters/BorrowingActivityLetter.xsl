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
      <head>

        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->


		<br />


        <div class="messageArea">
          <div class="messageBody">

			<table cellspacing="0" cellpadding="5" border="0">

			  <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">

	              <tr>
	              	<td>
						<xsl:for-each select="notification_data">
						<h3>Dear&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,</h3>
						</xsl:for-each>
						<b>@@reminder_message@@</b>
						<br/><br/>
	                </td>
	              </tr>

	              <xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">

		              <tr>
		              	<td>
							
		                </td>
		              </tr>

					<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
						  <tr>
							<td>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="5">
											<h3>@@overdue_loans@@</h3>
										</td>
									</tr>
									<tr>
										<th>@@title@@</th>
										<th>@@author@@</th>
										<th>@@description@@</th>
										<th>@@due_date@@</th>
										<th>@@fine@@</th>										
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<xsl:sort select="due_date"/>
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="author"/></td>
											<td><xsl:value-of select="item_description"/></td>
											<td><xsl:value-of select="due_date"/></td>
											<td><xsl:value-of select="fine"/></td>											
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						
					</xsl:for-each>
				</xsl:if>

				<xsl:if test="notification_data/loans_by_library/library_loans_for_display">

				  <tr>
					<td>
<hr></hr>
						
					</td>
				  </tr>

					<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
						<tr>
							<td>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" />
									</xsl:attribute>
									<tr align="center" bgcolor="#f5f5f5">
										<td colspan="5">
											<h3><b>@@loans@@</b></h3>
										</td>
									</tr>
									<tr>
										<th>@@title@@</th>
										<th>@@author@@</th>
										<th>@@description@@</th>
										<th>@@due_date@@</th>
										<th>@@fine@@</th>											
									</tr>

									<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<xsl:sort select="due_date"/>
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="author"/></td>
											<td><xsl:value-of select="item_description"/></td>
											<td><xsl:value-of select="due_date"/></td>
											<td><xsl:value-of select="fine"/></td>											
										</tr>
									</xsl:for-each>
								</table>
							</td>
						</tr>
						
					</xsl:for-each>
				</xsl:if>

			  </xsl:if>

			  <xsl:if test="notification_data/organization_fee_list/string">
	              <tr>
	              	<td><hr></hr><br></br>
						<b>@@debt_message@@</b>
	                </td>
	              </tr>

	              <xsl:for-each select="notification_data/organization_fee_list/string">
	              	<tr>
						<td><xsl:value-of select="."/></td>
					</tr>
	              </xsl:for-each>

				  <tr>
	              	<td>
						<b>
						@@total@@ <xsl:value-of select="notification_data/total_fee"/>
						</b>
	                </td>
	              </tr>

	              <tr>
	              	<td>
						<b>@@please_pay_message@@</b>
						<br/><br/>

	                </td>
	              </tr>

			  </xsl:if>

            </table>
<hr></hr>
			<br/>

			<table>
						<tr><td><b>Loan Policy</b></td></tr>
						<tr><td>Patrons are financially responsible for fines accrued as well as any replacement or repair costs if an item is lost or damaged.</td></tr>
<br />

				<tr><td>@@sincerely@@</td></tr>
<br/>
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
