<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document"
	xmlns:wkfinder="http://www.wkpublisher.com/xml-namespaces/finder"
	xmlns:wkgraphic="http://www.wkpublisher.com/xml-namespaces/graphic"
	xmlns:wkrul="http://www.wkpublisher.com/xml-namespaces/ruling"
	xmlns:wkpractice-aid="http://www.wkpublisher.com/xml-namespaces/practice-aid"
	xmlns:wklink="http://www.wkpublisher.com/xml-namespaces/links"
	xmlns:wkpend-leg="http://www.wkpublisher.com/xml-namespaces/pending-legislation"
	xmlns:wkauth-rule-proc="http://www.wkpublisher.com/xml-namespaces/auth-rule-proc"
	xmlns:wkcase-law="http://www.wkpublisher.com/xml-namespaces/case-law"
	xmlns:wkcom-rep="http://www.wkpublisher.com/xml-namespaces/committee-report"
	xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:wkagency-pub="http://www.wkpublisher.com/xml-namespaces/agency-pub"
	xmlns:wkchange-track="http://www.wkpublisher.com/xml-namespaces/change-tracking"
	xmlns:wkmedia="http://www.wkpublisher.com/xml-namespaces/media"
	xmlns:wkattachment="http://www.wkpublisher.com/xml-namespaces/attachment"
	xmlns:wkform="http://www.wkpublisher.com/xml-namespaces/form"
	xmlns:wknews="http://www.wkpublisher.com/xml-namespaces/news"
	xmlns:wkreg="http://www.wkpublisher.com/xml-namespaces/reg"
	xmlns:wklaw="http://www.wkpublisher.com/xml-namespaces/law"
	xmlns:wkext-meta="http://www.wkpublisher.com/xml-namespaces/extensible-metadata"
	xmlns:wkinternational="http://www.wkpublisher.com/xml-namespaces/international"
	xmlns:wktable="http://www.wkpublisher.com/xml-namespaces/table"
	xmlns:wkperiodical="http://www.wkpublisher.com/xml-namespaces/periodical">
	<xsl:output method="html" version="5.0" encoding="utf-8" />

	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="atlas-document">
		<html>
			<head>
				<title>
					<xsl:text>Task 2</xsl:text>
				</title>
				<link rel="stylesheet" href="css/main.css" />
			</head>
			<body>
			     <xsl:apply-templates />
			</body>
		</html>
		<xsl:text>MY TEST</xsl:text>
	</xsl:template>

	<xsl:template match="document">
		<xsl:text>MY TEST</xsl:text>
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="heading">
		<h1>
			<xsl:apply-templates />
		</h1>
		<xsl:apply-templates />
	</xsl:template>
</xsl:stylesheet>