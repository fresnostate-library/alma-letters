<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />

<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:template name="id-info">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'//')"/>
   <xsl:variable name="rest" select="substring-after($line,'//')"/>
    <xsl:if test="$first = '' and $rest = '' ">
          <!--br/-->
      </xsl:if>
   <xsl:if test="$rest != ''">
       <xsl:value-of select="$rest"/><br/>
   </xsl:if>
   <xsl:if test="$rest = ''">
       <xsl:value-of select="$line"/><br/>
   </xsl:if>

</xsl:template>

  <xsl:template name="id-info-hdr">
        <xsl:call-template name="id-info">
            <xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            <xsl:with-param name="label" select="'Bibliographic Information:'"/>
         </xsl:call-template>
</xsl:template>

<xsl:template match="/">

      <xsl:choose>
         <xsl:when test="notification_data/group_qualifier=''">

	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->



			<div class="messageArea">
				<div class="messageBody">
					 <table cellspacing="0" cellpadding="5" border="0">


						<tr>
							<td>
								<b>@@supplied_to@@: </b>
								<xsl:value-of select="notification_data/partner_name"/>
							</td>
						</tr>


						<tr>
			                <td>
			                  <b>@@borrower_reference@@: </b>
			                   <xsl:call-template name="id-info-hdr"/>
			                </td>
			              </tr>



			          <tr>
							  <td><b>@@my_id@@: </b><img src="externalId.png" alt="externalId" /></td>
				      </tr>

						<tr>
							<td>
								<b>@@format@@: </b>
								<xsl:value-of select="notification_data/incoming_request/format"/>
							</td>
						</tr>

						<xsl:if  test="notification_data/incoming_request/needed_by_dummy/full_date" >
							<tr>
								<td>
									<b>@@date_needed_by@@: </b>
									<xsl:value-of select="notification_data/incoming_request/needed_by"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/note" >
							<tr>
								<td>
									<b>@@request_note@@: </b>
									<xsl:value-of select="notification_data/incoming_request/note"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/requester_email" >
							<tr>
								<td>
									<b>@@requester_email@@: </b>
									<xsl:value-of select="notification_data/incoming_request/requester_email"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/assignee != ''" >
							<tr>
								<td>
									<b>@@assignee@@: </b>
									<xsl:value-of select="notification_data/assignee"/>
								</td>
							</tr>
						</xsl:if>

								<xsl:if test="notification_data/level_of_service !=''">
									<tr>
										<td>
											<b>@@level_of_service@@: </b>
											<xsl:value-of select="notification_data/level_of_service"/>
										</td>

									</tr>
								</xsl:if>

						<xsl:for-each select="notification_data/items/physical_item_display_for_printing">
							<br></br>

							<tr>
							  <td><b>@@item_barcode@@: </b><img src="cid:{concat(concat('Barcode',position()),'.png')}" alt="{concat('Barcode',position())}" /></td>
							</tr>

							<tr>
								<td><xsl:value-of select="title"/></td>
							</tr>

							<tr>
								<td>
									<b>@@library@@: </b>
									<xsl:value-of select="library_name"/>
								</td>
							</tr>

							<tr>
								<td><b>@@location@@: </b><xsl:value-of select="location_name"/></td>
							</tr>

							<xsl:if  test="call_number" >
								<tr>
									<td style="font-size:20px"><b>@@call_number@@: </b><xsl:value-of select="call_number"/></td>
								</tr>
							</xsl:if>

							<xsl:if  test="shelving_location/string" >
								<tr>
									<td><b>@@shelving_location_for_item@@: </b>
									 <xsl:for-each select="shelving_location/string">
										<xsl:value-of select="."/>
									 &#160;
									 </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</table>
				</div>
			</div>


