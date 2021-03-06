<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:exsl="http://exslt.org/common"
                xmlns:x="http://www.tei-c.org/ns/1.0"
                xmlns:tst="https://github.com/tst-project"
                exclude-result-prefixes="x tst">

<xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:template match="tst:entry">
    <xsl:apply-templates/>
</xsl:template>

<!-- definitions -->
<xsl:variable name="defRoot">
<tst:mstypes>
    <tst:entry key="#STM">Single-text manuscript</tst:entry>
    <tst:entry key="#MTM">Multi-text manuscript</tst:entry>
    <tst:entry key="#CM">Composite manuscript</tst:entry>
    <tst:entry key="#MVM">Multi-volume manuscript</tst:entry>
</tst:mstypes>

<tst:materials>
    <tst:entry key="paper">Paper</tst:entry>
    <tst:entry key="paper industrial">Paper (industrial)</tst:entry>
    <tst:entry key="paper handmade">Paper (handmade)</tst:entry>
    <tst:entry key="paper laid">Paper (laid)</tst:entry>
    <tst:entry key="palm-leaf">Palm leaf</tst:entry>
    <tst:entry key="palm-leaf talipot">Palm leaf (talipot)</tst:entry>
    <tst:entry key="palm-leaf palmyra">Palm leaf (palmyra)</tst:entry>
    <tst:entry key="birch-bark">Birch bark</tst:entry>
    <tst:entry key="copper">Copper</tst:entry>
    <tst:entry key="leather">Leather</tst:entry>
</tst:materials>

<tst:decotype>
    <tst:entry key="decorative">decorative</tst:entry>
    <tst:entry key="diagram">diagram</tst:entry>
    <tst:entry key="doodle">doodle</tst:entry>
    <tst:entry key="drawing">drawing</tst:entry>
    <tst:entry key="painting">painting</tst:entry>
    <tst:entry key="table">table</tst:entry>
</tst:decotype>

<tst:subtype>
    <tst:entry key="beginning">beginning</tst:entry>
    <tst:entry key="cover">cover</tst:entry>
    <tst:entry key="detached">detached</tst:entry>
    <tst:entry key="end">end</tst:entry>
    <tst:entry key="flyleaf">flyleaf</tst:entry>
    <tst:entry key="guard-folio">guard folio</tst:entry>
    <tst:entry key="inserted">inserted</tst:entry>
    <tst:entry key="intertextual">intertextual</tst:entry>
    <tst:entry key="marginal">marginal</tst:entry>
    <tst:entry key="running">running</tst:entry>
    <tst:entry key="spine">spine</tst:entry>
    <tst:entry key="title-page">title page</tst:entry>
    <tst:entry key="top">top</tst:entry>
    <tst:entry key="bottom">bottom</tst:entry>
    <tst:entry key="left">left</tst:entry>
    <tst:entry key="right">right</tst:entry>
</tst:subtype>

<tst:scriptRef>
    <tst:entry key="#tamilPulliNone">no <x:foreign xml:lang="ta">pu??????i</x:foreign></tst:entry>
    <tst:entry key="#tamilPulliSporadic">sporadic <x:foreign xml:lang="ta">pu??????i</x:foreign></tst:entry>
    <tst:entry key="#tamilPulliRegular">regular <x:foreign xml:lang="ta">pu??????i</x:foreign></tst:entry>
    <tst:entry key="#tamilRa">closed <x:foreign xml:lang="ta">k??l</x:foreign></tst:entry>
    <tst:entry key="#tamilMacron">disambiguating macron (-a vocalisation)</tst:entry>
    <tst:entry key="#tamilOE">long <x:foreign xml:lang="ta">??/??</x:foreign> (double-curled <x:foreign xml:lang="ta">kompu</x:foreign>)</tst:entry>
    <tst:entry key="#tamilRRa">modern <x:foreign xml:lang="ta">???a</x:foreign></tst:entry>
    <tst:entry key="#prsthamatra"><x:foreign xml:lang="sa">p?????????ham??tr??</x:foreign></tst:entry>
    <tst:entry key="#vaba"><x:foreign xml:lang="sa">ba</x:foreign> not distinguished</tst:entry>
    <tst:entry key="#sthascha"><x:foreign xml:lang="sa">stha</x:foreign> written as <x:foreign xml:lang="sa">scha</x:foreign></tst:entry>
    <tst:entry key="#bengaliRaBarBelow"><x:foreign xml:lang="sa">ra</x:foreign> with bar below</tst:entry>
    <tst:entry key="#bengaliRaCrossbar"><x:foreign xml:lang="sa">ra</x:foreign> with cross-bar</tst:entry>
    <tst:entry key="#bengaliRa"><x:foreign xml:lang="sa">ra</x:foreign> with dot below</tst:entry>
    <tst:entry key="#bengaliYa"><x:foreign xml:lang="sa">ya</x:foreign> with dot below</tst:entry>
    <tst:entry key="#valapalagilaka">valapalagilaka</tst:entry>
    <tst:entry key="#dotreph">dot reph</tst:entry>
