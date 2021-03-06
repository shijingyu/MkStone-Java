<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>mkStone</title>
    <!-- Bootstrap -->
    <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <!-- <link rel="stylesheet" href="css/jqhover.css"> -->
    <link rel="stylesheet" href="fonts/BRUSHSCRIPTSTD.OTF">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
</head>

<body>
    <nav class="navbar navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="padding-top:6px;padding-bottom:0px;" href="index.html"><img src="http://om73yvjpj.bkt.clouddn.com/artical_03.png" alt=""></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <!-- <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form> -->
                <ul class="nav navbar-nav navbar-right ">
                    <!--         <li><div style="margin-right:30px" type="button" class="btn btn-default navbar-btn"><a href="login_register.html">Sign in</a></div></li>
 --><a href="#" class="navbar-brand" id="navbar-r" target="_blank">About us</a>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <aside id="index-aside" style="background-image:url(http://om73yvjpj.bkt.clouddn.com/index-re_01.png)">
        <div class="container">
            <div class="index-d">
                <p id="describe-1">欢迎来到<span id="mk">Mk</span><span>Stone</span></p>
                <p id="describe-2"><span></span>纯粹的技术分享小站</p>
            </div>
        </div>
    </aside>
    <div class="index-intro">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <p>本站由一个4人团队打造，功能正在不断完善中，如果您喜欢随时都可以来看看，见证我们的成长^-^</p>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <p>网站唯一指定名为MkStone，并没有什么特殊意义，Logo为一个石头和它滚出的轨迹组合而成，不同配色用于不同图片背景</p>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <p>网站底部的github图标可以连接到开发同学的个人页，有兴趣的不要错过啦~\(≧▽≦)/~啦啦啦</p>
                                <br>
                                <br>
                                <br>
                                <br>
                                <div class="carousel-caption">
                                </div>
                            </div>
                        </div>
                        <!-- Controls -->
                        <!--  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a> -->
                    </div>
                    <!-- <h2>mkStone网站正在搭建中……</h2> -->
                    <div type="button" data-toggle="modal" data-target="#myModal" class="btn btn-outline btn-lg" id="update-txt">更新日志</div>
                </div>
            </div>
        </div>
    </div>
    <div class="index-func">
        <div class="index-head">
            <p>Function<span>功能</span></p>
        </div>
        <div class="hr"></div>
        <div class="index-func-main">
            <div class="container-main">
                <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <ul class="grid">
                            <li class="cs-style-4">
                                <figure style="width:210px;">
                                    <div class="jqhover-main">
                                        <div class="jqhover-border"><div class="jqhover-ns">
                                            <a href="ArticleServlet"><img src="http://om73yvjpj.bkt.clouddn.com/article.png" alt="img05"></a>
                                            </div>
                                            <p class="fun-name">文章分享</p>
                                        </div>
                                        <div class="fun-describe">
                                            <p>不定时更新网络趋势、科技前沿、技术心得等相关文章。</p>
                                            <p class="getmore"><a href="ArticleServlet">获取更多></a></p>
                                        </div>
                                    </div>
                                </figure>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <ul class="grid">
                            <li class="cs-style-4">
                                <figure style="width:210px;">
                                    <div class="jqhover-main">
                                        <div class="jqhover-border"><div class="jqhover-ns">
                                            <a href="SourceServlet"><img src="http://om73yvjpj.bkt.clouddn.com/download.png" alt="img05"></a>
                                            </div>
                                            <p class="fun-name">资源下载</p>
                                        </div>
                                        <div class="fun-describe">
                                            <p>提供各种免费、实用的插件，下载工具，办公软件等。</p>
                                            <p class="getmore"><a href="SourceServlet">获取更多></a></p>
                                        </div>
                                    </div>
                                </figure>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <ul class="grid">
                            <li class="cs-style-4">
                                <figure style="width:210px;">
                                    <div class="jqhover-main">
                                        <div class="jqhover-border"><div class="jqhover-ns">
                                            <a href="#"><img class="ns1" src="images/ask.png" alt="img05"></a>
                                            </div>
                                            <p class="fun-name">评论功能</p>
                                        </div>
                                        <div class="fun-describe">
                                            <p>一个专门的问题交流版块，在这里畅所欲言，结交更多爱学习的伙伴！</p>
                                            <p class="getmore"><a href="ArticleServlet">获取更多></a></p>
                                        </div>
                                    </div>
                                </figure>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <ul class="grid">
                            <li class="cs-style-4">
                                <figure style="width:210px;">
                                    <div class="jqhover-main">
                                        <div class="jqhover-border">
                                        <div class="jqhover-ns">
                                            <a href="index.html"><img src="images/other.png" alt="img05"></a></div>
                                            <p class="fun-name">其他</p>
                                        </div>
                                        <div class="fun-describe">
                                            <p>开发人员正紧急开发中，尽请期待！</p>
                                            <p class="getmore"><a href="other.html">获取更多></a></p>
                                        </div>
                                    </div>
                                </figure>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 轮播图 -->
    <div class="lb">
        <div class="index-head">
            <p>Latest<span>最新发布</span></p>
        </div>
        <div class="hr"></div>
        <div class="carousel-main">
            <div class="container">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="http://om73yvjpj.bkt.clouddn.com/source_004.jpg" alt="...">
                            <div class="carousel-caption">
                            </div>
                        </div>
                        <div class="item">
                            <img src="http://om73yvjpj.bkt.clouddn.com/source_001.jpg" alt="...">
                            <div class="carousel-caption">
                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <footer class="index-footer">
        <div class="footer1">
            <p>Design by 夏念军  2017年 </p>
        </div>
    </footer>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel"><em>
        mkStone</em></h4>
                </div>
                <div class="modal-body">
                    <p>
                        吾儿，当你出生的那天,洛丹伦的森林中悄声回荡着你的名字“阿尔萨斯”。</p>
                    <p>吾儿,我骄傲地看着你成长为正义的代行者。记住——我们的家族永远用智慧和力量统治。</p>
                    <p>我也知道当你试着使用你巨大的力量的时候,你会保持克制。</p>
                    <p>但真正的胜利,吾儿——是获得你的人民的心</p>
                    <p><strong><em>总有一天我的生命将终抵达终点，而你将加冕为王。</em></strong></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="js/jquery-3.1.1.min.js"></script>
<!-- <script src="js/modernizr.custom.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
<script src="js/about/ns.hover.js"></script>

<script>
  $('.jqhover-ns').nsHover({
      scaling : 1.2,
      speed: 'normal',
      rounded: 'normal',
      bgcolor: '#ccc',
      bgopacity : 0.6,            
      bgpic : 'images/lens.png',
      bgsize : '50%',
      bganim : 'fade',
      shadow : false,
      content: ''
  });
</script> 

</html>