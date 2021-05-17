<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:exsl="http://exslt.org/common"
                xmlns:x="http://www.tei-c.org/ns/1.0"
                xmlns:tst="https://github.com/tst-project"
                exclude-result-prefixes="x tst">

<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:template name="splitwit">
    <xsl:param name="mss" select="@wit"/>
        <xsl:if test="string-length($mss)">
            <xsl:if test="not($mss=@wit)"><xsl:text> </xsl:text></xsl:if>
            <xsl:element name="span">
                 <xsl:attribute name="class">embedded msid</xsl:attribute>
                 <xsl:attribute name="lang">en</xsl:attribute>
                 <xsl:variable name="msstring" select="substring-before(
                                            concat($mss,' '),
                                          ' ')"/>
                 <xsl:variable name="cleanstr" select="substring-after($msstring,'#')"/>
                 <xsl:apply-templates select="/x:TEI/x:teiHeader/x:fileDesc/x:sourceDesc/x:listWit/x:witness[@xml:id=$cleanstr]/x:idno/node()"/>
            </xsl:element>
            <xsl:call-template name="splitwit">
                <xsl:with-param name="mss" select=
                    "substring-after($mss, ' ')"/>
            </xsl:call-template>
        </xsl:if>
</xsl:template>

<xsl:template match="x:listWit"/>

<xsl:template match="x:text//x:p">
    <div>
        <xsl:attribute name="class">para wide</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        <div>
            <xsl:attribute name="class">text-block</xsl:attribute>
            <xsl:apply-templates/>
        </div>
        <div>
            <xsl:attribute name="class">apparatus-block</xsl:attribute>
            <xsl:call-template name="apparatus"/>
        </div>
    </div>
</xsl:template>

<xsl:template match="x:text//x:lg">
    <div>
        <xsl:attribute name="class">lg wide</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        <div>
            <xsl:attribute name="class">text-block</xsl:attribute>
            <xsl:apply-templates/>
        </div>
        <div>
            <xsl:attribute name="class">apparatus-block</xsl:attribute>
            <xsl:call-template name="apparatus"/>
        </div>
    </div>
</xsl:template>

<xsl:template match="x:lem">
    <span class="lem-inline">
        <xsl:apply-templates/>
    </span>
</xsl:template>
<xsl:template match="x:rdg"/>

<xsl:template name="apparatus">
    <xsl:for-each select=".//x:app">
        <span class="app">
            <xsl:call-template name="lemma"/>
            <xsl:for-each select="x:rdg">
                <xsl:call-template name="reading"/>
            </xsl:for-each>
        </span>
        <xsl:text> </xsl:text>
    </xsl:for-each>
</xsl:template>

<xsl:template name="lemma">
    <span>
        <xsl:attribute name="class">lem</xsl:attribute>
        <xsl:apply-templates select="x:lem/node()"/>
    </span>
    <xsl:if test="x:lem/@wit">
        <span>
            <xsl:attribute name="class">lem-wit</xsl:attribute>
            <xsl:call-template name="splitwit">
                <xsl:with-param name="mss" select="x:lem/@wit"/>
            </xsl:call-template>
        </span>
    </xsl:if>
    <xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="reading">
    <span>
        <xsl:attribute name="class">rdg</xsl:attribute>
        <span>
            <xsl:attribute name="class">rdg-text</xsl:attribute>
            <xsl:apply-templates select="./node()"/>
        </span>
        <xsl:text> </xsl:text>
        <span>
            <xsl:attribute name="class">rdg-wit</xsl:attribute>
            <xsl:call-template name="splitwit"/>
        </span>
    </span>
    <xsl:text> </xsl:text>
</xsl:template>

</xsl:stylesheet>