</tst:scriptRef>

<tst:media>
    <tst:entry key="ink">ink</tst:entry>
    <tst:entry key="incised">incised</tst:entry>
    <tst:entry key="soot">soot</tst:entry>
    <tst:entry key="pencil">pencil</tst:entry>
    <tst:entry key="black">black</tst:entry>
    <tst:entry key="brown">brown</tst:entry>
    <tst:entry key="blue">blue</tst:entry>
    <tst:entry key="red">red</tst:entry>
</tst:media>

<tst:scribes>
    <tst:entry key="#ArielTitleScribe">Ariel's title scribe</tst:entry>
    <tst:entry key="#EdouardAriel">Edouard Ariel</tst:entry>
    <tst:entry key="#PhEDucler">Philippe ??tienne Ducler</tst:entry>
    <tst:entry key="#DuclerScribe">Ducler's scribe</tst:entry>
    <tst:entry key="#UmraosinghShergil">Umraosingh Sher-Gil</tst:entry>
</tst:scribes>

<tst:langs>
    <tst:entry key="eng">English</tst:entry>
    <tst:entry key="fra">French</tst:entry>
    <tst:entry key="deu">German</tst:entry>
    <tst:entry key="lat">Latin</tst:entry>
    <tst:entry key="pal">Pali</tst:entry>
    <tst:entry key="por">Portuguese</tst:entry>
    <tst:entry key="pra">Prakrit</tst:entry>
    <tst:entry key="san">Sanskrit</tst:entry>
    <tst:entry key="tam">Tamil</tst:entry>
</tst:langs>

<tst:entities>
    <tst:entry key="#pcs">&#x0BF3;</tst:entry>
    <tst:entry key="#pcl">&#x0BF3;</tst:entry>
    <tst:entry key="#ra_r_kal">&#xB86;</tst:entry>
    <tst:entry key="#kompu">&#x0B8E;</tst:entry>
    <tst:entry key="#nna=m">&#xBA3;&#xBAE;&#xBCD;</tst:entry>
    <tst:entry key="#ya=m">&#xBAF;&#xBAE;&#xBCD;</tst:entry>
    <tst:entry key="#teti">&#x0BF3;</tst:entry>
    <tst:entry key="#maatham">???</tst:entry>
    <tst:entry key="#varudam">???</tst:entry>
    <tst:entry key="#patru">???</tst:entry>
    <tst:entry key="#eduppu">???</tst:entry>
    <tst:entry key="#merpadi">???</tst:entry>
    <tst:entry key="#rupai">???</tst:entry>
    <tst:entry key="#niluvai">???</tst:entry>
    <tst:entry key="#munthiri">????</tst:entry>
    <tst:entry key="#araikkaani">????</tst:entry>
    <tst:entry key="#kaani">????</tst:entry>
    <tst:entry key="#kaal_viisam">????</tst:entry>
    <tst:entry key="#arai_maa">????</tst:entry>
    <tst:entry key="#arai_viisam">????</tst:entry>
    <tst:entry key="#mukkaani">????</tst:entry>
    <tst:entry key="#mukkaal_viisam">????</tst:entry>
    <tst:entry key="#maa">????</tst:entry>
    <tst:entry key="#viisam">????</tst:entry>
    <tst:entry key="#viisam_alt">????</tst:entry>
    <tst:entry key="#irumaa">????</tst:entry>
    <tst:entry key="#araikkaal">????</tst:entry>
    <tst:entry key="#mumaa">????</tst:entry>
    <tst:entry key="#muuviisam">????</tst:entry>
    <tst:entry key="#naangu_maa">????</tst:entry>
    <tst:entry key="#kaal">????</tst:entry>
    <tst:entry key="#arai">????</tst:entry>
    <tst:entry key="#arai_alt">????</tst:entry>
    <tst:entry key="#mukkaal">????</tst:entry>
    <tst:entry key="#kiizh">????</tst:entry>
    <tst:entry key="#nel">????</tst:entry>
    <tst:entry key="#cevitu">????</tst:entry>
    <tst:entry key="#aazhaakku">????</tst:entry>
    <tst:entry key="#uzhakku">????</tst:entry>
    <tst:entry key="#muuvuzhakku">????</tst:entry>
    <tst:entry key="#kuruni">????</tst:entry>
    <tst:entry key="#pathakku">????</tst:entry>
    <tst:entry key="#mukkuruni">????</tst:entry>
    <tst:entry key="#kaacu">????</tst:entry>
    <tst:entry key="#panam">????</tst:entry>
    <tst:entry key="#pon">????</tst:entry>
    <tst:entry key="#varaakan">????</tst:entry>
    <tst:entry key="#paaram">????</tst:entry>
    <tst:entry key="#kuzhi">????</tst:entry>
    <tst:entry key="#veli">????</tst:entry>
    <tst:entry key="#nansey">????</tst:entry>
    <tst:entry key="#punsey">????</tst:entry>
    <tst:entry key="#nilam">????</tst:entry>
    <tst:entry key="#uppalam">????</tst:entry>
    <tst:entry key="#varavu">????</tst:entry>
    <tst:entry key="#enn">????</tst:entry>
    <tst:entry key="#naalathu">????</tst:entry>
    <tst:entry key="#silvaanam">????</tst:entry>
    <tst:entry key="#poga">????</tst:entry>
    <tst:entry key="#aaga">????</tst:entry>
    <tst:entry key="#vasam">????</tst:entry>
    <tst:entry key="#muthal">????</tst:entry>
    <tst:entry key="#muthaliya">????</tst:entry>
    <tst:entry key="#vakaiyaraa">????</tst:entry>
    <tst:entry key="#end_of_text">????</tst:entry>
