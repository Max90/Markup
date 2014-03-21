	<xsl:stylesheet version="1.0"><xsl:output omit-xml-declaration="yes"/><xsl:template match="LaTeXDocument"><xsl:text>
	%********************************************************************************************
	%*      This LaTeX document is generated using a Stylesheet which can be found in:          *
	%*   http://www.inrialpes.fr/opera/people/Tayeb.Lemlouma/MULTIMEDIA/XSLT/XML2LaTeX.xsl      *
	%*                             Author:  Tayeb Lemlouma, june 2001                           *
	%********************************************************************************************
	\documentstyle[11pt, epsfig]{</xsl:text><xsl:value-of select="@Type"/><xsl:text>}

	%==============================Title of the document=========================================
	\title{\bf </xsl:text><xsl:apply-templates select="Title/text()"/><xsl:text>}

</xsl:text><xsl:apply-templates select="Author"/><xsl:text>
</xsl:text><!-- ======= Date ====== --><xsl:apply-templates select="Date"/><!-- ======= Default properties ====== --><xsl:text>

\textwidth 16.8cm
\textheight 21.5cm
\oddsidemargin -.25in
\evensidemargin -.25in
\topskip 0cm
\footskip 1cm
\footheight 0cm
\headheight -1cm</xsl:text><!-- ======= Document Begining ====== --><xsl:text>

\begin{document} 
\maketitle
</xsl:text><!-- ======= Heading ====== --><xsl:apply-templates select="Heading"/><!-- ======= Abstract & Key Words ====== --><xsl:text>

%==============================Abstract and key words========================================
\begin{abstract}
</xsl:text><xsl:apply-templates select="Abstract/text()"/><xsl:text>
\begin{flushleft}{\bf Keywords:}
</xsl:text><xsl:apply-templates select="Key-words/text()"/><xsl:text>
\end{flushleft}
\end{abstract}

%==============================Document Body=================================================
</xsl:text><xsl:apply-templates select="LaTeXBody/Section"/><xsl:apply-templates select="LaTeXBody/Bibliograhy"/><xsl:text>
\end{document}
%==============================End of Document===============================================
</xsl:text></xsl:template><!-- ======= Authors ====== --><xsl:template match="Author"><xsl:for-each select="Name"><xsl:if test="position()=1"><xsl:text>
\author{</xsl:text></xsl:if><xsl:if test="not(position()=1)"><xsl:text> and </xsl:text></xsl:if><xsl:apply-templates select="text()"/></xsl:for-each><xsl:text>}</xsl:text></xsl:template><!-- ======= Date ====== --><xsl:template match="Date"><xsl:text>
\date{</xsl:text><xsl:apply-templates select="text()"/><xsl:text>}</xsl:text></xsl:template><!-- ======= Heading ====== --><xsl:template match="Heading"><!-- ==Organisation== --><xsl:text>\begin{center}</xsl:text><xsl:apply-templates select="Organisation/Name/text()"/><xsl:text> \\ </xsl:text><!-- ==Adress== --><xsl:apply-templates select="Organisation/Adress/text()"/><xsl:text> \\ </xsl:text><!-- ==Phone== --><xsl:for-each select="Phone/Number"><xsl:if test="position()=1"><xsl:text> 
Phone: </xsl:text></xsl:if><xsl:if test="not(position()=1)"><xsl:text> / </xsl:text></xsl:if><xsl:value-of select="."/></xsl:for-each><xsl:text> \\ </xsl:text><!-- ==Fax== --><xsl:for-each select="Fax/Number"><xsl:if test="position()=1"><xsl:text>
Fax: </xsl:text></xsl:if><xsl:if test="not(position()=1)"><xsl:text> / </xsl:text></xsl:if><xsl:value-of select="."/></xsl:for-each><xsl:text> \\ </xsl:text><!-- ==Mail== --><xsl:for-each select="EMail/Mail"><xsl:if test="position()=1"><xsl:text>
E-mail: </xsl:text></xsl:if><xsl:if test="not(position()=1)"><xsl:text>, </xsl:text></xsl:if><xsl:apply-templates select="text()"/></xsl:for-each><xsl:text> \\ </xsl:text><xsl:text>
\end{center}</xsl:text></xsl:template><!-- ======= Body ====== --><!-- Sections Processing --><xsl:template match="Section"><xsl:text>
%==============================</xsl:text><xsl:value-of select="Title"/><xsl:text>
\</xsl:text><xsl:if test="count(ancestor::node())>3"><xsl:call-template name="SubGenerator"><xsl:with-param name="count" select="count(ancestor::node())"/></xsl:call-template></xsl:if><xsl:text>section{</xsl:text><xsl:value-of select="Title"/><xsl:text>}
</xsl:text><!--Text Process --><xsl:apply-templates select="Body/node()"/></xsl:template><!-- End of Sections Processing --><!-- SubGenerator: A recursif function that generates "sub" strings--><xsl:template name="SubGenerator"><xsl:param name="count"/><xsl:if test="$count != 3"><xsl:text>sub</xsl:text><xsl:call-template name="SubGenerator"><xsl:with-param name="count" select="$count - 2"/><!-- 2 because it's organized like this Section/Body/Section ... etc. --></xsl:call-template></xsl:if></xsl:template><!-- End of SubGenerator--><!-- Text Process Template --><xsl:template match="text()"><xsl:variable name="S"><xsl:value-of select="normalize-space()"/></xsl:variable><xsl:if test="string-length($S)>0"><xsl:call-template name="LaTeXChar"><xsl:with-param name="i" select="string-length($S)"/><xsl:with-param name="l" select="string-length($S)"/></xsl:call-template></xsl:if></xsl:template><!-- End of the Text Process Template --><!-- LaTeXChar: A recursif function that generates LaTeX special characters --><xsl:template name="LaTeXChar"><xsl:param name="i"/><xsl:param name="l"/><xsl:variable name="SS"><xsl:value-of select="substring(normalize-space(),$l - $i + 1,1)"/></xsl:variable><xsl:if test="$i > 0"><xsl:choose><xsl:when test="$SS = 'é'"><xsl:text>\'{e}</xsl:text></xsl:when><xsl:when test="$SS = 'ê'"><xsl:text>\^{e}</xsl:text></xsl:when><xsl:when test="$SS = 'è'"><xsl:text>\`{e}</xsl:text></xsl:when><xsl:when test="$SS = 'ï'"><xsl:text>\"{\i}</xsl:text></xsl:when><xsl:when test="$SS = 'î'"><xsl:text>\^{i}</xsl:text></xsl:when><xsl:when test="$SS = 'à'"><xsl:text>\`{a}</xsl:text></xsl:when><xsl:when test="$SS = 'á'"><xsl:text>\'{a}</xsl:text></xsl:when><xsl:when test="$SS = 'â'"><xsl:text>\^{a}</xsl:text></xsl:when><xsl:when test="$SS = 'ç'"><xsl:text>\c{c}</xsl:text></xsl:when><xsl:when test="$SS = 'ô'"><xsl:text>\^{o}</xsl:text></xsl:when><xsl:when test="$SS = 'ù'"><xsl:text>\`{u}</xsl:text></xsl:when><xsl:when test="$SS = 'û'"><xsl:text>\^{u}</xsl:text></xsl:when><xsl:when test="$SS = '|'"><xsl:text>$|$</xsl:text></xsl:when><xsl:when test="$SS = '_'"><xsl:text>\_</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="$SS"/></xsl:otherwise></xsl:choose><xsl:text/><xsl:call-template name="LaTeXChar"><xsl:with-param name="i" select="$i - 1"/><xsl:with-param name="l" select="$l"/></xsl:call-template></xsl:if></xsl:template><!-- End of LaTeXChar template --><!-- Bibliography Processing --><xsl:template match="Bibliograhy"><xsl:text>

