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
				<h>@@following_loaned_item_which_has@@</h>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<xsl:for-each select="notification_data">
				<table>
					<tr>
						<td><b>@@title@@: </b> <xsl:value-of select="item_loan/title"/>
						<br />
						<b>@@loan_details@@: </b><xsl:value-of select="item_loan/description"/>
						<br />
						<b>@@author@@: </b><xsl:value-of select="item_loan/author"/>
						<br />
						<b>@@library@@ :</b><xsl:value-of select="organization_unit/name"/>
						<br />
						<b>@@loan_date@@ :</b><xsl:value-of select="item_loan/loan_date"/>
						<br />
						<b>@@due_date@@ :</b><xsl:value-of select="item_loan/due_date"/>
						<br />
						<b>@@your_account_balance_will_be_credited@@: </b>
						<br />
						@@bellow_details_charges_credits_due@@
						</td>
					</tr>

				</table>
				</xsl:for-each>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th align="right" width="10">@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td align="right"><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="finecomment"/></td>
					</tr>
					</xsl:for-each>



					<tr>
						<td align="right"><b>@@total@@:</b></td>
						<td align="right"><xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/fines_fees_list/user_fines_fees/fine_fee_ammount/currency"/></td>
					</tr>

				</table>
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