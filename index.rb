#!/usr/bin/env ruby
# encoding: utf-8
require 'cgi'
require 'xml/xslt'
xslt = XML::XSLT.new()
xslt.xml = "20140616.xml"
xslt.xsl = "index.xsl"
cgi = CGI.new

xslt.parameters = { "searchWord" => cgi["keyword"],
                    "pageNum" => cgi["page"]}
out = xslt.serve()
print cgi.header("text/html; charset=UTF-8")
print out