%==============================Biblioraphy ==================================================
\begin{thebibliography}{99}</xsl:text><xsl:apply-templates select="Citation"/><xsl:text>
\end{thebibliography}
</xsl:text></xsl:template><!-- End of Bibliography Processing --><!-- Citation Processing --><xsl:template match="Citation"><xsl:text>
\bibitem{</xsl:text><xsl:value-of select="Label"/><xsl:text>} </xsl:text><xsl:value-of select="Authors"/><xsl:text>, \textit{ </xsl:text><xsl:value-of select="Title"/><xsl:text> }, </xsl:text><xsl:value-of select="normalize-space(Description/text())"/><xsl:text>, </xsl:text><xsl:value-of select="Description/Date"/><xsl:text>.</xsl:text></xsl:template><!-- Enumerates Process --><xsl:template match="Enumerates"><xsl:text>
\begin{enumerate}</xsl:text><xsl:for-each select="Item"><xsl:text>
\item </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>
\end{enumerate}
</xsl:text></xsl:template><!--Enumerates Process --><!-- Citations Process --><xsl:template match="Cite"><xsl:text> \cite{</xsl:text><xsl:value-of select="."/><xsl:text>} </xsl:text></xsl:template><!--Citations Process --><!-- Figuress Process (suppose that we use an eps format which is commonly done) --><xsl:template match="Figure"><xsl:text>
\begin{center}
\mbox{\epsfig{file=</xsl:text><xsl:value-of select="path"/><xsl:text>}}
\end{center}
\begin{center}{\bf </xsl:text><xsl:value-of select="label"/><xsl:text>: </xsl:text><xsl:value-of select="Title"/><xsl:text>}\end{center}
</xsl:text></xsl:template><!--Figuress Process--><!-- Items Process --><xsl:template match="Items"><xsl:text>
\begin{itemize}</xsl:text><xsl:for-each select="Item"><xsl:text>
\item </xsl:text><xsl:value-of select="."/></xsl:for-each><xsl:text>
\end{itemize}
</xsl:text></xsl:template><!--Items Process --></xsl:stylesheet>