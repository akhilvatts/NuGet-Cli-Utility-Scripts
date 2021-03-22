$currentDir = pwd
$Path = $currentDir.Path
$Path = $Path + "\Nuget.config"
# Set The Formatting
$xmlsettings = New-Object System.Xml.XmlWriterSettings
$xmlsettings.Indent = $true
$xmlsettings.IndentChars = "    "
# Set the File Name Create The Document
$XmlWriter = [System.XML.XmlWriter]::Create($Path, $xmlsettings)
# Write the XML Decleration and set the XSL
$xmlWriter.WriteStartDocument()
# Start the Root Element
$xmlWriter.WriteStartElement("configuration") # <-- Start <configuration>
$xmlWriter.WriteStartElement("packageSources") # <-- Start <packageSources>
# add a node with attributes and content:
$XmlWriter.WriteStartElement('add')
$XmlWriter.WriteAttributeString('key', 'LocalSource')
$XmlWriter.WriteAttributeString('value', 'D:\this-is-some-optional-directory\some-path')
$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndElement()
$xmlWriter.WriteStartElement("disabledPackageSources") # <-- Start <packageSources>
# add a node with attributes and content:
# add a node with attributes and content:
$XmlWriter.WriteStartElement('add')
$XmlWriter.WriteAttributeString('key', 'nuget.org')
$XmlWriter.WriteAttributeString('value', 'true')
$xmlWriter.WriteEndElement()
# add a node with attributes and content:
$XmlWriter.WriteStartElement('add')
$XmlWriter.WriteAttributeString('key', 'Microsoft Visual Studio Offline Packages')
$XmlWriter.WriteAttributeString('value', 'true')
$xmlWriter.WriteEndElement()
$xmlWriter.WriteEndElement() # <-- End <packageSources>
$xmlWriter.WriteEndElement() # <-- End <configuration> 
$xmlWriter.WriteEndDocument()
$xmlWriter.Flush()
$xmlWriter.Close()