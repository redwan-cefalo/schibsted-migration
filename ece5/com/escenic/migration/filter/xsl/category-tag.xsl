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
                <xsl:when test="@name='TEAMCATEGORY'">

                </xsl:when>
                <xsl:when test="@name='LEAGUECATEGORY'">

                </xsl:when>
                <xsl:when test="@name='SPORTSCATEGORY'">

                </xsl:when>
                <xsl:when test="@name='SPORTTEAMCATEGORY'">

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


</xsl:stylesheet>