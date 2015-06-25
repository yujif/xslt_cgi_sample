<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
<xsl:element name="keywords">
<xsl:for-each select="/books/item/keywords/keyword">
	<xsl:variable name="posi">
		<xsl:number value="position()" format="1"/>
	</xsl:variable>
	<xsl:if test="not(.=preceding::keyword)">
		<xsl:apply-templates select=".">
			<xsl:with-param name="word" select="text()"/>
			<xsl:with-param name="id" select="$posi"/>
		</xsl:apply-templates>
	</xsl:if>
</xsl:for-each>
</xsl:element>
</xsl:template>

<xsl:template match="keyword">
	<xsl:param name="word"></xsl:param>
	<xsl:param name="id"></xsl:param>
	<xsl:element name="keyword">
		<xsl:attribute name="id">
			<xsl:value-of select="$id"/>
		</xsl:attribute>
		<xsl:element name="word"><xsl:value-of select="$word"/></xsl:element>
		<xsl:element name="count"><xsl:value-of select="count(/books/item[contains(keywords,$word)])"/></xsl:element>
		<xsl:for-each select="keyword[.=$word]">
	  	<xsl:value-of select="."/><br />
		</xsl:for-each>
	</xsl:element>
</xsl:template>
</xsl:stylesheet>
