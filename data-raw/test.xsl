<?xml version="1.0"?>

<xsl:stylesheet
      version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:my="http://www.hmdb.ca">

  <xsl:template match = "/my">

      <xsl:for-each select="my:hmdb/my:metabolite">
        <metabolite>
          <accession>
            <xsl:value-of select="accession" />
          </accession>
          <name>
            <xsl:value-of select="name" />
          </name>
            <xsl:for-each select=".//gene_name">
            <protein>
              <xsl:value-of select="." />
            </protein>
            </xsl:for-each>
        </metabolite>
      </xsl:for-each>

  </xsl:template>

</xsl:stylesheet>
