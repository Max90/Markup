<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/">
        \documentclass[11pt]{article}
        \usepackage[ngerman]{babel}
        \usepackage[utf8]{inputenc}
        \usepackage[T1]{fontenc}

        \begin{document}
        \title{Meine Noten}
        \author{Maximilian Feigl}
        \date{letzte Änderung am \today}

        \maketitle
        \tableofcontents

        <xsl:variable name="sort_param" select="'titel'"/>
        Alle Noten sortiert nach <xsl:value-of select="$sort_param"/>\newline

        <xsl:for-each select="//kurs">
            <xsl:call-template name="Daten"></xsl:call-template>
        </xsl:for-each>
        \end{document}
    </xsl:template>


    <xsl:template name="Daten">
        \section {<xsl:value-of select="titel"/>}\newline
        <xsl:value-of select="nummer"/> \newline
        <xsl:value-of select="dozent"/> \newline
        \newline
        Modul:
        <xsl:value-of select="modul"/> \newline
        Semester:
        <xsl:value-of select="semester"/> \newline
        LP:
        <xsl:value-of select="punkte"/> \newline
        Note:
        <xsl:value-of select="note"/> \newline
    </xsl:template>

</xsl:stylesheet>