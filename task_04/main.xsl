<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:i18n="http://apache.org/cocoon/i18n/2.1" xmlns:wkdoc="http://example.com/wkdoc">

	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" href="default.css" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="wkdoc:document">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="heading">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>
	<xsl:template match="wkdoc:level">
		<div>
			<xsl:copy-of select="@*" />
			<xsl:attribute name="class"><xsl:text>content</xsl:text></xsl:attribute>
			<xsl:apply-templates />
			<xsl:call-template name="footnote-imp" />
		</div>
	</xsl:template>
	<xsl:template match="para">
		<p>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</p>
	</xsl:template>
	<xsl:template match="footnote">
		<a>
			<xsl:attribute name="href"><xsl:value-of select="concat('#', @id)" /></xsl:attribute>
			[
			<xsl:value-of select="@num" />
			]
		</a>
	</xsl:template>
	<xsl:template match="footnote" mode="display">
			<div>
				<xsl:attribute name="class"><xsl:text>footnote-number</xsl:text></xsl:attribute>
				<xsl:value-of select="@num" />
			</div>
			<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="italic">
		<span>
			<xsl:attribute name="class"><xsl:text>italic</xsl:text></xsl:attribute>
			<xsl:apply-templates />
		</span>
	</xsl:template>
	<xsl:template name="footnote-imp">
		<h2>
			<xsl:attribute name="class"><xsl:text>footnotes-header</xsl:text></xsl:attribute>
			<xsl:text>Footnotes</xsl:text>
		</h2>
		<xsl:apply-templates select="//footnote" mode="display" />
	</xsl:template>

	<!-- <xsl:template match="wkdoc:document"> <xsl:apply-templates /> <xsl:call-template 
		name="footnote-imp" /> </xsl:template> <xsl:template match="heading"> <h1> 
		<xsl:attribute name="id"><xsl:text>Main_title</xsl:text></xsl:attribute> 
		<xsl:value-of select="."></xsl:value-of> </h1> </xsl:template> <xsl:template 
		match="wkdoc:level"> <div> <xsl:for-each select="@*"> <xsl:value-of select="name()" 
		/> <xsl:value-of select="." /> </xsl:for-each> <xsl:apply-templates /> </div> 
		</xsl:template> <xsl:template match="para"> <p> <xsl:for-each select="@*"> 
		<xsl:value-of select="name()" /> <xsl:value-of select="." /> </xsl:for-each> 
		<xsl:apply-templates /> </p> </xsl:template> <xsl:template match="footnote"> 
		<a> <xsl:attribute name="href"><xsl:value-of select="concat('#', @id)" /></xsl:attribute> 
		[ <xsl:value-of select="@num" /> ] </a> </xsl:template> <xsl:template name="footnote-imp"> 
		<span> <a> <xsl:attribute name="href"><xsl:value-of select="concat('#', @id)" 
		/></xsl:attribute> </a> </span> <xsl:apply-templates /> </xsl:template> -->
</xsl:stylesheet>

