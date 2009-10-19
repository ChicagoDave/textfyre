<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/Transcript">
		<html>
			<head>
				<title>
					SilverFyre Transcript - <xsl:value-of select="@storyUrl"/>
				</title>
				<style>
					html, body { font-family: Arial, Sans Serif, Verdana; }
					h1 { color: darkblue; }
					h2 { color: darkred; }
					.prompt { color: blue; }
					.input { color: green; font-style: italic; }
					.death { color: red; }
				</style>
			</head>
			<body>
				<h1>SilverFyre Transcript</h1>
				<h2>
					<xsl:value-of select="@storyUrl"/>
				</h2>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Input">
		<span class="prompt">&gt;</span>
		<xsl:text> </xsl:text><span class="input"><xsl:value-of select="."/></span>
	</xsl:template>

	<xsl:template match="Output">
		<xsl:if test="Death">
			<p class="death">
				<xsl:value-of select="Death"/>
			</p>
		</xsl:if>
		<xsl:apply-templates select="Prologue/*"/>
		<xsl:apply-templates select="Main/*"/>
	</xsl:template>

	<xsl:template match="Paragraph">
		<p><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="LineBreak">
		<br/>
	</xsl:template>

	<xsl:template match="Italic">
		<i><xsl:apply-templates/></i>
	</xsl:template>

	<xsl:template match="Bold">
		<b><xsl:apply-templates/></b>
	</xsl:template>

</xsl:stylesheet>
