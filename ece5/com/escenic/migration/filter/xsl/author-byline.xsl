<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://xmlns.escenic.com/2009/import"
                xmlns:i="http://xmlns.escenic.com/2009/import"
                xmlns:data="http://xmlns.escenic.com/2009/import"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="xsi i">

    <xsl:output indent="yes" encoding="UTF-8" version="1.0"/>


  <data:map>
    <data:entry key="1082">Doddo</data:entry>
    <data:entry key="1643">Tore Strand</data:entry>
    <data:entry key="1085">Hans Petter Jørgensen</data:entry>
    <data:entry key="1101">Per-Christian Johansen</data:entry>
    <data:entry key="1121">Ola Bernhus</data:entry>
    <data:entry key="1161">Roy Ellingsen</data:entry>
    <data:entry key="1162">Christian Thorkildsen</data:entry>
    <data:entry key="1181">Bertil Valderhaug</data:entry>
    <data:entry key="1182">Ole Kristian Sagbakken</data:entry>
    <data:entry key="1201">Bjarte Valen</data:entry>
    <data:entry key="1281">Lars Tjærnås</data:entry>
    <data:entry key="1282">Knut Skeie Solberg</data:entry>
    <data:entry key="1283">Øivind Holthe</data:entry>
    <data:entry key="1361">Kristian Stenerud</data:entry>
    <data:entry key="1413">Eivind Aarre</data:entry>
    <data:entry key="1441">Knut Dørum Lillebakk</data:entry>
    <data:entry key="1084">Sindre Halkjelsvik</data:entry>
    <data:entry key="1481">Indridi Sigurdsson</data:entry>
    <data:entry key="1521">Nils Chr. Helle</data:entry>
    <data:entry key="1561">Kjetil Kroksæter</data:entry>
    <data:entry key="1641">Anders Pamer</data:entry>
    <data:entry key="1642">Øystein Vik</data:entry>
    <data:entry key="1083">Petter Rasmus</data:entry>
    <data:entry key="1086">Kjetil Kroksæter</data:entry>
    <data:entry key="1087">Bertil Valderhaug</data:entry>
    <data:entry key="1089">Helge Skuseth</data:entry>
    <data:entry key="1090">Stig Nilssen</data:entry>
    <data:entry key="1341">Ola Bernhus</data:entry>
    <data:entry key="1088">Tore Strand</data:entry>
  </data:map>

    <xsl:template match="i:section">
        <xsl:copy-of select="current()"/>
    </xsl:template>

    <xsl:template match="i:content">
        <content>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="*[not(name()='creator' or name()='author')]"/>

            <creator firstname="Redwan" surname="Noor" email="redwan@cefalo.no" username="cefalo_admin"></creator>
            <author firstname="Redwan" surname="Noor" email="redwan@cefalo.no" username="cefalo_admin"></author>

            <field name="BYLINE">
              <xsl:variable name="sectionSourceId">
                <xsl:value-of select="i:section[@homeSection='yes']/@sourceid"/>
              </xsl:variable>
              <xsl:variable name="sectionByLine">
                <xsl:value-of select="document('')/xsl:stylesheet/data:map/data:entry[@key=$sectionSourceId]"/>
              </xsl:variable>

              <xsl:choose>
                <xsl:when test="$sectionByLine">
                  <xsl:value-of select="$sectionByLine"/>
                </xsl:when>
                <xsl:when test="i:author">
                  <xsl:for-each select="i:author">
                    <xsl:if test="position() > 1">,</xsl:if><xsl:value-of select="@firstname"/><xsl:text> </xsl:text><xsl:value-of select="@surname"/>
                  </xsl:for-each>
                </xsl:when>
<!--
                <xsl:when test="i:creator">
                  <xsl:for-each select="i:creator">
                    <xsl:if test="position() > 1">,</xsl:if><xsl:value-of select="@firstname"/><xsl:text> </xsl:text><xsl:value-of select="@surname"/>
                  </xsl:for-each>
                </xsl:when>
-->
                <xsl:otherwise>
                    <xsl:text>100% Sport</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </field>
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