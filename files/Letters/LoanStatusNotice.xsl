<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
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

				<br />
				<xsl:for-each select="notification_data">
					<h3>Dear&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,</h3>
				</xsl:for-each>
				<div class="messageArea">
					<div class="messageBody">

						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
										<b>@@recall_and_date_change@@</b>
									</xsl:if>
									<xsl:if test="notification_data/message='RECALL_ONLY'">
										<b>@@recall_and_no_date_change@@</b>
									</xsl:if>
									<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
										<b>@@message@@</b>
									</xsl:if>
									<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
										<b>@@cancel_recall_date_change@@</b>
									</xsl:if>
									<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
										<b>@@cancel_recall_renew@@</b>
									</xsl:if>
									<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
										<b>@@cancel_recall_no_date_change@@</b>
									</xsl:if>

									<br />
									<br />
								</td>
							</tr>
							<tr>
								<td>
									<b>@@loans@@</b>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>@@title@@</th>
											<th>@@author@@</th>
											<th>@@old_due_date@@</th>
											<th>@@new_due_date@@</th>
										</tr>

										<xsl:for-each select="notification_data/item_loans/item_loan">
										<xsl:sort select="new_due_date_str"/>
										<tr>
											<td><xsl:value-of select="title"/></td>
											<td><xsl:value-of select="author"/></td>
											<td><xsl:value-of select="old_due_date_str"/></td>
											<td><xsl:value-of select="new_due_date_str"/></td>
										</tr>
										</xsl:for-each>

									</table>
								</td>
							</tr>
						</table>

						<br />
						<table>
							<tr><td><b>Loan Policy</b></td></tr>
							<tr><td>Patrons are financially responsible for fines accrued as well as any replacement or repair costs if an item is lost or damaged.</td></tr>
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

		<!-- footer.xsl -->
		<xsl:call-template name="lastFooter" />
		<xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />

			</body>
	</html>
</xsl:template>

</xsl:stylesheet>
