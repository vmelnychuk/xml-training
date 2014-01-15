<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="5.0" encoding="utf-8" />
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="event">
		<html>
			<head>
				<title>
					Event #
					<xsl:value-of select="/event/@id" />
				</title>
				<link rel="stylesheet" href="css/main.css" />
			</head>
			<body>
				<h1>
					Event #
					<xsl:value-of select="/event/@id" />
				</h1>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="doc-level">
		<xsl:choose>
			<xsl:when test="@type = 'redbox'">
				<div class="redbox">
					<xsl:apply-templates />
				</div>
			</xsl:when>
			<xsl:when test="@type = 'bluebox'">
				<div class="bluebox">
					<xsl:apply-templates />
				</div>
			</xsl:when>
			<xsl:when test="@type = 'comment'">
				<div class="comment">
					<xsl:apply-templates />
				</div>
			</xsl:when>
			<xsl:when test="@position">
			     <div class="{@position}">
			         <xsl:apply-templates />
			     </div>
			</xsl:when>
			<xsl:otherwise>
				<div>
					<xsl:apply-templates />
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="para">
		<xsl:choose>
			<xsl:when test="@type = 'num' and following-sibling::*[1]/self::h1">
				<p>
					<h1>
						<xsl:value-of select="num"/> <xsl:value-of select="following-sibling::*[1]" />
					</h1>
				</p>
			</xsl:when>
			<xsl:when test="@type = 'ordered-list'">
				<p>
					<ol>
						<xsl:apply-templates />
					</ol>
				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>
					<xsl:apply-templates />
				</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="image">
	   <img src="{concat('img/',@source)}" alt="{@description}"/>
	</xsl:template>
	<xsl:template match="list-item">
		<li>
			<xsl:apply-templates />
		</li>
	</xsl:template>

	<xsl:template match="table">
		<table>
			<xsl:apply-templates />
		</table>
	</xsl:template>

	<xsl:template match="table-heading">
		<caption class="table-caption">
			<xsl:apply-templates />
		</caption>
	</xsl:template>
	<xsl:template match="table-row">
		<tr>
			<xsl:apply-templates />
		</tr>
	</xsl:template>

	<xsl:template match="table-cell">
		<xsl:choose>
			<xsl:when test="@colspan &gt; '1'">
				<td colspan="{@colspan}">
					<xsl:apply-templates />
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td>
					<xsl:apply-templates />
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