</tst:entities>

<tst:entityclasses>
    <tst:entry key="#pcl">aalt</tst:entry>
    <tst:entry key="#ra_r_kal">aalt</tst:entry>
    <tst:entry key="#kompu">aalt</tst:entry>
    <tst:entry key="#nna=m">alig</tst:entry>
    <tst:entry key="#ya=m">alig</tst:entry>
</tst:entityclasses>

<tst:entitynames>
    <tst:entry key="#pcs">pi??????aiy??r cu???i (short)</tst:entry>
    <tst:entry key="#pcl">pi??????aiy??r cu???i (long)</tst:entry>
    <tst:entry key="#ra_r_kal">ra, r, or k??l</tst:entry>
    <tst:entry key="#kompu">kompu</tst:entry>
    <tst:entry key="#nna=m">???am ligature</tst:entry>
    <tst:entry key="#ya=m">yam ligature</tst:entry>
    <tst:entry key="#teti">t??ti</tst:entry>
    <tst:entry key="#maatham">m??cam</tst:entry>
    <tst:entry key="#varudam">varu???am</tst:entry>
    <tst:entry key="#patru">debit</tst:entry>
    <tst:entry key="#eduppu">credit</tst:entry>
    <tst:entry key="#merpadi">as above</tst:entry>
    <tst:entry key="#rupai">rupee</tst:entry>
    <tst:entry key="#niluvai">balance</tst:entry>
    <tst:entry key="#munthiri">1/320</tst:entry>
    <tst:entry key="araikkaani">1/160</tst:entry>
    <tst:entry key="#kaani">1/80</tst:entry>
    <tst:entry key="#kaal_viisam">1/64</tst:entry>
    <tst:entry key="#arai_maa">1/40</tst:entry>
    <tst:entry key="#arai_viisam">1/32</tst:entry>
    <tst:entry key="#mukkaal_viisam">3/64</tst:entry>
    <tst:entry key="#mukkaani">3/80</tst:entry>
    <tst:entry key="#maa">1/20</tst:entry>
    <tst:entry key="#viisam">1/16</tst:entry>
    <tst:entry key="#viisam_alt">1/16</tst:entry>
    <tst:entry key="#irumaa">1/10</tst:entry>
    <tst:entry key="#araikkaal">1/8</tst:entry>
    <tst:entry key="#mumaa">3/20</tst:entry>
    <tst:entry key="#muuviisam">3/16</tst:entry>
    <tst:entry key="#naangu_maa">1/5</tst:entry>
    <tst:entry key="#kaal">1/4</tst:entry>
    <tst:entry key="#arai">1/2</tst:entry>
    <tst:entry key="#arai_alt">1/2</tst:entry>
    <tst:entry key="#mukkaal">3/4</tst:entry>
    <tst:entry key="#kiizh">less 1/320</tst:entry>
    <tst:entry key="#nel">nel</tst:entry>
    <tst:entry key="#cevitu">cevitu</tst:entry>
    <tst:entry key="#aazhaakku">???????kku</tst:entry>
    <tst:entry key="#uzhakku">u???akku</tst:entry>
    <tst:entry key="#muuvuzhakku">m??vu???akku</tst:entry>
    <tst:entry key="#kuruni">ku???u???i</tst:entry>
    <tst:entry key="#pathakku">patakku</tst:entry>
    <tst:entry key="#mukkuruni">mukku???u???i</tst:entry>
    <tst:entry key="#kaacu">k??cu</tst:entry>
    <tst:entry key="#panam">pa???am</tst:entry>
    <tst:entry key="#pon">po???</tst:entry>
    <tst:entry key="#varaakan">var??ka???</tst:entry>
    <tst:entry key="#paaram">p??ram</tst:entry>
    <tst:entry key="#kuzhi">ku???i</tst:entry>
    <tst:entry key="#veli">v????i</tst:entry>
    <tst:entry key="#nansey">wet cultivation</tst:entry>
    <tst:entry key="#nilam">land</tst:entry>
    <tst:entry key="#uppalam">salt pan</tst:entry>
    <tst:entry key="#varavu">credit</tst:entry>
    <tst:entry key="#enn">number</tst:entry>
    <tst:entry key="#naalathu">current</tst:entry>
    <tst:entry key="#silvaanam">and odd</tst:entry>
    <tst:entry key="#poga">spent</tst:entry>
    <tst:entry key="#aaga">total</tst:entry>
    <tst:entry key="#vasam">in possession</tst:entry>
    <tst:entry key="#muthal">starting from</tst:entry>
    <tst:entry key="#muthaliya">et cetera (in a series)</tst:entry>
    <tst:entry key="#vakaiyaraa">et cetera (of a kind)</tst:entry>
    <tst:entry key="#end_of_text">end of text</tst:entry>