</body>
</html>

         </xsl:when>
         <xsl:otherwise>
            <html>
               <xsl:if test="notification_data/languages/string">
                  <xsl:attribute name="lang">
                     <xsl:value-of select="notification_data/languages/string" />
                  </xsl:attribute>
               </xsl:if>
               <head>
                  <title>
                     <xsl:value-of select="notification_data/general_data/subject" />
                  </title>
               </head>
               <div class="messageArea">
                  <div class="messageBody">
                     <tr>
                        <td style="font-size:18px">

                              <strong>
                                 <xsl:value-of select="notification_data/partner_name" />
                              </strong>

                        </td>
                     </tr>
                     <xsl:if test="notification_data/incoming_request/format='PHYSICAL' ">
                        <tr>
                           <td>
                              <br />
                           </td>
                        </tr>
                        <xsl:if test="not(notification_data/pod_name='')">
                           <tr>
                              <td>
                                 <b>Pod: </b>
                                 <xsl:value-of select="notification_data/pod_name" />
                              </td>
                           </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_code='RapidILL'">
                           <tr>
                              <td>
                                 <b>Pod: RapidR</b>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:if>
                     <tr>
                        <td />
                     </tr>
                     <xsl:choose>
                        <xsl:when test="(notification_data/pod_name='California State Network')">
                           <tr>
                              <td>
                                 <center>
                                    <img src="https://ispiecsu.files.wordpress.com/2023/03/csu-plus-small.png" alt="CSU Plus Logo" />
                                 </center>
                              </td>
                           </tr>
                        </xsl:when>
                        <xsl:when test="(notification_data/pod_name='West Coast Courier Pod')">
                           <tr>
                              <td>
                                 <center>
                                    <img src="https://ispiecsu.files.wordpress.com/2023/08/west-coast-small-3.png" alt="West Coast Courier Logo" />
                                 </center>
                              </td>
                           </tr>
                        </xsl:when>	
                        <xsl:when test="(notification_data/pod_name='West Coast Pending Pod')">
                           <tr>
                              <td>
                                 <center>
                                    <img src="https://ispiecsu.files.wordpress.com/2023/08/west-coast-small-3.png" alt="West Coast Courier Logo" />
                                 </center>
                              </td>
                           </tr>
                        </xsl:when>							
                        <xsl:otherwise>
                           <tr>
                              <td>
                                 <center>
                                    <img src="https://ispiecsu.files.wordpress.com/2023/03/fresno-1.png" alt="Lending Library Logo" />
                                 </center>
                              </td>
                           </tr>
                        </xsl:otherwise>
                     </xsl:choose>
                     <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                        <!--Book-->
                        <xsl:if test="notification_data/incoming_request/format='PHYSICAL' ">
                           <tr>
                              <td>
                                 <b>Title: </b>
                                 <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                              </td>
                           </tr>
                           <xsl:if test="not(notification_data/metadata/author='')">
                              <tr>
                                 <td>
                                    <b>Author: </b>
                                    <xsl:value-of select="substring(notification_data/metadata/author, 1, 100)" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="not(notification_data/metadata/volume='')">
                              <tr>
                                 <td>
                                    <b>@@volume@@: </b>
                                    <xsl:value-of select="notification_data/metadata/volume" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <b>@@location@@: </b>

                                    <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />

                              </td>
                           </tr>
                           <tr>
                              <td style="font-size:20px">
                                 <b>@@call_number@@: </b>

                                    <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />

                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <br />
                              </td>
                           </tr>
                           <br />
                           <xsl:if test="notification_data/group_qualifier != ''">
                              <tr>
                                 <td>
                                    <img src="cid:group_qualifier.png" alt="group_qualifier" />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <br />
                              </td>
                           </tr>
                           <xsl:if test="notification_data/incoming_request/rapido_allow_renew= 'false'">
                              <tr>
                                 <td style="font-size:20px">
                                    <font color="red">NO RENEWALS</font>
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <b>
                                    <xsl:text>Note:__________________________________________</xsl:text>
                                 </b>
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <b>
                                    <xsl:text>_______________________________________________</xsl:text>
                                 </b>
                                 <br />
                                 <br />
                              </td>
                           </tr>
                           <xsl:choose>
                               <xsl:when test="(notification_data/pod_name='California State Network')">
                                 <!-- Home Library -->
                                 <xsl:if test="(notification_data/organization_unit/description='Fresno State')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Supplied By</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/fresno-1.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                                 <!-- Borrowing Libraries Start -->
                                 <!-- Bakersfield -->
                                 <xsl:if test="(notification_data/partner_name='CSU Bakersfield - CSUB Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/bakersfield.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Channel Islands -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Channel Islands - John Spoor Broome Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/channel-islands.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Chico -->
                                 <xsl:if test="(notification_data/partner_name='CSU, Chico - Meriam Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/chico-2.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Dominguez Hills -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Dominguez Hills - University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/dominguez-hills.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- East Bay -->
                                 <xsl:if test="(notification_data/partner_name='California State University, East Bay - Hayward')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/east-bay.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Fresno -->
                                 <xsl:if test="(notification_data/partner_name='Fresno State - FRESNO STATE MAIN')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/fresno-1.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Fullerton -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Fullerton - Pollak Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/fullerton-23.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Humboldt -->
                                 <xsl:if test="(notification_data/partner_name='Cal Poly Humboldt - Humboldt State University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/humboldt.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Long Beach -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Long Beach - University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/long-beach.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Los Angeles -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Los Angeles - John F Kennedy Memorial Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/los-angeles.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Maritime -->
                                 <xsl:if test="(notification_data/partner_name='Cal Maritime - California Maritime Academy Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/maritime.jpg" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Monterey Bay -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Monterey Bay - CSU Monterey Bay Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/monterey-bay.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Moss Landing -->
                                 <xsl:if test="(notification_data/partner_name='California State University Moss Landing Marine Laboratories - MLML/MBARI Research Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/moss-landing.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Northridge -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Northridge - Interlibrary Loan')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/northridge-2.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Pomona -->
                                 <xsl:if test="(notification_data/partner_name='California State Polytechnic University Pomona - Cal Poly Pomona University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/pomona.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Sacramento -->
                                 <xsl:if test="(notification_data/partner_name='Sacramento State - University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/sacramento.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Bernardino -->
                                 <xsl:if test="(notification_data/partner_name='California State University, San Bernardino')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/csusb_logo_23pt.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Diego -->
                                 <xsl:if test="(notification_data/partner_name='San Diego State University Library - SDSU Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/san-diego.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Francisco -->
                                 <xsl:if test="(notification_data/partner_name='San Francisco State University - Main Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/san-francisco.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Jose -->
                                 <xsl:if test="(notification_data/partner_name='San Jose State University - SJSU Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/san-jose-2.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Luis Obispo -->
                                 <xsl:if test="(notification_data/partner_name='Cal Poly University San Luis Obispo - Robert E. Kennedy Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/san-luis-obispo-2.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- San Marcos -->
                                 <xsl:if test="(notification_data/partner_name='California State University San Marcos - Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/san-marcos.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!--Sonoma -->
                                 <xsl:if test="(notification_data/partner_name='Sonoma State University - University Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/sonoma-1.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <!-- Stanislaus -->
                                 <xsl:if test="(notification_data/partner_name='California State University, Stanislaus - CSU Stanislaus Library')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/stanislaus-1.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                              </xsl:when>
                              <xsl:otherwise>
                                 <xsl:choose>
