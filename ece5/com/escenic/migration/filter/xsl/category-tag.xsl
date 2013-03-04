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
                    <field name="TEAMCATEGORY">
                      <xsl:call-template name="teamCategory2tag">
                          <xsl:with-param name="fieldValue" select="current()"/>
                      </xsl:call-template>
                    </field>
                </xsl:when>
                <xsl:when test="@name='LEAGUECATEGORY'">
                    <field name="LEAGUECATEGORY">
                      <xsl:call-template name="leagueCategory2tag">
                          <xsl:with-param name="fieldValue" select="current()"/>
                      </xsl:call-template>
                    </field>
                </xsl:when>
                <xsl:when test="@name='SPORTSCATEGORY'">
                    <field name="SPORTSCATEGORY">
                      <xsl:call-template name="sportsCategory2tag">
                          <xsl:with-param name="fieldValue" select="current()"/>
                      </xsl:call-template>
                    </field>
                </xsl:when>
                <xsl:when test="@name='SPORTTEAMCATEGORY'">
                    <field name="SPORTTEAMCATEGORY">
                      <xsl:call-template name="sportTeamCategory2tag">
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

    <xsl:template name="teamCategory2tag">
        <xsl:param name="fieldValue"/>
        <xsl:choose>
            <xsl:when test="contains($fieldValue,',')">
                <xsl:variable name="singleCat"><xsl:value-of select="substring-before($fieldValue,',')"/></xsl:variable>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/teamCategory/entry[@key=$singleCat]"/><xsl:text>"; </xsl:text>
                <xsl:call-template name="teamCategory2tag">
                    <xsl:with-param name="fieldValue" select="substring-after($fieldValue,',')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/teamCategory/entry[@key=$fieldValue]"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="leagueCategory2tag">
        <xsl:param name="fieldValue"/>
        <xsl:choose>
            <xsl:when test="contains($fieldValue,',')">
                <xsl:variable name="singleCat"><xsl:value-of select="substring-before($fieldValue,',')"/></xsl:variable>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/leagueCategory/entry[@key=$singleCat]"/><xsl:text>"; </xsl:text>
                <xsl:call-template name="leagueCategory2tag">
                    <xsl:with-param name="fieldValue" select="substring-after($fieldValue,',')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/leagueCategory/entry[@key=$fieldValue]"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="sportsCategory2tag">
        <xsl:param name="fieldValue"/>
        <xsl:choose>
            <xsl:when test="contains($fieldValue,',')">
                <xsl:variable name="singleCat"><xsl:value-of select="substring-before($fieldValue,',')"/></xsl:variable>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/sportsCategory/entry[@key=$singleCat]"/><xsl:text>"; </xsl:text>
                <xsl:call-template name="sportsCategory2tag">
                    <xsl:with-param name="fieldValue" select="substring-after($fieldValue,',')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/sportsCategory/entry[@key=$fieldValue]"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="sportTeamCategory2tag">
        <xsl:param name="fieldValue"/>
        <xsl:choose>
            <xsl:when test="contains($fieldValue,',')">
                <xsl:variable name="singleCat"><xsl:value-of select="substring-before($fieldValue,',')"/></xsl:variable>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/sportTeamCategory/entry[@key=$singleCat]"/><xsl:text>"; </xsl:text>
                <xsl:call-template name="sportTeamCategory2tag">
                    <xsl:with-param name="fieldValue" select="substring-after($fieldValue,',')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="document('category-tag.xml')/data/sportTeamCategory/entry[@key=$fieldValue]"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>;</xsl:text>
    </xsl:template>
</xsl:stylesheet>