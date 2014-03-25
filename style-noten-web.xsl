<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="/">
        <html>
            <head>
                <title>Meine Noten</title>
                <style>
                    body {
                    font-family: Calibri, sans-serif;
                    }

                    h1 {
                    margin-top: 10px;
                    margin-left: 13px;
                    font-size:18pt;
                    font-weight:bold;
                    }
                    h2 {
                    marin-top:30px:
                    font-size:15pt;
                    font-weight:bold;
                    }

                    p {
                    margin-top: 10px;
                    margin-left: 13px;
                    font-size:18px;
                    }

                    .bestanden {
                    background-color:lightgreen;
                    width: 90px;
                    height: 70px;
                    }

                    .durchgefallen {
                    background-color: red;
                    width: 150px;
                    height:70px;
                    }

                    .grade {
                    float:left;
                    width: 170px;
                    }

                    .grey {
                    background-color: lightgrey;
                    border: 1px solid #999999;
                    margin-left: 3px;
                    }

                    .semester {
                    font-style: italic;
                    font-weight:bold;
                    float:left;
                    }

                    .modul {
                    float:left;
                    }
                    .punkte {
                    float:left;
                    font-weight:bold;
                    }
                    .gradeValue {
                    font-size: 15pt;
                    font-weight:bold;
                    }
                    .notendurchschnitt {
                    margin-top: 80px;
                    margin-right: 20px;
                    }
                    .floatLeft {
                    float:left;
                    }
                    .punkte {
                    width: 50px;
                    }
                    .dozent {
                    text-transform:uppercase;
                    }
                </style>

            </head>
            <body>
                <h1>Meine Noten</h1>
                <h2>Alle Leistungen sortiert nach Modulen</h2>
                <xsl:for-each select="//kurs">
                    <xsl:sort select="modul" order="ascending"/>
                    <div>
                        <xsl:call-template name="Daten"></xsl:call-template>
                    </div>
                </xsl:for-each>
                <div>
                    <h2 class="notendurchschnitt">Notendurchschnitt:</h2>
                    <h2 class=" punkte grey">
                        <xsl:value-of select="round(sum(//kurs/note)) div 10"/>
                    </h2>
                </div>
                <br/>
                <br/>
                <div>
                    <br/>
                    <h2>Leistungspunkte:</h2>
                    <h2 class="punkte grey">
                        <xsl:value-of select="round(sum(//kurs/punkte))"/>
                    </h2>
                </div>
            </body>

        </html>
    </xsl:template>

    <xsl:template name="Daten">
        <h2>
            <xsl:value-of select="titel"/>
        </h2>
        <div class="grade">
            <xsl:choose>
                <xsl:when test="note='5.0'">
                    <div class="durchgefallen">
                        <div class="gradeValue">
                            <xsl:value-of select="note"/>
                        </div>
                        <br/>
                        nicht bestanden
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="bestanden">
                        <div class="gradeValue">
                            <xsl:value-of select="note"/>
                        </div>
                        <br/>
                        bestanden
                    </div>
                </xsl:otherwise>
            </xsl:choose>
        </div>
        <div>
            <xsl:value-of select="nummer"/><xsl:text>     </xsl:text>
            <b class="dozent">
            <xsl:value-of select="dozent"/>
            </b>
        </div>
        <br/>
        <div>
            <div class="modul grey">
                <xsl:value-of select="modul"/>
            </div>
            <xsl:text>     </xsl:text>
            <div class="semester grey">
                <xsl:value-of select="semester"/>
            </div>
            <xsl:text>     </xsl:text>
            <div class="punkte grey">
                <xsl:text>LP: </xsl:text><xsl:value-of select="punkte"/>
            </div>
            <br/>
        </div>
    </xsl:template>


</xsl:stylesheet>