<xsl:when test="contains(notification_data/group_qualifier, '01STMARYSCA')">
                                 <!-- Home Campus -->
                                 <xsl:if test="(notification_data/organization_unit/description='Fresno State')">
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Supplied By</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/03/fresno-1.png" />
                                          </center>
                                       </td>
                                    </tr>
                                 </xsl:if>
                                 <tr>
                                    <td>
                                       <br />
                                    </td>
                                 </tr>
                                 <!-- Saint Marys -->
                                    <tr>
                                       <td>
                                          <center>
                                             <b>Delivered To</b>
                                          </center>
                                          <center>
                                             <img src="https://ispiecsu.files.wordpress.com/2023/05/saint-marys-1.png" />
                                          </center>
                                       </td>
                                    </tr>
</xsl:when>
                                    <xsl:when test="(notification_data/partner_code='RapidILL')">
                                    <tr>
                                       <td>                                          
                                             <b>@@Title@@: </b>
                                             <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                                             <br />
                                             <b>@@external_identifier@@: </b>
                                             <xsl:value-of select="notification_data/group_qualifier" />
                                       </td>
                                    </tr>
                                             <table cellspacing="0" cellpadding="0" border="1">
                                                <tr>
                                                   <td style="font-size:16px;width:350px">
                                                      <font size="2">Return To: </font>
                                                      <br />
                                                      <br />
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address1" />
                                                         </b>
                                                      </center>
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address2" />
                                                         </b>
                                                      </center>
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address3" />
                                                         </b>
                                                      </center>
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address4" />
                                                         </b>
                                                      </center>
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address5" />
                                                         </b>
                                                      </center>
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/city" />
                                                            <xsl:text>, </xsl:text>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/state" />
                                                            <xsl:text />
                                                            <xsl:text> </xsl:text>
                                                            <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/postal_code" />
                                                         </b>
                                                      </center>
                                                      <br />
                                                   </td>
                                                </tr>
