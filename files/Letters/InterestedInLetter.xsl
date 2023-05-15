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
                <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
                <br />
                <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

                @@You_were_specify@@ :
                <br />

                <table cellspacing="0" cellpadding="5" border="0">
                    <tr><td> </td></tr>
                    <tr>
                        <td width="15%">
                            <br />
                            @@title@@ :
                            <br />
                        </td>
                        <td>
                            <br />
                            <xsl:value-of select="notification_data/title"/>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            @@callNumber@@  :
                            <br />
                        </td>
                        <td>
                            <br />
                            <xsl:value-of select="notification_data/poline_inventory/call_number"/>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            @@message@@	:
                            <br />
                        </td>
                        <td>
                            <br />
                            <xsl:choose>
                                <xsl:when test="notification_data/message = 'Item was received.'">
                                    The above item is now in available.
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="notification_data/message"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td>
                            <br/>
                            <xsl:choose>
                                <xsl:when test="notification_data/message = 'Order was Cancelled.'">
                                    If you requested a film from Kanopy, the license will expire soon. If it is still needed you will need to <a href="https://www.kanopy.com/en/csufresno/search">submit a new request</a>.
                                </xsl:when>
                                <xsl:otherwise>
                                    The above item(s) have arrived in the library and will be available within 7 days. If the item(s) are not available within 7 days, please feel free to Contact Us.
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <br/>
                            [ <xsl:value-of  select="notification_data/trial/status"/> ]
                            <br/>
                            <br/>
                        </td>
                    </tr>
                    <tr>
                        <td> @@sincerely@@ </td>
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
                        <td>&#40;559&#41; 278&#45;2551</td>
                    </tr>
                </table>
                
                <xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
                
                <xsl:call-template name="myAccount" />
                <xsl:call-template name="contactUs" />
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>