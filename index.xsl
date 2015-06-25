<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8" />
<xsl:param name="searchWord" />
<xsl:param name="pageNum" />
<xsl:template match="/">
<html lang="ja"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <title><xsl:value-of select="books/metadata/title" /></title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!--[if lt IE 9]>
      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="css/styles.css" rel="stylesheet" />
  </head>
  <body>
<header class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>
    <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
       <xsl:apply-templates select="document('keywords.xml')/keywords/keyword">
          <xsl:sort select="count" data-type="number" order="descending"/>
      </xsl:apply-templates>
      </ul>
      <ul class="nav navbar-right navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
          <ul class="dropdown-menu" style="padding:12px;">
            <form class="form-inline" action="index.rb">
              <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button><input class="form-control pull-left" placeholder="キーワード" name="keyword" type="text" /><input value="0" name="page" type="hidden" />
            </form>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</header>

<div id="masthead">  
  <div class="container">
    <div class="row">
      <div class="col-md-7">
        <h1><xsl:value-of select="books/metadata/title" /><p class="lead"><xsl:value-of select="books/metadata/creator" /></p>
        </h1>
      </div>
      <div class="col-md-5">
        <div class="well well-lg"> 
          <div class="row">
            <div class="col-sm-12">情報メディア創成学類 藤坂祐史（201311447）<br />
このページはマークアップ言語 最終課題として制作しました。<br /><br />
<p>
<xsl:if test="$searchWord">
  キーワード「<xsl:value-of select="$searchWord" />」の書籍データを表示しています。
</xsl:if>
</p>
          </div>
          </div>
        </div>
      </div>
    </div> 
  </div><!-- /cont -->
  
 
</div>


<div class="container">
  <div class="row">
    
    <div class="col-md-12"> 
      
      <div class="panel">
        <div class="panel-body">
          <!--/stories-->
<xsl:apply-templates select="/books/item[keywords/keyword = $searchWord]"/>
         
          <!--/stories-->
          
          <xsl:if test="$pageNum &gt; 0">
          <a class="btn btn-primary pull-left btnNext">
          <xsl:attribute name="href">index.rb?page=<xsl:value-of select="$pageNum - 1" />&amp;keyword=<xsl:value-of select="$searchWord" /></xsl:attribute>
          <i class="glyphicon glyphicon-chevron-left"></i>
          前へ
         </a>
          </xsl:if>
        
        <xsl:variable name="max" select="count(/books/item[keywords/keyword = $searchWord])" />
        <xsl:if test="($pageNum + 1)* 10 &lt; $max">
          <a class="btn btn-primary pull-right btnNext">
            <xsl:attribute name="href">index.rb?page=<xsl:value-of select="$pageNum + 1" />&amp;keyword=<xsl:value-of select="$searchWord" /></xsl:attribute>
            次へ
            <i class="glyphicon glyphicon-chevron-right"></i>
           </a>
        
        </xsl:if>
        
          
        </div>
      </div>
                                                                                       
                                                  
                                                      
    </div><!--/col-12-->
  </div>
</div>
                                                
                                                                                
<hr />



<hr />

<footer>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
          <p class="pull-right">Built with <i class="icon-heart-empty"></i> at <a href="http://www.bootply.com">Bootply</a></p>      
      </div>
    </div>
  </div>
</footer>
  <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  
</body></html>
</xsl:template>

<xsl:template match="item">
  <xsl:if test="position()&lt; ($pageNum +1) * 10 and position()&gt; $pageNum * 10">
  <div class="row">    
            <br />
            <div class="col-md-2 col-sm-3 text-center">
              <a class="story-img">
                <xsl:attribute name="href"><xsl:value-of select="url/@resource" />
                  </xsl:attribute><img style="width:100px;height:100px" class="img-circle">
                <xsl:attribute name="src">http://capture.heartrails.com/200x150?<xsl:value-of select="url/@resource" /></xsl:attribute>
              </img></a>
            </div>

            <div class="col-md-10 col-sm-9">
              <h3><xsl:value-of select="title"/></h3>
              <div class="row">

                <div class="col-xs-9">
                  <p><xsl:value-of select="description" /></p>
                  <p><xsl:value-of select="price" />円</p>

                  <p class="lead"><a><xsl:attribute name="href">
                    <xsl:value-of select="url/@resource" />
                  </xsl:attribute><button class="btn btn-default">関連URLへ</button></a></p>
                  
                  <p class="pull-right">

                    <span class="label label-default">
                      <xsl:value-of select="keywords/keyword[position() = 1]" />
                    </span><span class="label label-default">  <xsl:value-of select="keywords/keyword[position() = 2]" /></span> <span class="label label-default">  <xsl:value-of select="keywords/keyword[position() = 3]" /></span></p>
<ul class="list-inline">
 <li><a href="#"><i class="glyphicon glyphicon-calender"></i> <xsl:value-of select="date/year" />/
  <xsl:value-of select="date/month" />/
  <xsl:value-of select="date/day" />
</a></li>
<li><a href="#"><i class="glyphicon glyphicon-user"></i> <xsl:value-of select="creator" /></a></li>
<li><a href="#"><i class="glyphicon glyphicon-barcode"></i> <xsl:value-of select="isbn" /></a></li>
<li><a href="#"><i class="glyphicon glyphicon-building"></i> <xsl:value-of select="publisher" /></a></li></ul>
                  </div>
                <div class="col-xs-3"></div>
              </div>
            </div>
          </div>
          <hr />
        </xsl:if>
</xsl:template>


<xsl:template match="keywords/keyword">
<xsl:if test="position() &lt;= 10">
<li>
<a>
  <xsl:attribute name="href">index.rb?page=0&amp;keyword=<xsl:value-of select="word" /></xsl:attribute>
  <xsl:value-of select="word" /></a>
</li>  
</xsl:if>   
</xsl:template>


</xsl:stylesheet>