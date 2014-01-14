<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
   <html>
   <head>
      <title>Event # <xsl:value-of select="/event/@id" /></title>
      <link rel="stylesheet" href="css/main.css" />
   </head>
   <body>
        <h1>Event # <xsl:value-of select="/event/@id" /></h1>
        <xsl:apply-templates select="/event/doc-level" />
   </body>
   </html>
</xsl:template>

<xsl:template match="doc-level">
    <div>
    <!--     <xsl:attribute name="class">
            <xsl:value-of select="/event/doc-level/@type" />
        </xsl:attribute> -->
    <xsl:value-of select="." />
    </div>
</xsl:template>





</xsl:stylesheet>