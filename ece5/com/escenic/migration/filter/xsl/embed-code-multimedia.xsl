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
        <xsl:if test="i:field[@name = 'EMBED-CODE-FOR-LIVE']">
            <content type="multimedia">
                <xsl:copy-of select="@*[not(name() = 'source' or name() = 'id' or name() = 'type')]"/>
                <xsl:attribute name="type">
                    <xsl:text>multimedia</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="source">
                    <xsl:value-of select="@source"/><xsl:text>-embed-code-for-live</xsl:text>
                </xsl:attribute>

                <xsl:copy-of select="*[name()='creator' or name()='author' or name()='section-ref']"/>

                <xsl:copy-of select="i:field[@name='TITLE']"/>
                <field name="HTML">
                    <xsl:copy-of select="i:field[@name='EMBED-CODE-FOR-LIVE']/*"/>
                </field>
                <field name="VIEW">
                    <xsl:text>html</xsl:text>
                </field>
            </content>
        </xsl:if>
        <content>
            <xsl:copy-of select="@*"/>
            <xsl:if test="i:field[@name = 'EMBED-CODE-FOR-LIVE']">
                <relation type="TOPMEDIAREL">
                    <xsl:copy-of select="@sourceid"/>
                    <xsl:attribute name="source">
                        <xsl:value-of select="@source"/><xsl:text>-embed-code-for-live</xsl:text>
                    </xsl:attribute>
                </relation>
            </xsl:if>
            <xsl:copy-of select="*"/>
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