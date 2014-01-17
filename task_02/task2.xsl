<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document"
	xmlns:xhtml="http://www.w3.org/1999/xhtml">

	<xsl:output method="html" version="5.0" indent="yes"
		encoding="utf-8" />

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="/atlas-document/@id" />
				</title>
				<link rel="stylesheet" href="css/main.css" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>

	</xsl:template>
	<xsl:template match="wkdoc:document">
		<div class="document">
			<xsl:comment>
				begin of document
			</xsl:comment>
			<xsl:apply-templates />
		</div>
		<xsl:comment>
			end of document
		</xsl:comment>
	</xsl:template>
	<xsl:template match="heading">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>
	<xsl:template match="wkdoc:level">
		<div class="level">
			<xsl:comment>
				begin of level
			</xsl:comment>
			<xsl:apply-templates />
		</div>
		<xsl:comment>
			end of level
		</xsl:comment>
	</xsl:template>
	<xsl:template match="para">
		<p>
			<xsl:if test="@align">
				<xsl:attribute name="align"> <xsl:value-of select="@align" /> </xsl:attribute>
			</xsl:if>
			<xsl:apply-templates />
		</p>
	</xsl:template>
	<xsl:template match="anchor">
		<a>
			<xsl:attribute name="href">  <xsl:value-of
				select="@id" /> </xsl:attribute>
			<xsl:apply-templates />
		</a>
	</xsl:template>

	<xsl:template match="cite-ref">
		<a class="cite">
			<xsl:attribute name="href"> <xsl:value-of select="concat('#', @id)" /> </xsl:attribute>
			<xsl:apply-templates />
		</a>
	</xsl:template>

	<xsl:template match="italic">
		<i>
			<xsl:apply-templates />
		</i>
	</xsl:template>
	<xsl:template match="bold">
		<b>
			<xsl:apply-templates />
		</b>
	</xsl:template>
	<xsl:template match="xhtml:table">
		<xsl:comment>
			begin of table
		</xsl:comment>
		<table>
			<xsl:if test="@cellspacing">
				<xsl:attribute name="cellspacing"><xsl:value-of select="@cellspacing" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@cellpadding">
				<xsl:attribute name="cellpadding"><xsl:value-of select="@cellpadding" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@width">
				<xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@border">
				<xsl:attribute name="border"><xsl:value-of select="@border" /></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates />
		</table>
		<xsl:comment>
			end of table
		</xsl:comment>
	</xsl:template>
	<xsl:template match="xhtml:colgroup">
		<colgroup>
			<xsl:apply-templates />
		</colgroup>
	</xsl:template>
	<xsl:template match="xhtml:col">
		<col>
			<xsl:attribute name="span"><xsl:value-of select="@span" /></xsl:attribute>
			<xsl:if test="@width">
				<xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute>
			</xsl:if>
		</col>
	</xsl:template>
	<xsl:template match="xhtml:tr">
		<tr>
			<xsl:apply-templates />
		</tr>
	</xsl:template>
	<xsl:template match="xhtml:td">
		<td>
			<xsl:if test="@valign">
				<xsl:attribute name="valign"><xsl:value-of select="@valign" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@align">
				<xsl:attribute name="align"><xsl:value-of select="@align" /></xsl:attribute>
			</xsl:if>
			<xsl:if test="@style">
				<xsl:if test="contains(@style, 'nowrap:true')">
					<xsl:attribute name="style"><xsl:text>white-space: nowrap</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="contains(@style, 'width')">
					<xsl:attribute name="width">
                <xsl:value-of
						select="substring-before(substring-after( @style,'width:'),';')" />
            </xsl:attribute>
				</xsl:if>
			</xsl:if>
			<xsl:apply-templates />
		</td>
	</xsl:template>
	<xsl:template match="note">
		<div class="note">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<xsl:template match="h1">
		<h1>
			<xsl:apply-templates />
		</h1>
	</xsl:template>
	<xsl:template match="unordered-list">
		<ul>
			<xsl:apply-templates />
		</ul>
	</xsl:template>
	<xsl:template match="list-item">
		<li>
			<xsl:apply-templates />
		</li>
	</xsl:template>
	<xsl:template match="footnote">
		<a class="tooltip">
			<xsl:attribute name="href"><xsl:text>#</xsl:text></xsl:attribute>
			<sup>
				<xsl:value-of select="@num" />
			</sup>
				<span>
					<xsl:apply-templates />
				</span>
		</a>
	</xsl:template>
</xsl:stylesheet>