</tst:entitynames>

<tst:additiontype>
    <tst:entry key="catchword">catchword</tst:entry>
    <tst:entry key="chapter-heading">chapter heading</tst:entry>
    <tst:entry key="end-title">end title</tst:entry>
    <tst:entry key="heading">heading</tst:entry>
    <tst:entry key="intertitle">intertitle</tst:entry>
    <tst:entry key="register">register</tst:entry>
    <tst:entry key="table-of-contents">table of contents</tst:entry>
    <tst:entry key="title">title</tst:entry>
    <tst:entry key="verse-beginning">verse beginning</tst:entry>
    <tst:entry key="verse-numbering">verse numbering</tst:entry>
    <tst:entry key="correction">correction</tst:entry>
    <tst:entry key="gloss">gloss/commentary</tst:entry>
    <tst:entry key="commenting-note">text-related note</tst:entry>
    <tst:entry key="blessing">blessing/benediction</tst:entry>
    <tst:entry key="completion-statement">completion statement</tst:entry>
    <tst:entry key="dedication">dedication</tst:entry>
    <tst:entry key="invocation">invocation</tst:entry>
    <tst:entry key="ownership-statement">ownership statement</tst:entry>
    <tst:entry key="postface">postface</tst:entry>
    <tst:entry key="preface">preface</tst:entry>
    <tst:entry key="satellite-stanza">satellite stanza</tst:entry>
    <tst:entry key="seal">seal</tst:entry>
    <tst:entry key="shelfmark">shelfmark</tst:entry>
    <tst:entry key="stamp">stamp</tst:entry>
    <tst:entry key="total-chapters">total chapters</tst:entry>
    <tst:entry key="total-stanzas">total stanzas</tst:entry>
    <tst:entry key="documenting-note">user-related note</tst:entry>
    <tst:entry key="rubric">rubric</tst:entry>
    <tst:entry key="incipit">incipit</tst:entry>
    <tst:entry key="explicit">explicit</tst:entry>
    <tst:entry key="colophon">colophon</tst:entry>
</tst:additiontype>

<tst:genres>
    <tst:entry key="#cankam">Ca???kam</tst:entry>
    <tst:entry key="#kilkkanakku">K?????kka???akku</tst:entry>
    <tst:entry key="#illakkanam">Ilakka???am</tst:entry>
    <tst:entry key="#kappiyam">K??ppiyam/epics</tst:entry>
    <tst:entry key="#tirumurai">Tirumu???ai</tst:entry>
    <tst:entry key="#pirapantam">Pirapantam</tst:entry>
    <tst:entry key="#puranam">Pur?????am</tst:entry>
    <tst:entry key="#nikantu">Nika??????u</tst:entry>
    <tst:entry key="#talapuranam">Talapur?????am</tst:entry>
    <tst:entry key="#katai">Katai</tst:entry>
</tst:genres>
</xsl:variable>

<xsl:variable name="TST" select="exsl:node-set($defRoot)"/>

</xsl:stylesheet>
