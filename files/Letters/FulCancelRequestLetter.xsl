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
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<br />
						<xsl:for-each select="notification_data">
						Dear&#160;<xsl:value-of select="receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="receivers/receiver/user/last_name"/>,
						</xsl:for-each>

				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="0" border="0">
<tr><td>&#160;</td></tr>
							<tr>
								<td>
									@@on@@
									<xsl:value-of select="notification_data/general_data/current_date" />
									@@we_cancel_y_req_of@@
									<xsl:value-of select="notification_data/request/create_date" />
									@@detailed_below@@:

								</td>
							</tr>
<tr><td>&#160;</td></tr>
							<tr>
								<td>
									<span style="font-weight:bold">
									<xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
									</span>
								</td>
							</tr>




							<!-- <xsl:if test="notification_data/metadata/title != ''">
								<tr>
									<td>
										<b>@@title@@: </b>
										<xsl:value-of select="notification_data/metadata/title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/journal_title != ''">
								<tr>
									<td>
										<b> @@journal_title@@: </b>
										<xsl:value-of select="notification_data/metadata/journal_title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author != ''">
								<tr>
									<td>
										<b> @@author@@: </b>
										<xsl:value-of select="notification_data/metadata/author" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author_initials != ''">
								<tr>
									<td>
										<b>@@author_initials@@: </b>
										<xsl:value-of select="notification_data/metadata/author_initials" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/edition != ''">
								<tr>
									<td>
										<b> @@edition@@: </b>
										<xsl:value-of select="notification_data/metadata/edition" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/identifier != ''">
								<tr>
									<td>
										<b>@@identifier@@: </b>
										<xsl:value-of select="notification_data/metadata/identifier" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/lccn != ''">
								<tr>
									<td>
										<b> @@lccn@@: </b>
										<xsl:value-of select="notification_data/metadata/lccn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issn != ''">
								<tr>
									<td>
										<b>@@issn@@: </b>
										<xsl:value-of select="notification_data/metadata/issn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/isbn != ''">
								<tr>
									<td>
										<b> @@isbn@@: </b>
										<xsl:value-of select="notification_data/metadata/isbn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/oclc_nr != ''">
								<tr>
									<td>
										<b> @@oclc_nr@@: </b>
										<xsl:value-of select="notification_data/metadata/oclc_nr" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/doi != ''">
								<tr>
									<td>
										<b>@@doi@@: </b>
										<xsl:value-of select="notification_data/metadata/doi" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pmid != ''">
								<tr>
									<td>
										<b> @@pmid@@: </b>
										<xsl:value-of select="notification_data/metadata/pmid" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publisher != ''">
								<tr>
									<td>
										<b> @@publisher@@: </b>
										<xsl:value-of select="notification_data/metadata/publisher" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publication_date != ''">
								<tr>
									<td>
										<b>@@publication_date@@: </b>
										<xsl:value-of select="notification_data/metadata/publication_date" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/place_of_publication != ''">
								<tr>
									<td>
										<b> @@place_of_publication@@: </b>
										<xsl:value-of select="notification_data/metadata/place_of_publication" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/additional_person_name != ''">
								<tr>
									<td>
										<b> @@additional_person_name@@: </b>
										<xsl:value-of select="notification_data/metadata/additional_person_name" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/source != ''">
								<tr>
									<td>
										<b>@@source@@: </b>
										<xsl:value-of select="notification_data/metadata/source" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/series_title_number != ''">
								<tr>
									<td>
										<b> @@series_title_number@@: </b>
										<xsl:value-of select="notification_data/metadata/series_title_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/call_number != ''">
								<tr>
									<td>
										<b> @@call_number@@: </b>
										<xsl:value-of select="notification_data/metadata/call_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/volume != ''">
								<tr>
									<td>
										<b>@@volume@@: </b>
										<xsl:value-of select="notification_data/metadata/volume" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/part != ''">
								<tr>
									<td>
										<b> @@part@@: </b>
										<xsl:value-of select="notification_data/metadata/part" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/chapter != ''">
								<tr>
									<td>
										<b> @@chapter@@: </b>
										<xsl:value-of select="notification_data/metadata/chapter" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pages != ''">
								<tr>
									<td>
										<b>@@pages@@: </b>
										<xsl:value-of select="notification_data/metadata/pages" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/start_page != ''">
								<tr>
									<td>
										<b> @@start_page@@: </b>
										<xsl:value-of select="notification_data/metadata/start_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/end_pagee != ''">
								<tr>
									<td>
										<b> @@end_page@@: </b>
										<xsl:value-of select="notification_data/metadata/end_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issue != ''">
								<tr>
									<td>
										<b>@@issue@@: </b>
										<xsl:value-of select="notification_data/metadata/issue" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/note != ''">
								<tr>
									<td>
										<b> @@note@@: </b>
										<xsl:value-of select="notification_data/metadata/note" />
									</td>
								</tr>
							</xsl:if> -->


							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<b> @@start_time@@: </b>
										<xsl:value-of select="notification_data/booking_start_time_str" />
									</td>
								</tr>
							</xsl:if>
						<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<b> @@end_time@@: </b>
										<xsl:value-of select="notification_data/booking_end_time_str" />
									</td>
								</tr>
							</xsl:if>

<table>
  <tr>
   
  </tr>
</table>
						<xsl:if test="notification_data/request/note != ''">

								<tr>
									<td>
										<b> @@request_note@@: </b>
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>
				<br />
							<tr>
								<td>
									<b> @@reason_deleting_request@@: </b>
									<xsl:value-of select="notification_data/request/status_note_display" />
								</td>
							</tr>
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<b> @@request_cancellation_note@@: </b>
										<xsl:value-of select="notification_data/request/cancel_reason" />
									</td>
								</tr>
							</xsl:if>
						</table>
						<br />
						<table>

<xsl:if test="notification_data/request/resource_sharing_request_id != ''">
                                                 <tr>
                                                     <td><xsl:variable name="title">
                                                        <xsl:value-of select="notification_data/phys_item_display/title" />                                                         
                                                    </xsl:variable>
                                                    <xsl:variable name="author">
                                                        <xsl:value-of select="notification_data/phys_item_display/author" />                                                         
                                                    </xsl:variable>
                                               <xsl:variable name="isbn">
                                                        <xsl:value-of select="notification_data/phys_item_display/isbn" />                                                         
                                                    </xsl:variable>

If you would still like to request this material via Interlibrary Loan (7-10 business days) use the following link: <a href="https://fresnostate-illiad-oclc-org.hmlproxy.lib.csufresno.edu/illiad/illiad.dll?Action=10&amp;Form=30&amp;url_ver=z39.88-2004&amp;rfr_id=onesearch&amp;rft_val_fmt=info:ofi/fmt:kev:mtx:book&amp;rft.genre=book&amp;citedin=OneSearch&amp;rft.btitle={$title}&amp;rft.aulast={$author}&amp;rft.isbn={$isbn}">Interlibrary Loan </a>.

<br/><br/>
<b>Please note: Textbooks and required course materials cannot be requested through Interlibrary Loan. </b>
<br/><br/>
Please contact ILL at <a href="mailto:interlibraryloan@csufresno.edu ">interlibraryloan@csufresno.edu</a> if you have any questions regarding this request. 
<br/><br/>
                                             </td></tr>
                                              </xsl:if> 

				<tr><td>@@sincerely@@</td></tr>
<tr><td>&#160;</td></tr>
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
