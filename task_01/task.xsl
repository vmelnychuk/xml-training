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
			<xsl:when test="@type != ''">
				<div class="{@type}">
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
			<xsl:when test="@type = 'num' and following-sibling::h1">
				<xsl:apply-templates select="h1" />
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

	<xsl:template match="para" mode="withH1">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="h1">
		<xsl:choose>
			<xsl:when test="preceding-sibling::para/@type = 'num'">
				<h1>
					<xsl:apply-templates select="../para" mode="withH1" />
					<xsl:apply-templates />
				</h1>
			</xsl:when>
			<xsl:when test="following-sibling::h2 and following-sibling::subheading">
				<h1>
					<xsl:apply-templates />
				</h1>
				<xsl:apply-templates select="../subheading" mode="withH1" />
			</xsl:when>
			<xsl:otherwise>
				<h1>
					<xsl:apply-templates />
				</h1>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="h2">
		<h2>
			<xsl:apply-templates />
		</h2>
	</xsl:template>
	
	<xsl:template match="subheading" mode="withH1">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="subheading">
	</xsl:template>

	<xsl:template match="image">
		<img src="{concat('img/',@source)}" alt="{@description}" />
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
