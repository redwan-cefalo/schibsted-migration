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

        <xsl:if test="i:field[@name = 'FACTTITLE']">
            <content type="factbox">
                <xsl:attribute name="keep-last-modified">
                    <xsl:value-of select="@keep-last-modified"/>
                </xsl:attribute>
                <xsl:attribute name="source">
                    <xsl:value-of select="@source"/><xsl:text>-factbox</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="sourceid">
                    <xsl:value-of select="@sourceid"/><xsl:text>-factbox</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="publicationid">
                    <xsl:value-of select="@publicationid"/>
                </xsl:attribute>
                <xsl:attribute name="publicationname">
                    <xsl:value-of select="@publicationname"/>
                </xsl:attribute>
                <xsl:attribute name="state">
                    <xsl:value-of select="@state"/>
                </xsl:attribute>
                <xsl:attribute name="publishdate">
                    <xsl:value-of select="@publishdate"/>
                </xsl:attribute>
                <xsl:attribute name="last-modified">
                    <xsl:value-of select="@last-modified"/>
                </xsl:attribute>
                <xsl:attribute name="first-published">
                    <xsl:value-of select="@first-published"/>
                </xsl:attribute>
                <xsl:attribute name="creationdate">
                    <xsl:value-of select="@creationdate"/>
                </xsl:attribute>
                <xsl:attribute name="statechange">
                    <xsl:value-of select="@statechange"/>
                </xsl:attribute>
                <xsl:attribute name="uid">
                    <xsl:value-of select="@uid"/>
                </xsl:attribute>

                <priority>
                    <xsl:value-of select="i:priority"/>
                </priority>

                <xsl:for-each select="i:section">
                    <xsl:copy-of select="current()"/>
                </xsl:for-each>

                <xsl:copy-of select="i:author"/>
                <xsl:copy-of select="i:creator"/>

                <xsl:copy-of select="i:field[@name='FACTTITLE']"/>
                <xsl:copy-of select="i:field[@name='FACTDESCRIPTION']"/>
                <xsl:copy-of select="i:field[@name='FACTLIST']"/>
            </content>
        </xsl:if>

        <xsl:if test="i:field[@name = 'XSTREAMID']">
            <content type="video">
                <xsl:attribute name="keep-last-modified">
                    <xsl:value-of select="@keep-last-modified"/>
                </xsl:attribute>
                <xsl:attribute name="source">
                    <xsl:value-of select="@source"/><xsl:text>-xstream</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="sourceid">
                    <xsl:value-of select="i:field[@name='XSTREAMID']"/>
                </xsl:attribute>
                <xsl:attribute name="publicationid">
                    <xsl:value-of select="@publicationid"/>
                </xsl:attribute>
                <xsl:attribute name="publicationname">
                    <xsl:value-of select="@publicationname"/>
                </xsl:attribute>
                <xsl:attribute name="state">
                    <xsl:value-of select="@state"/>
                </xsl:attribute>
                <xsl:attribute name="publishdate">
                    <xsl:value-of select="@publishdate"/>
                </xsl:attribute>
                <xsl:attribute name="last-modified">
                    <xsl:value-of select="@last-modified"/>
                </xsl:attribute>
                <xsl:attribute name="first-published">
                    <xsl:value-of select="@first-published"/>
                </xsl:attribute>
                <xsl:attribute name="creationdate">
                    <xsl:value-of select="@creationdate"/>
                </xsl:attribute>
                <xsl:attribute name="statechange">
                    <xsl:value-of select="@statechange"/>
                </xsl:attribute>
                <xsl:attribute name="uid">
                    <xsl:value-of select="@uid"/>
                </xsl:attribute>

                <priority>
                    <xsl:value-of select="i:priority"/>
                </priority>

                <xsl:for-each select="i:section">
                    <xsl:copy-of select="current()"/>
                </xsl:for-each>

                <xsl:copy-of select="i:author"/>
                <xsl:copy-of select="i:creator"/>

                <xsl:copy-of select="i:field[@name='TITLE']"/>
            </content>
        </xsl:if>

        <content>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="keep-last-modified">
                <xsl:value-of select="@keep-last-modified"/>
            </xsl:attribute>
            <xsl:attribute name="source">
                <xsl:value-of select="@source"/>
            </xsl:attribute>
            <xsl:attribute name="sourceid">
                <xsl:value-of select="@sourceid"/>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="publicationid">
                <xsl:value-of select="@publicationid"/>
            </xsl:attribute>
            <xsl:attribute name="publicationname">
                <xsl:value-of select="@publicationname"/>
            </xsl:attribute>
            <xsl:attribute name="state">
                <xsl:value-of select="@state"/>
            </xsl:attribute>
            <xsl:attribute name="publishdate">
                <xsl:value-of select="@publishdate"/>
            </xsl:attribute>
            <xsl:attribute name="last-modified">
                <xsl:value-of select="@last-modified"/>
            </xsl:attribute>
            <xsl:attribute name="first-published">
                <xsl:value-of select="@first-published"/>
            </xsl:attribute>
            <xsl:attribute name="creationdate">
                <xsl:value-of select="@creationdate"/>
            </xsl:attribute>
            <xsl:attribute name="statechange">
                <xsl:value-of select="@statechange"/>
            </xsl:attribute>
            <xsl:attribute name="uid">
                <xsl:value-of select="@uid"/>
            </xsl:attribute>

            <priority>
                <xsl:value-of select="i:priority"/>
            </priority>
            <uri>
                <xsl:attribute name="use-as-default">
                    <xsl:value-of select="i:uri/@use-as-default"/>
                </xsl:attribute>
                <xsl:value-of select="i:uri"/>
            </uri>

            <xsl:for-each select="i:section">
                <xsl:copy-of select="current()"/>
            </xsl:for-each>

            <xsl:for-each select="i:relation">
                <!--<xsl:copy-of select="current()"/>-->
                <relation>
                    <xsl:attribute name="source">
                        <xsl:value-of select="@source"/>
                    </xsl:attribute>
                    <xsl:attribute name="sourceid">
                        <xsl:value-of select="@sourceid"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                        <xsl:choose>
                            <xsl:when test="@type = 'FRONTPAGELEADTEXT_RELATED'">TEASERREL</xsl:when>
                            <xsl:when test="@type = 'TITLE_RELATED'">TOPREL</xsl:when>
                            <xsl:when test="@type = 'LEADTEXT_RELATED'">LEADTEXTREL</xsl:when>
                            <xsl:when test="@type = 'BODYTEXT'">BODYREL</xsl:when>
                            <xsl:when test="@type = 'BODYTEXT_RELATED'">BODYREL</xsl:when>
                            <xsl:when test="@type = 'BODY_RELATED'">BODYREL</xsl:when>
                            <xsl:when test="@type = 'RELATED'">PAGEREL</xsl:when>
                            <xsl:when test="@type = 'ALBUM'">CAROUSELREL</xsl:when>
                            <xsl:otherwise>PAGEREL</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:for-each select="i:field">
                          <xsl:choose>
                            <xsl:when test="@name='ALIGNMENT' or @name='alignment'">
                                    <xsl:if  test="current()/* = 'left' or current()/* = 'LEFT' or current()/* = 'right' or current()/* = 'RIGHT' or current()/* = 'center' or current()/* = 'CENTER'">
                                        <xsl:copy-of select="current()"/>
                                    </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="current()"/>
                            </xsl:otherwise>
                          </xsl:choose>
                    </xsl:for-each>
                </relation>
            </xsl:for-each>
            <xsl:if test="i:field[@name = 'FACTTITLE']">
                <relation type="PAGEREL">
                    <xsl:attribute name="sourceid">
                        <xsl:value-of select="@sourceid"/><xsl:text>-factbox</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="source">
                        <xsl:value-of select="@source"/><xsl:text>-factbox</xsl:text>
                    </xsl:attribute>
                    <field name="alignment">
                        <value>left</value>
                    </field>
                </relation>
            </xsl:if>
            <xsl:if test="i:field[@name = 'XSTREAMID']">
                <relation type="TOPREL">
                    <xsl:attribute name="sourceid">
                        <xsl:value-of select="i:field[@name='XSTREAMID']"/>
                    </xsl:attribute>
                    <xsl:attribute name="source">
                        <xsl:value-of select="@source"/><xsl:text>-xstream</xsl:text>
                    </xsl:attribute>
                    <field name="alignment">
                        <value>left</value>
                    </field>
                </relation>
            </xsl:if>
            <xsl:copy-of select="i:author"/>
            <xsl:copy-of select="i:creator"/>

            <xsl:for-each select="i:field">
                <xsl:choose>
                    <xsl:when test="@name='SCORE'">
                        <field name="SCORE">
                          <xsl:value-of select="current()/*"/>
                        </field>
                    </xsl:when>
                    <xsl:when test="@name='NOBYLINE'">
                        <field name="NOBYLINE">
                            <xsl:choose>
                                <xsl:when test="current() = 'true'">
                                    <xsl:text>false</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>true</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </field>
                    </xsl:when>
                    <xsl:when test="@name='ALLOWDEBATE'">
                        <field name="ALLOWDEBATE">
                            <xsl:choose>
                                <xsl:when test="current() = 'false'">
                                    <xsl:text>false</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>true</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </field>
                    </xsl:when>
                    <xsl:when test="@name='LATITUDE'">
                        <xsl:copy-of select="current()"/>
                        <field name="COM.ESCENIC.GEOCODE">
                            <xsl:variable name="address">
                                <xsl:value-of select="//i:field[@name = 'LOCATIONNAME']"/>
                            </xsl:variable>
                            <xsl:variable name="description">
                                <xsl:value-of select="//i:field[@name = 'CAPTION']"/>
                            </xsl:variable>
                            <xsl:variable name="latitude">
                                <xsl:value-of select="//i:field[@name = 'LATITUDE']"/>
                            </xsl:variable>
                            <xsl:variable name="longitude">
                                <xsl:value-of select="//i:field[@name = 'LONGITUDE']"/>
                            </xsl:variable>
                              <xsl:text>&lt;?xml version="1.0" encoding="utf-8"?&gt;
           &lt;kml xmlns="http://www.opengis.net/kml/2.2"&gt;&lt;Document&gt;&lt;Placemark&gt;&lt;address&gt;</xsl:text><xsl:value-of
                                select="$address"/><xsl:text>&lt;/address&gt;&lt;description&gt;</xsl:text><xsl:value-of
                                select="$description"/><xsl:text>&lt;/description&gt;&lt;ExtendedData&gt;&lt;Data name="accuracy"&gt;&lt;value&gt;0&lt;/value&gt;&lt;/Data&gt;&lt;/ExtendedData&gt;&lt;Point&gt;&lt;coordinates&gt;</xsl:text><xsl:value-of
                                select="$longitude"/><xsl:text>,</xsl:text><xsl:value-of select="$latitude"/><xsl:text>&lt;/coordinates&gt;&lt;/Point&gt;&lt;/Placemark&gt;&lt;/Document&gt;&lt;/kml&gt;</xsl:text>
                        </field>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:copy-of select="current()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:if test="@type = 'review' and i:field[@name = 'REVIEWTYPE']/* != ''">
                <xsl:variable name="reviewTag">
                    <xsl:text>tag:reviewtype.polaris.no,2011:</xsl:text><xsl:value-of select="i:field[@name = 'REVIEWTYPE']/*"/>
                </xsl:variable>
                <tag>
                    <xsl:attribute name="identifier">
                        <xsl:value-of select="$reviewTag"/>
                    </xsl:attribute>
                </tag>
            </xsl:if>
            <xsl:if test="@type = 'review' and i:field[@name = 'PLATFORM']/* != ''">
                <xsl:variable name="platfromTrim">
                  <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="i:field[@name = 'PLATFORM']/*" />
                    <xsl:with-param name="replace" select="' '" />
                    <xsl:with-param name="by" select="''" />
                  </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="platformTag">
                    <xsl:text>tag:platform.polaris.no,2011:</xsl:text><xsl:value-of select="$platfromTrim"/>
                </xsl:variable>
                <tag>
                    <xsl:attribute name="identifier">
                        <xsl:value-of select="$platformTag"/>
                    </xsl:attribute>
                </tag>
            </xsl:if>
        </content>
    </xsl:template>
    <xsl:template match="i:frontpage">
        <frontpage>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="layoutname">
                <xsl:value-of select="@layoutname"/>
            </xsl:attribute>
            <xsl:attribute name="replaceactive">
                <xsl:value-of select="@replaceactive"/>
            </xsl:attribute>
            <xsl:attribute name="creationdate">
                <xsl:value-of select="@creationdate"/>
            </xsl:attribute>
            <xsl:attribute name="activatedate">
                <xsl:value-of select="@activatedate"/>
            </xsl:attribute>
            <xsl:attribute name="sortrule">
                <xsl:value-of select="@sortrule"/>
            </xsl:attribute>
            <xsl:attribute name="source">
                <xsl:value-of select="@source"/>
            </xsl:attribute>
            <xsl:attribute name="sourceid">
                <xsl:value-of select="@sourceid"/>
            </xsl:attribute>
            <xsl:attribute name="sectionuniquename">
                <xsl:value-of select="@sectionuniquename"/>
            </xsl:attribute>
            <xsl:attribute name="sectionname">
                <xsl:value-of select="@sectionname"/>
            </xsl:attribute>
            <xsl:attribute name="last-modified">
                <xsl:value-of select="@last-modified"/>
            </xsl:attribute>
            <xsl:attribute name="uid">
                <xsl:value-of select="@uid"/>
            </xsl:attribute>
        </frontpage>
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

    <xsl:template name="string-replace-all">
      <xsl:param name="text" />
      <xsl:param name="replace" />
      <xsl:param name="by" />
      <xsl:choose>
        <xsl:when test="contains($text, $replace)">
          <xsl:value-of select="substring-before($text,$replace)" />
          <xsl:value-of select="$by" />
          <xsl:call-template name="string-replace-all">
            <xsl:with-param name="text"
            select="substring-after($text,$replace)" />
            <xsl:with-param name="replace" select="$replace" />
            <xsl:with-param name="by" select="$by" />
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$text" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>
</xsl:stylesheet>