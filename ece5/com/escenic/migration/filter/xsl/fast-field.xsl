<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://xmlns.escenic.com/2009/import"
                xmlns:i="http://xmlns.escenic.com/2009/import"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xsi i">

    <xsl:output indent="yes" encoding="UTF-8" version="1.0"/>

    <xsl:template match="i:section">
        <xsl:copy-of select="current()"/>
    </xsl:template>

    <xsl:template match="i:content">
        <content>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="*[not(name()='field')]"/>
            <xsl:for-each select="i:field">
              <xsl:choose>
                <xsl:when test="@name='FASTSEARCHKEYWORDS'">
                  <field name="FASTSEARCHKEYWORDS">
                    <xsl:call-template name="cleanUpFirstField">
                        <xsl:with-param name="fieldValue" select="current()"/>
                    </xsl:call-template>
                  </field>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:copy-of select="current()"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:for-each>
        </content>
    </xsl:template>

    <xsl:template match="i:frontpage">
        <xsl:copy-of select="current()"/>
    </xsl:template>

    <xsl:template match="i:escenic">
        <escenic version="2.0">
            <xsl:apply-templates/>
        </escenic>
    </xsl:template>

    <xsl:template match="*[namespace-uri() = '']">
        <xsl:element name="{local-name()}" namespace="http://xmlns.escenic.com/2009/import">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*">
        <xsl:element name="{local-name()}" namespace="{namespace-uri()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template name="cleanUpFirstField">
        <xsl:param name="fieldValue"/>
        <xsl:choose>
            <xsl:when test="contains($fieldValue,';')">
                <xsl:call-template name="printPlayerName">
                    <xsl:with-param name="playerInfo" select="substring-before($fieldValue,';')"/>
                </xsl:call-template>
                <xsl:call-template name="cleanUpFirstField">
                    <xsl:with-param name="fieldValue" select="substring-after($fieldValue,';')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="printPlayerName">
                    <xsl:with-param name="playerInfo" select="$fieldValue"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="printPlayerName">
        <xsl:param name="playerInfo"/>
        <xsl:choose>
            <xsl:when test="contains($playerInfo,'|')">
                <xsl:value-of select="substring-before($playerInfo,'|')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$playerInfo"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>;</xsl:text>
    </xsl:template>

</xsl:stylesheet>