<xsl:choose>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='California State Univ., Fullerton')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Pollak Library – Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>California State University, Fullerton</b>
                                                         </center>
                                                         <center>
                                                            <b>PO Box 4150</b>
                                                         </center>
                                                         <center>
                                                            <b>800 N. State College Blvd.</b>
                                                         </center>
                                                         <center>
                                                            <b>Fullerton, CA 92834-4150</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
                                                <xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Delaware')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>University of Delaware Library</b>
                                                         </center>
                                                         <center>
                                                            <b>181 South College Avenue</b>
                                                         </center>
                                                         <center>
                                                            <b>Newark, DE  19717-5267</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
 </xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Albion College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Albion College Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>602 E. Cass St.</b>
                                                         </center>
                                                         <center>
                                                            <b>Albion, MI 49224</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Bethel University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>Bethel University Library</b>
                                                         </center>
                                                         <center>
                                                            <b>3900 Bethel Drive</b>
                                                         </center>
                                                         <center>
                                                            <b>St. Paul, MN 55112</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Boston University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Boston University</b>
                                                         </center>
                                                         <center>
                                                            <b>Mugar Memorial Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan Dept</b>
                                                         </center>
                                                         <center>
                                                            <b>771 Commonwealth Ave</b>
                                                         </center>
                                                         <center>
                                                            <b>Boston, MA 02215-1401</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Bowdoin College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>BBH-Bowdoin College Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>5 College Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Brunswick, ME 04011-8421 US</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Claremont Colleges')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Claremont College Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Attn: Resource Sharing</b>
                                                         </center>
                                                         <center>
                                                            <b>800 N Dartmouth Ave</b>
                                                         </center>
                                                         <center>
                                                            <b>Claremont, CA  91711</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Colby College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Colby College Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>5124 Mayflower Hill Road</b>
                                                         </center>
                                                         <center>
                                                            <b>Waterville, ME 04901</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Colorado State University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>Colorado State University Morgan Library</b>
                                                         </center>
                                                         <center>
                                                            <b>200 West Lake Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Fort Collins, CO 80523</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Columbia University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Delivery Services Staff</b>
                                                         </center>
                                                         <center>
                                                            <b>106 Butler Library</b>
                                                         </center>
                                                         <center>
                                                            <b>535 West 114th St</b>
                                                         </center>
                                                         <center>
                                                            <b>New York, NY 10027</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Dickinson College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Dickinson College Library - ILL</b>
                                                         </center>
                                                         <center>
                                                            <b>28 N. College St.</b>
                                                         </center>
                                                         <center>
                                                            <b>Carlisle, PA 17013</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='George Fox University Library')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>George Fox University</b>
                                                         </center>
                                                         <center>
                                                            <b>Murdock Library - ILL</b>
                                                         </center>
                                                         <center>
                                                            <b>416 N. Meridian Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Newberg, OR 97132</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Georgetown University Medical Center')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Attn: Eugennie Buckley</b>
                                                         </center>
                                                         <center>
                                                            <b>Dahlgren Memorial Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Georgetown University Medical Center</b>
                                                         </center>
                                                         <center>
                                                            <b>Preclinical Science Building RM-GM7</b>
                                                         </center>
                                                         <center>
                                                            <b>3900 Reservoir Road NW</b>
                                                         </center>
                                                         <center>
                                                            <b>Washington DC 20007</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Hobart and William Smith Colleges')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Hobart and William Smith Colleges</b>
                                                         </center>
                                                         <center>
                                                            <b>Warren Hunting Smith Library</b>
                                                         </center>
                                                         <center>
                                                            <b>334 Pulteney Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Geneva, NY 14456</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Lafayette College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Lafayette College</b>
                                                         </center>
                                                         <center>
                                                            <b>Skillman Library - ILL</b>
                                                         </center>
                                                         <center>
                                                            <b>710 Sullivan Road</b>
                                                         </center>
                                                         <center>
                                                            <b>Easton, PA  18042</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Lehigh University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Lehigh University Interlibrary Loan Dept</b>
                                                         </center>
                                                         <center>
                                                            <b>Fairchild Martindale Library</b>
                                                         </center>
                                                         <center>
                                                            <b>8 A East Packer Avenue</b>
                                                         </center>
                                                         <center>
                                                            <b>Bethlehem, PA 18015</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Middlebury College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Davis Family Library-Middlebury College</b>
                                                         </center>
                                                         <center>
                                                            <b>110 Storrs Avenue</b>
                                                         </center>
                                                         <center>
                                                            <b>Middlebury,  Vermont   US   05753</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Millersville University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>ILL, McNairy Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Millersville University</b>
                                                         </center>
                                                         <center>
                                                            <b>9 N George St</b>
                                                         </center>
                                                         <center>
                                                            <b>Millersville, PA 17551</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='New York University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>NYU Bobst Library</b>
                                                         </center>
                                                         <center>
                                                            <b>ATTN: ILL, Room LL2-33</b>
                                                         </center>
                                                         <center>
                                                            <b>70 Washington Square South</b>
                                                         </center>
                                                         <center>
                                                            <b>New York, NY 10012</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Occidental College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>CCO - Occidental College</b>
                                                         </center>
                                                         <center>
                                                            <b>Library - Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>1600 Campus Road</b>
                                                         </center>
                                                         <center>
                                                            <b>Mail Stop M-10</b>
                                                         </center>
                                                         <center>
                                                            <b>Los Angeles, CA 90041-3314</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Oregon State University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>ILL</b>
                                                         </center>
                                                         <center>
                                                            <b>121 The Valley Library</b>
                                                         </center>
                                                         <center>
                                                            <b>201 SW Waldo Pl</b>
                                                         </center>
                                                         <center>
                                                            <b>Corvallis, Or 97331-4501</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Pace Univ. - Mortola Library')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Edward and Doris Mortola Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Pace University</b>
                                                         </center>
                                                         <center>
                                                            <b>861 Bedford Rd.</b>
                                                         </center>
                                                         <center>
                                                            <b>Pleasantville, NY 10570</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Pace Univ., Birnbaum Library')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Henry Birnbaum Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Pace University</b>
                                                         </center>
                                                         <center>
                                                            <b>One Pace Plaza</b>
                                                         </center>
                                                         <center>
                                                            <b>New York, NY 10038</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Ramapo College of New Jersey')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>George T. Potter Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Ramapo College of New Jersey</b>
                                                         </center>
                                                         <center>
                                                            <b>505 Ramapo Valley Road</b>
                                                         </center>
                                                         <center>
                                                            <b>Mahwah, NJ 07430</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Rensselaer Polytechnic Institute')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Folsom Library, Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>Rensselaer Polytechnic Institute</b>
                                                         </center>
                                                         <center>
                                                            <b>110 8th Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Troy, NY 12180-3590</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Susquehanna University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Susquehanna University</b>
                                                         </center>
                                                         <center>
                                                            <b>Blough-Weis Library</b>
                                                         </center>
                                                         <center>
                                                            <b>514 University Ave.</b>
                                                         </center>
                                                         <center>
                                                            <b>Selinsgrove, PA  17870</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Texas Tech University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Document Delivery Department</b>
                                                         </center>
                                                         <center>
                                                            <b>Texas Tech University Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>18th and Boston</b>
                                                         </center>
                                                         <center>
                                                            <b>P.O. Box 40002</b>
                                                         </center>
                                                         <center>
                                                            <b>Lubbock, TX 79409</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='The College of New Jersey')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>TCNJ Library</b>
                                                         </center>
                                                         <center>
                                                            <b>2000 Pennington RD</b>
                                                         </center>
                                                         <center>
                                                            <b>Ewing, NJ 08628-0718</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Trinity College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan Office</b>
                                                         </center>
                                                         <center>
                                                            <b>Trinity College Library</b>
                                                         </center>
                                                         <center>
                                                            <b>300 Summit St.</b>
                                                         </center>
                                                         <center>
                                                            <b>Hartford, CT 06106-3100</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Tufts Univ, Hirsh Health Sciences Lib.')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Tufts University</b>
                                                         </center>
                                                         <center>
                                                            <b>Hirsh Health Sciences Library/ILL</b>
                                                         </center>
                                                         <center>
                                                            <b>MEB 610</b>
                                                         </center>
                                                         <center>
                                                            <b>37 Tyler Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Boston, MA 02111</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Tufts University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Tufts University</b>
                                                         </center>
                                                         <center>
                                                            <b>Tisch Library/Document Delivery Services</b>
                                                         </center>
                                                         <center>
                                                            <b>35 Professors Row</b>
                                                         </center>
                                                         <center>
                                                            <b>Medford, MA 02155 US</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Univ. of Texas, Austin')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>UT Libraries - Interlibrary Services</b>
                                                         </center>
                                                         <center>
                                                            <b>101 E 21st STOP S5463</b>
                                                         </center>
                                                         <center>
                                                            <b>First Floor Dock</b>
                                                         </center>
                                                         <center>
                                                            <b>Austin, TX 78712-1492</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Univ. of MD Baltimore Health Sciences Library')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Health Sciences and Human Services Library</b>
                                                         </center>
                                                         <center>
                                                            <b>University of Maryland, Baltimore</b>
                                                         </center>
                                                         <center>
                                                            <b>Resource Sharing Department-3rd Floor</b>
                                                         </center>
                                                         <center>
                                                            <b>601 W. Lombard St.</b>
                                                         </center>
                                                         <center>
                                                            <b>Baltimore, MD 21201</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University at Albany, SUNY')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>UAlbany Interlibrary Loan Dept.</b>
                                                         </center>
                                                         <center>
                                                            <b>University Library RM 125</b>
                                                         </center>
                                                         <center>
                                                            <b>1400 Washington Ave.</b>
                                                         </center>
                                                         <center>
                                                            <b>Albany, NY 12222</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University at Buffalo, SUNY')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University at Buffalo, Univ. Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>ATTN: Delivery Services</b>
                                                         </center>
                                                         <center>
                                                            <b>235 Lockwood Library</b>
                                                         </center>
                                                         <center>
                                                            <b>Buffalo, NY 14260-2200</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Alabama')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University of Alabama Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>Gorgas Library/ILL RM #2007</b>
                                                         </center>
                                                         <center>
                                                            <b>711 Capstone Drive</b>
                                                         </center>
                                                         <center>
                                                            <b>Box 870266</b>
                                                         </center>
                                                         <center>
                                                            <b>Tuscaloosa, AL  35487-0266</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Arkansas Libraries')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University of Arkansas Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan Department MULN</b>
                                                         </center>
                                                         <center>
                                                            <b>365 N. McIlroy Ave.</b>
                                                         </center>
                                                         <center>
                                                            <b>Fayetteville, AR 72701</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Connecticut')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan Office (U-1005F)</b>
                                                         </center>
                                                         <center>
                                                            <b>Homer Babbidge Library Univ of CT</b>
                                                         </center>
                                                         <center>
                                                            <b>369 Fairfield Way</b>
                                                         </center>
                                                         <center>
                                                            <b>Storrs, CT 06269</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Missouri-Kansas City')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>UMKC Libraries Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>800 East 51st Street, 1st floor</b>
                                                         </center>
                                                         <center>
                                                            <b>Kansas City, MO 64110</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of New Hampshire')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University of New Hampshire</b>
                                                         </center>
                                                         <center>
                                                            <b>Dimond Library - Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>18 Library Way</b>
                                                         </center>
                                                         <center>
                                                            <b>Durham, NH 03824</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Pennsylvania')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>PAU - Van Pelt Library</b>
                                                         </center>
                                                         <center>
                                                            <b>ILL Dept., University of Pennsylvania</b>
                                                         </center>
                                                         <center>
                                                            <b>3420 Walnut Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Philadelphia, PA 19104-6277 US</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Vermont')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University of Vermont</b>
                                                         </center>
                                                         <center>
                                                            <b>Interlibrary Loan Department</b>
                                                         </center>
                                                         <center>
                                                            <b>Howe Memorial Library</b>
                                                         </center>
                                                         <center>
                                                            <b>538 Main Street</b>
                                                         </center>
                                                         <center>
                                                            <b>Burlington, VT 05405</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='University of Wyoming')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>University of Wyoming Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>Dept. 3334</b>
                                                         </center>
                                                         <center>
                                                            <b>1000 E. University Ave.</b>
                                                         </center>
                                                         <center>
                                                            <b>Laramie, WY 82071</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='West Virginia University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>WVU-Evansdale Campus Library</b>
                                                         </center>
                                                         <center>
                                                            <b>3 Evansdale Drive</b>
                                                         </center>
                                                         <center>
                                                            <b>Morgantown, WV 26506-6105 US</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Wichita State University')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan</b>
                                                         </center>
                                                         <center>
                                                            <b>Wichita State University</b>
                                                         </center>
                                                         <center>
                                                            <b>Ablah Library/Room 119</b>
                                                         </center>
                                                         <center>
                                                            <b>1845 Fairmount Box 68</b>
                                                         </center>
                                                         <center>
                                                            <b>Wichita, Kansas 67260-0068</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:when test="(notification_data/incoming_request/borrowing_institution='Williams College')">
                                                   <tr>
                                                      <td style="font-size:18px;width:350px">
                                                         <font size="2">Ship To: </font>
                                                         <br />
                                                         <br />
                                                         <center>
                                                            <b>Interlibrary Loan Department</b>
                                                         </center>
                                                         <center>
                                                            <b>Williams College Libraries</b>
                                                         </center>
                                                         <center>
                                                            <b>26 Hopkins Hall Drive</b>
                                                         </center>
                                                         <center>
                                                            <b>Williamstown, MA 01267</b>
                                                         </center>
                                                         <br />
                                                      </td>
                                                   </tr>
