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

						<xsl:for-each select="notification_data">
						<h3>Dear&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,</h3>
						</xsl:for-each>

				<xsl:if  test="notification_data/transaction_id != ''" >
					<h4>@@transaction_id@@: <xsl:value-of select="/notification_data/transaction_id"/></h4>
				</xsl:if>

				<xsl:for-each select="notification_data/labels_list">
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td><xsl:value-of select="letter.fineFeePaymentReceiptLetter.message"/></td>
					</tr>
				</table>
				<br />

				</xsl:for-each>
				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>Title</th>
						<th>@@barcode@@</th>
						<th>@@fee_type@@</th>
						<th>@@payment_date@@</th>
						<th align="right">@@paid_amount@@</th>
						<th>@@payment_method@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/user_fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="item_title"/></td>
						<td><xsl:value-of select="item_barcode"/></td>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="create_date"/></td>
						<td align="right"><xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_ammount/currency"/>&#160;<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_amount_display"/></td>
						<td><xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_method"/></td>
						<td><xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_note"/></td>
					</tr>
					</xsl:for-each>

					<tr>
						<td> </td>
						<td align="right"><b>@@total@@:</b></td>
						<td align="right"><xsl:value-of select="notification_data/total_amount_paid"/></td>
					</tr>

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
        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />

			</body>
	</html>
</xsl:template>

</xsl:stylesheet>