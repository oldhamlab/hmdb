<?xml version="1.0"?>

<xsl:stylesheet
      version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:my="http://www.hmdb.ca">

  <xsl:template match = "/">
    <hmdb>
      <xsl:for-each select="my:hmdb/my:metabolite">
        <metabolite>
          <accession>
            <xsl:value-of select="my:accession" />
          </accession>
          <name>
            <xsl:value-of select="my:name" />
          </name>
            <xsl:for-each select=".//my:gene_name">
            <protein>
              <xsl:value-of select="." />
            </protein>
            </xsl:for-each>
        </metabolite>
      </xsl:for-each>
    </hmdb>
  </xsl:template>
</xsl:stylesheet>
