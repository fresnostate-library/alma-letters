<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />

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
                        <xsl:for-each select="notification_data">
                        <h3>Dear&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,</h3>
                        </xsl:for-each>

        <div class="messageArea">
        <div class="messageBody">


            <table cellspacing="0" cellpadding="5" border="0">
                <tr>
                <td>
                    <b>@@inform_loaned_items@@</b>
<xsl:for-each select="notification_data">
<xsl:variable name="libraryname" select="/notification_data/organization_unit/name"></xsl:variable>
<xsl:if test = " $libraryname = 'LOCKERS' "> 
    <p style="font-family: Arial; font-weight: bold; color: red; "> 
IMPORTANT: You will be receiving an email shortly from Luxer Lockers with directions on how to pick up your item(s) from the Library Lockers. Your item(s) will be held for 7 days in the locker. If not picked up within 7 days, the item(s) will be removed from your account.
    </p>
</xsl:if>
</xsl:for-each>
                </td>
                </tr>

                <tr>
                  <td>
                    <b>@@loans@@</b>
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
                                    <td colspan="6">
                                        <h3><xsl:value-of select="organization_unit/name" /></h3>
                                    </td>
                                </tr>
                                <tr>
                                    <th>@@title@@</th>
                                    <th>@@author@@</th>
                                    <th>@@loan_date@@</th>
                                    <th>@@due_date@@</th>
                                    <th>@@library@@</th>
                                    <th>@@description@@</th>
                                </tr>

                                <xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
                                    <tr>
                                        <td><xsl:value-of select="title"/></td>
                                        <td><xsl:value-of select="author"/></td>
                                        <td><xsl:value-of select="loan_date"/></td>
                                        <td><xsl:value-of select="new_due_date_str"/></td>
                                        <td><xsl:value-of select="library_name"/></td>
                                        <td><xsl:value-of select="description"/></td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                    </tr>
                    <hr/><br/>
                </xsl:for-each>
                <br />
            </table>

            <table>
                        <tr><td><a href="https://library.fresnostate.edu/about/policies/material-loan-policy"><b>Loan Policy</b></a></td></tr>
                        <tr><td>Patrons are financially responsible for fines accrued as well as any replacement or repair costs if an item is lost or damaged. </td></tr>
<br />

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
