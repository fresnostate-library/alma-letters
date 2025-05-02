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
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>

				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->

				<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
					<xsl:choose>
						<xsl:when test="notification_data/query_type = 'Type_1_query_name'">
							<tr>
								<td>
									<h3>@@Type_1_header@@</h3>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="notification_data/query_type = 'Type_2_query_name'">
							<tr>
								<td>
									<h3>@@Type_2_header@@</h3>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="notification_data/query_type = 'Type_3_query_name'">
							<tr>
								<td>
									<h3>@@Type_3_header@@</h3>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="notification_data/query_type = 'Type_4_query_name'">
							<tr>
								<td>
									<h3>@@Type_4_header@@</h3>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="notification_data/query_type = 'Type_5_query_name'">
							<tr>
								<td>
									<h3>@@Type_5_header@@</h3>
								</td>
							</tr>
						</xsl:when>
						<xsl:otherwise>
							<tr>
								<td>
									<h3>@@Type_1_header@@</h3>
								</td>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</table>

				<div class="messageArea">
					<div class="messageBody">

						<table role='presentation' >
							<tr>
								<td>@@query_to_patron@@: </td>
							</tr>
							<xsl:choose>
								<xsl:when test="notification_data/query_type = 'Type_1_query_name'">
									<tr>
										<td>@@Type_1_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_1_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_1_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_2_query_name'">
									<tr>
										<td>@@Type_2_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_2_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_2_query_line_3@@</td>
									</tr>
								</xsl:when>

								<xsl:when test="notification_data/query_type = 'Type_3_query_name'">
									<tr>
										<td>@@Type_3_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_3_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_3_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_4_query_name'">
									<tr>
										<td>@@Type_4_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_4_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_4_query_line_3@@</td>
									</tr>
								</xsl:when>                             
								<xsl:when test="notification_data/query_type = 'Type_5_query_name'">
									<tr>
										<td>@@Type_5_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_5_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_5_query_line_3@@</td>
									</tr>
								</xsl:when>                             
								<xsl:when test="notification_data/query_type = 'Type_6_query_name'">
									<tr>
										<td>@@Type_6_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_6_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_6_query_line_3@@</td>
									</tr>
								</xsl:when>                             
								<xsl:when test="notification_data/query_type = 'Type_7_query_name'">
									<tr>
										<td>@@Type_7_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_7_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_7_query_line_3@@</td>
									</tr>
								</xsl:when>                             
								<xsl:when test="notification_data/query_type = 'Type_8_query_name'">
									<tr>
										<td>@@Type_8_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_8_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_8_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_9_query_name'">
									<tr>
										<td>@@Type_9_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_9_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_9_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_10_query_name'">
									<tr>
										<td>@@Type_10_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_10_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_10_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_11_query_name'">
									<tr>
										<td>@@Type_11_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_11_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_11_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_12_query_name'">
									<tr>
										<td>@@Type_12_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_12_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_12_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_13_query_name'">
									<tr>
										<td>@@Type_13_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_13_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_13_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_14_query_name'">
									<tr>
										<td>@@Type_14_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_14_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_14_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_15_query_name'">
									<tr>
										<td>@@Type_15_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_15_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_15_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_16_query_name'">
									<tr>
										<td>@@Type_16_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_16_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_16_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_17_query_name'">
									<tr>
										<td>@@Type_17_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_17_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_17_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_18_query_name'">
									<tr>
										<td>@@Type_18_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_18_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_18_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_19_query_name'">
									<tr>
										<td>@@Type_19_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_19_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_19_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_20_query_name'">
									<tr>
										<td>@@Type_20_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_20_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_20_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_21_query_name'">
									<tr>
										<td>@@Type_21_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_21_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_21_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_22_query_name'">
									<tr>
										<td>@@Type_22_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_22_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_22_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_23_query_name'">
									<tr>
										<td>@@Type_23_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_23_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_23_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_24_query_name'">
									<tr>
										<td>@@Type_24_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_24_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_24_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_25_query_name'">
									<tr>
										<td>@@Type_25_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_25_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_25_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_26_query_name'">
									<tr>
										<td>@@Type_26_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_26_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_26_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_27_query_name'">
									<tr>
										<td>@@Type_27_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_27_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_27_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_28_query_name'">
									<tr>
										<td>@@Type_28_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_28_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_28_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_29_query_name'">
									<tr>
										<td>@@Type_29_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_29_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_29_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:when test="notification_data/query_type = 'Type_30_query_name'">
									<tr>
										<td>@@Type_30_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_30_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_30_query_line_3@@</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td>@@Type_1_query_line_1@@</td>
									</tr>
									<tr>
										<td>@@Type_1_query_line_2@@</td>
									</tr>
									<tr>
										<td>@@Type_1_query_line_3@@</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</table>
						<br />
						<table role='presentation' >
							<xsl:if test="notification_data/query_note !=''">
								<tr>
									<td>
										<strong> @@query_note@@: </strong>
										<xsl:value-of select="notification_data/query_note" />
									</td>
								</tr>
							</xsl:if>
						</table>
						<br />

						<p>Please send your response to <a href="mailto:interlibraryloan@csufresno.edu">interlibraryloan@csufresno.edu</a>.</p>

						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

							<tr>
								<td>
									@@requested@@:

								</td>

							</tr>
						</table>
						<br />
						<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss" />
								<!-- style.xsl -->
							</xsl:attribute>

							<xsl:if test="notification_data/request/display/material_type !=''">
								<tr>
									<td>
										<strong> @@format@@:  </strong>
										<xsl:value-of
											select="notification_data/request/display/material_type" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/title !=''">
								<tr>
									<td>
										<strong> @@title@@: </strong>
										<xsl:value-of select="notification_data/request/display/title" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/journal_title !=''">
								<tr>
									<td>
										<strong> @@journal_title@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/journal_title" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/author !=''">
								<tr>
									<td>
										<strong> @@author@@: </strong>
										<xsl:value-of select="notification_data/request/display/author" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/autho_initials !=''">
								<tr>
									<td>
										<strong> @@author_initials@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/autho_initials" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/publisher !=''">
								<tr>
									<td>
										<strong> @@publisher@@: </strong>
										<xsl:value-of select="notification_data/request/display/publisher" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if
								test="notification_data/request/display/place_of_publication !=''">
								<tr>
									<td>
										<strong> @@place_of_publication@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/place_of_publication" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/publication_date !=''">
								<tr>
									<td>
										<strong> @@publication_date@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/publication_date" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/year !=''">
								<tr>
									<td>
										<strong> @@year@@: </strong>
										<xsl:value-of select="notification_data/request/display/year" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/edition !=''">
								<tr>
									<td>
										<strong> @@edition@@: </strong>
										<xsl:value-of select="notification_data/request/display/edition" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/call_number !=''">
								<tr>
									<td>
										<strong> @@call_number@@: </strong>
										<xsl:value-of select="notification_data/request/display/call_number" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume !=''">
								<tr>
									<td>
										<strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/request/display/volume" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issue !=''">
								<tr>
									<td>
										<strong> @@issue@@: </strong>
										<xsl:value-of select="notification_data/request/display/issue" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if
								test="notification_data/request/display/additional_person_name !=''">
								<tr>
									<td>
										<strong> @@additional_person_name@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/additional_person_name" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/source !=''">
								<tr>
									<td>
										<strong> @@source@@: </strong>
										<xsl:value-of select="notification_data/request/display/source" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if
								test="notification_data/request/display/series_title_number !=''">
								<tr>
									<td>
										<strong> @@series_title_number@@: </strong>
										<xsl:value-of
											select="notification_data/request/display/series_title_number" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/isbn !=''">
								<tr>
									<td>
										<strong> @@isbn@@: </strong>
										<xsl:value-of select="notification_data/request/display/isbn" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issn !=''">
								<tr>
									<td>
										<strong> @@issn@@: </strong>
										<xsl:value-of select="notification_data/request/display/issn" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/doi !=''">
								<tr>
									<td>
										<strong> @@doi@@: </strong>
										<xsl:value-of select="notification_data/request/display/doi" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/pmid !=''">
								<tr>
									<td>
										<strong> @@pmid@@: </strong>
										<xsl:value-of select="notification_data/request/display/pmid" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/note !=''">
								<tr>
									<td>
										<strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/request/display/note" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/chapter !=''">
								<tr>
									<td>
										<strong> @@chapter@@: </strong>
										<xsl:value-of select="notification_data/request/display/chapter" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume_bk !=''">
								<tr>
									<td>
										<strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/request/display/volume_bk" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/part !=''">
								<tr>
									<td>
										<strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/request/display/part" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/pages !=''">
								<tr>
									<td>
										<strong> @@pages@@: </strong>
										<xsl:value-of select="notification_data/request/display/pages" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/start_page !=''">
								<tr>
									<td>
										<strong> @@start_page@@: </strong>
										<xsl:value-of select="notification_data/request/display/start_page" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/end_page !=''">
								<tr>
									<td>
										<strong> @@end_page@@: </strong>
										<xsl:value-of select="notification_data/request/display/end_page" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note !=''">
								<tr>
									<td>
										<strong> @@request_note@@: </strong>
										<xsl:value-of select="notification_data/request/note" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/general_data/current_date !=''">
								<tr>
									<td>
										<strong> @@date@@: </strong>
										<xsl:value-of select="notification_data/general_data/current_date" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/external_request_id !=''">
								<tr>
									<td>
										<strong> @@request_id@@: </strong>
										<xsl:value-of select="notification_data/request/external_request_id" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/format_display !=''">
								<tr>
									<td>
										<strong> @@request_format@@: </strong>
										<xsl:value-of select="notification_data/request/format_display" />
										<!-- recordTitle.xsl -->
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/max_fee !=''">
								<tr>
									<td>
										<strong>@@maximum_fee@@: </strong>
										<xsl:value-of select="notification_data/request/max_fee" />
									</td>

								</tr>
							</xsl:if>
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
				<xsl:call-template name="lastFooter" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
