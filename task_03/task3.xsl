<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title></title>
				<link rel="stylesheet" href="css/main.css" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="slide">
		<div class="slide">
			<xsl:apply-templates />
			 <div class="slide-number"><xsl:value-of select="@number" /></div>
		</div>
	</xsl:template>
	<xsl:template match="title">
		<div class="slide-title">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<xsl:template match="content">
		<div class="slide-content">
			<xsl:apply-templates />
		</div>
	</xsl:template>
</xsl:stylesheet>