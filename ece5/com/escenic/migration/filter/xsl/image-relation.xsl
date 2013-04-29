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
            <xsl:copy-of select="*[not(name()='relation')]"/>
            <xsl:for-each select="i:relation">
                <relation>
                    <xsl:attribute name="source">
                        <xsl:value-of select="@source"/>
                    </xsl:attribute>
                    <xsl:attribute name="sourceid">
                        <xsl:value-of select="@sourceid"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:choose>
                            <xsl:when test="@source = 'escenic-v4-image' or @source = 'escenic-v4-media'">
                                <xsl:choose>
                                    <xsl:when test="@type = 'LEADTEXT_RELATED'">TEASERREL</xsl:when>
                                    <xsl:otherwise>TOPMEDIAREL</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="@source = 'escenic-v4-link'">
                                <xsl:choose>
                                    <xsl:when test="@type = 'LEADTEXT_RELATED'">TEASERREL</xsl:when>
                                    <xsl:otherwise>STORYREL</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="@source = 'escenic-migration'">
                                <xsl:choose>
                                    <xsl:when test="@type = 'LEADTEXT_RELATED'">TEASERREL</xsl:when>
                                    <xsl:otherwise>STORYREL</xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="@type"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:for-each select="i:field">
                        <xsl:choose>
                            <!--ALIGNMENT field is not available in summary -->
                            <xsl:when test="@name='ALIGNMENT' or @name='alignment'">
<!--
                                <xsl:if  test="current()/* = 'left' or current()/* = 'LEFT' or current()/* = 'right' or current()/* = 'RIGHT' or current()/* = 'center' or current()/* = 'CENTER'">
                                    <xsl:copy-of select="current()"/>
                                </xsl:if>
-->
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="current()"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </relation>
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