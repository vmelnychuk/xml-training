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
        <xsl:apply-templates/>
   </body>
   </html>
</xsl:template>

<xsl:template match="doc-level">
    <div>
    <xsl:value-of select="." />
    </div>
</xsl:template>

<xsl:template match="table">
    <table>
        <thead>
            <tr>
                <xsl:value-of select="/event/table/table-heading"/>
            </tr>
        </thead>
    </table>
</xsl:template>


</xsl:stylesheet>