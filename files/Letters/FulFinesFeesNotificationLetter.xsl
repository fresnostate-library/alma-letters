<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
                    <xsl:call-template name="bodyStyleCss" />
                    <!-- style.xsl -->
                </xsl:attribute>
                <xsl:call-template name="head" />
                <!-- header.xsl -->
                <br />
                <table cellspacing="0" cellpadding="5" border="0">
                    <tr>
                        <td>
                            <xsl:for-each select="notification_data">
                                <h3>
                                    Dear 
                                    <xsl:value-of select="receivers/receiver/user/first_name" />
                                    <xsl:text> </xsl:text> <!-- Add a space here --> 
                                    <xsl:value-of select="receivers/receiver/user/last_name" />
                                    ,
                                </h3>
                            </xsl:for-each>
                            <h>
                                @@we_would_like@@
                                <xsl:value-of select="notification_data/organization_unit/name" />
                                @@debt_of@@
                                <b>
                                    <xsl:value-of select="notification_data/total_fines_amount" />
                                    <xsl:text> </xsl:text> <!-- Add a space here --> 
                                    <xsl:value-of select="notification_data/total_fines_currency" />
                                </b>
                            </h>
                        </td>
                    </tr>
                </table>
                <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                        <xsl:call-template name="mainTableStyleCss" />
                        <!-- style.xsl -->
                    </xsl:attribute>
                    <table cellpadding="5" class="listing">
                        <xsl:attribute name="style">
                            <xsl:call-template name="mainTableStyleCss" />
                            <!-- style.xsl -->
                        </xsl:attribute>
                        <tr>
                            <th>Title</th>
                            <th>@@fee_type@@</th>
                            <th>@@fee_amount@@</th>
                            <th>@@note@@</th>
                        </tr>
                        <xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
                            <tr>
                                <td>
                                    <xsl:value-of select="item_title" />
                                </td>
                                <td>
                                    <xsl:value-of select="fine_fee_type_display" />
                                </td>
                                <td>
                                    <xsl:value-of select="fine_fee_ammount/sum" />
                                     
                                    <xsl:value-of select="fine_fee_ammount/currency" />
                                </td>
                                <td>
                                    <xsl:value-of select="fine_comment" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <br />
                    <h>
                        <b>@@please_settle@@</b>
                    </h>
                    <br />
                    <a href="https://commerce.cashnet.com/EM_LIB">
                        <img src="https://drive.google.com/uc?id=1IYhRaR5WVMUm1-d2DW_0leuC6lqh6-8G" style="width:85px; height:29px" title="Pay Fine" />
                    </a>
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td>
                                <b>Loan Policy</b>
                            </td>
                        </tr>
                        <tr>
                            <td>Patrons are financially responsible for fines accrued as well as any replacement or repair costs if an item is lost or damaged.</td>
                        </tr>
                        <br />
                        <tr>
                            <td><br />@@sincerely@@</td>
                        </tr>
                        <br />
                        <tr>
                            <td><br />@@department@@</td>
                        </tr>
                        <tr>
                            <td>Fresno State Library</td>
                        </tr>
                        <tr>
                            <td>California State University, Fresno</td>
                        </tr>
                        <tr>
                            <td>5200 N. Barton Ave. M/S UL 34</td>
                        </tr>
                        <tr>
                            <td>Fresno, CA 93740</td>
                        </tr>
                        <tr>
                            <td>
                                (559)
                                <font color="white">)</font>
                                278-2551
                            </td>
                        </tr>
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