</xsl:when>
<xsl:otherwise>
                                                <tr>
                                                   <td style="font-size:18px;width:350px">
                                                      <font size="2">Ship To: </font>
                                                      <br />
                                                      <br />
                                                      <center>
                                                         <b>
                                                            <xsl:value-of select="notification_data/incoming_request/contact_address" />
                                                         </b>
                                                      </center>
                                                      <br />
                                                   </td>
                                                </tr>
</xsl:otherwise>
                           </xsl:choose>
                                             </table>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <b>@@Title@@: </b>
                                       <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                                       <br />
                                       <b>@@external_identifier@@: </b>
                                       <xsl:value-of select="notification_data/group_qualifier" />
                                       <table cellspacing="0" cellpadding="0" border="1">
                                          <tr>
                                             <td style="font-size:16px;width:350px">
                                                <font size="2">Return To: </font>
                                                <br />
                                                <br />
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address1" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address2" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address3" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address4" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/address5" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/city" />
                                                      <xsl:text>, </xsl:text>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/state" />
                                                      <xsl:text />
                                                      <xsl:text> </xsl:text>
                                                      <xsl:value-of select="notification_data/items/physical_item_display_for_printing/owning_library_details/postal_code" />
                                                   </b>
                                                </center>
                                                <br />
                                             </td>
                                          </tr>
                                          <tr>
                                             <td style="font-size:18px;width:350px">
                                                <font size="2">Ship To: </font>
                                                <br />
                                                <br />
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/partner_name" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/line1" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/line2" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/line3" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/line4" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/line5" />
                                                   </b>
                                                </center>
                                                <center>
                                                   <b>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/city" />
                                                      <xsl:text>, </xsl:text>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/state_province" />
                                                      <xsl:text />
                                                      <xsl:text> </xsl:text>
                                                      <xsl:value-of select="notification_data/borrowing_library_address/postal_code" />
                                                   </b>
                                                </center>
                                                <br />
                                             </td>
                                          </tr>
                                       </table>
                                    </xsl:otherwise>
                                 </xsl:choose>
                              </xsl:otherwise>
                           </xsl:choose>
                        </xsl:if>
                        <!--Article-->
                        <xsl:if test="notification_data/incoming_request/format='DIGITAL' ">
                           <xsl:if test="notification_data/metadata/material_type='Article' ">
                              <xsl:if test="notification_data/partner_name">
                                 <tr>
                                    <td>
                                       <img src="cid:externalId.png" alt="externalId" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td />
                              </tr>
                              <xsl:if test="not(notification_data/metadata/journal_title='')">
                                 <tr>
                                    <td>
                                       <b>@@journal_title@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/journal_title, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/normalized_title='')">
                                 <tr>
                                    <td>
                                       <b>Article: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/normalized_title, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>
                                    <b>Author: </b>
                                    <xsl:value-of select="substring(notification_data/metadata/author, 1, 100)" />
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                              <xsl:if test="not(notification_data/metadata/publication_date='')">
                                 <tr>
                                    <td>
                                       <b>@@year@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/publication_date" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/volume='')">
                                 <tr>
                                    <td>
                                       <b>@@volume@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/volume" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/issue='')">
                                 <tr>
                                    <td>
                                       <b>@@issue@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/issue" />
                                    </td>
                                 </tr>
                              </xsl:if>

                                 <tr>
                                    <td>
                                       <b>@@pages@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/pages" />
                                    </td>
                                 </tr>

                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                              <xsl:if test="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number">
                                 <tr>
                                    <td style="font-size:20px">
                                       <b>@@call_number@@: </b>
                                       <xsl:text />

                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name">
                                 <tr>
                                    <td>
                                       <b>@@location@@: </b>
                                       <xsl:text />

                                          <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />

                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="(notification_data/items='')">
                                 <tr>
                                    <td style="font-size:20px">

                                          <xsl:text>ELECTRONIC</xsl:text>

                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>

                           </xsl:if>
                           <!--Book Chapter-->
                           <xsl:if test="notification_data/metadata/material_type='Book' ">
                              <xsl:if test="notification_data/partner_name">
                                 <tr>
                                    <td>
                                       <img src="cid:externalId.png" alt="externalId" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                              <xsl:if test="not(notification_data/metadata/title='')">
                                 <tr>
                                    <td>
                                       <b>Title: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/title, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/chapter='')">
                                 <tr>
                                    <td>
                                       <b>@@chapter_title@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/chapter, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/chapter_title='')">
                                 <tr>
                                    <td>
                                       <b>@@chapter_title@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/chapter_title, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/metadata/chapter_author='')">
                                 <tr>
                                    <td>
                                       <b>@@chapter_author@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="substring(notification_data/metadata/chapter_author, 1, 100)" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td />
                              </tr>
                              <xsl:if test="not(notification_data/metadata/volume='')">
                                 <tr>
                                    <td>
                                       <b>@@volume@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/volume" />
                                    </td>
                                 </tr>
                              </xsl:if>
                              <xsl:if test="not(notification_data/items/physical_item_display_for_printing/publication_date='')">
                                 <tr>
                                    <td>
                                       <b>@@year@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/publication_date" />
                                    </td>
                                 </tr>
                              </xsl:if>

                                 <tr>
                                    <td>
                                       <b>@@pages@@: </b>
                                       <xsl:text />
                                       <xsl:value-of select="notification_data/metadata/pages" />
                                    </td>
                                 </tr>

                              <tr>
                                 <td />
                              </tr>
                              <tr>
                                 <td style="font-size:20px">
                                    <b>@@call_number@@: </b>
                                    <xsl:text />

                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/call_number" />

                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <b>@@location@@: </b>
                                    <xsl:text />

                                       <xsl:value-of select="notification_data/items/physical_item_display_for_printing/available_items/available_item/location_name" />

                                 </td>
                              </tr>
                              <xsl:if test="(notification_data/items='')">
                                 <tr>
                                    <td style="font-size:20px">

                                          <xsl:text>ELECTRONIC</xsl:text>

                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    <br />
                                 </td>
                              </tr>
                           </xsl:if>
                           <tr>
                              <td>
                                 <br />
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <font size="1">The copyright law of the United States (Title 17, United States Code), governs the making of photocopies or other reproductions of copyrighted material. Under certain conditions specified in the law, libraries and archives are authorized to furnish a photocopy or other reproduction. One of these specified conditions is that the photocopy or reproduction is not to be "used for any purpose other than private study, scholarship, or research." If a user makes a request for, or later uses, a photocopy or reproduction for purposes in excess of "fair use," that user may be liable for copyright infringement. This institution reserves the right to refuse to accept a copying order, if, in its judgment, fulfillment of the order would involve violation of copyright law.</font>
                              </td>
                           </tr>
                        </xsl:if>
                     </table>
                  </div>
               </div>
            </html>
         </xsl:otherwise>
      </xsl:choose>

	</xsl:template>
</xsl:stylesheet>