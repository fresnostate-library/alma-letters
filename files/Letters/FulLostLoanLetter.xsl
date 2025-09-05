<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="mailReason.xsl" />
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
				<table cellspacing="0" cellpadding="5" border="0">
				<tr>
				<td>
					<h><b>@@inform_you_item_below@@ </b></h>
					<h><b>@@borrowed_by_you@@ @@decalred_as_lost@@</b></h>
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<xsl:for-each select="notification_data">
				<table>
					<tr>
						<td>
						<b>@@lost_item@@ :</b> <xsl:value-of select="item_loan/title"/>
						<br />
						<b>@@description@@ :</b><xsl:value-of select="item_loan/description"/>
						<br />
						<b> @@by@@ :</b><xsl:value-of select="item_loan/author"/>
						<br />
						<b>@@library@@ :</b><xsl:value-of select="organization_unit/name"/>
						<br />
						<b>@@loan_date@@ :</b><xsl:value-of select="item_loan/loan_date"/>
						<br />
						<b>@@due_date@@ :</b><xsl:value-of select="item_loan/due_date"/>
						<br />
						<b>@@barcode@@ :</b><xsl:value-of select="item_loan/barcode"/>
						<br />
						<b>@@call_number@@ :</b><xsl:value-of select="phys_item_display/call_number"/>
						<br />
						<b>@@charged_with_fines_fees@@ </b>
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
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="ff"/></td>
					</tr>
					</xsl:for-each>

				</table>
				<br />
				<br />
				@@additional_info_1@@
				<br />
				@@additional_info_2@@
				<br />
				<table>
						<tr><td><b>Loan Policy</b></td></tr>
						<tr><td>Patrons are financially responsible for fines accrued as well as any replacement or repair costs if an item is lost or damaged. To make a payment online, click the link below.</td></tr>
<br />
<a href="https://commerce.cashnet.com/EM_LIB"><img src="https://drive.google.com/uc?id=1IYhRaR5WVMUm1-d2DW_0leuC6lqh6-8G" style="width:85px; height:29px" title="Pay Fine"></img></a>

						<tr><td>@@sincerely@@</td></tr>
<br />
						<tr><td>@@department@@</td></tr>
						<tr><td>Fresno State Library</td></tr>
						<tr><td>California State University, Fresno</td></tr>
						<tr><td>5200 N. Barton Ave. M/S UL 34</td></tr>
						<tr><td>Fresno, CA 93740</td></tr>
						<tr><td>&#40;559&#41;<font color="white">&#41;</font>278&#45;2551</td></tr>
				</table>
				</table>
				<br />

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />

			</body>
	</html>
</xsl:template>

</xsl:stylesheet>