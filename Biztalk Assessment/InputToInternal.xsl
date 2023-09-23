<?xml version="1.0" encoding="UTF-16"?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:var="http://schemas.microsoft.com/BizTalk/2003/var" exclude-result-prefixes="msxsl var s0" version="1.0" 
xmlns:ns0="http://Biztalk_Assessment.Schema.SalesPerson_Payout" 
xmlns:s0="http://Biztalk_Assessment.Schema.Schema1">
  <xsl:output omit-xml-declaration="yes" method="xml" version="1.0" />
  <xsl:template match="/">
    <xsl:apply-templates select="/s0:Root" />
	
	<ns0:SalesPersonPayout>
            <xsl:variable name="salesPersonID" select="ns0:Root/PersonDetails/SalesPersonID" />
            <xsl:variable name="firstName" select="ns0:Root/PersonDetails/FirstName" />
            <xsl:variable name="lastName" select="ns0:Root/PersonDetails/LastName" />

            <SalePersonPayout>
                <SalesPersonID>
                    <xsl:value-of select="$salesPersonID" />
                </SalesPersonID>
                <FirstName>
                    <xsl:value-of select="$firstName" />
                </FirstName>
                <LastName>
                    <xsl:value-of select="$lastName" />
                </LastName>
                <TotalOrderValue>
                    <xsl:value-of select="sum(ns0:Root/OrderDetails[SalesPersonID = $salesPersonID]/SubTotal)" />
                </TotalOrderValue>
            </SalePersonPayout>
        </ns0:SalesPersonPayout>
	
  </xsl:template>
  <xsl:template match="/s0:Root" />
</xsl:stylesheet>