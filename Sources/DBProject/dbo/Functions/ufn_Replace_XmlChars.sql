﻿CREATE function [dbo].[ufn_Replace_XmlChars]

 (@XML       nvarchar(max))

returns        nvarchar(max)

as

begin 

 if isnull(@XML,'') = ''
  return ''

 set @XML      = replace( replace( replace( @XML, '<?xml version="1.0" encoding="utf-16"?>', ''), 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"', ''), 'xmlns:xsd="http://www.w3.org/2001/XMLSchema"', '')
 set @XML      = replace(@XML, '<?xml version="1.0" encoding="utf-8" ?>','')
 set @XML      = replace(@XML, '<?xml version="1.0" encoding="UTF-8"?>','')

 set @XML      = replace(@XML, 'xsi:nil="true"','')
 set @XML      = replace( @XML, 'xmlns:xsd="http://www.w3.org/2001/XMLSchema"','')
 set @XML      = replace( @XML, 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"','')
 set @XML      = replace( @XML, 'xmlns="http://nexjensys.com/ns/webconnect"','')
 set @XML      = replace( @XML, '–N','-N')

 --set @XML      = replace(@XML, '''', '''''')

 return @XML
  
end