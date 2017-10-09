<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>mkstone后台管理</title>
  <meta name="description" content="文章管理界面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="images/favicon.ico"  type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link rel="stylesheet" href="css/sweetalert.css">
  
  <style type="text/css">
.fileWrap {
  float: left;
  position: relative;
  width: 100px;
  height: 30px;
  overflow: hidden;
  margin-bottom:10px;
}
.fileWrap input[type=file] {
  position: absolute;
  top: 0;
  left: 0;
  width: 100px;
  height: 30px;
  opacity: 0;
  filter: alpha(opacity=0);
  cursor: pointer;
}
.fileWrap button {
  width: 100%;
  height: 100%;
  background-color: #fff;
  border: 1px solid green;
}
.fileName {
  float: left;
  margin-left: 15px;
  line-height: 30px;
}
</style>

</head>
<body>

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>mkStone</strong> <small>后台管理</small>
  </div>
  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>
  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
        </a>
      </li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>


  <div class="am-cf admin-main">
	  <!-- 侧边栏开始 -->
	  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
	    <div class="am-offcanvas-bar admin-offcanvas-bar">
	      <ul class="am-list admin-sidebar-list">
	        <li><a href="Admin_User"><span class="am-icon-home"></span> 首页</a></li>
	        <li><a href="Admin_Source"><span class="am-icon-table"></span> 资源管理</a></li>
	        <li><a href="Admin_Article"><span class="am-icon-pencil-square-o"></span>文章管理</a></li>
	        <li><a href="Admin_Loginout"><span class="am-icon-sign-out"></span> 注销</a></li>
	      </ul>
	    </div>
	  </div>
  	  <!-- 侧边栏结束 -->


		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">文章管理</strong> / <small>Article</small>
					</div>
				</div>

				<hr>

				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-6">
						<div class="am-btn-toolbar">
							<div class="am-btn-group am-btn-group-xs">
								<button  id="add_article" type="button" class="am-btn am-btn-default" data-toggle="modal" data-target="#xzwz">
									<span class="am-icon-plus"></span> 新增
								</button>
								<button id="multiple_delete" type="button" class="am-btn am-btn-default">
									<span class="am-icon-trash-o"></span> 删除
								</button>
							</div>
						</div>
					</div>
					<div class="am-u-sm-12 am-u-md-3">
						<div class="am-form-group">
							<select id="selectType" data-am-selected="{btnSize: 'sm'}">
								<option value="option1">请选择分类</option>
								<option value="option1">所有类别</option>
								<option value="option2">电脑</option>
								<option value="option3">手机</option>
								<option value="option4">服务器</option>
								<option value="option5">科学上网</option>
							</select>
						</div>
					</div>
					<!-- <div class="am-u-sm-12 am-u-md-3">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field"> <span
								class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button">搜索</button>
							</span>
						</div>
					</div> -->
				</div>

				<div class="am-g">
					<div class="am-u-sm-12">
						<form class="am-form">
							<table id="getByType"
								class="am-table am-table-striped am-table-hover table-main">
								<thead>
									<tr>
										<th class="table-check"><input type="checkbox" /></th>
										<th class="table-id">ID</th>
										<th class="table-title">标题</th>
										<th class="table-author">作者</th>
										<th class="table-type">类别</th>
										<th class="table-date am-hide-sm-only">上传日期</th>
										<th class="table-set">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${articleList }" var="a">
										<tr id="ListSource">
											<td>
                                                <input name="selectFlag" type="checkbox" value="${a.aId }" />
                                            </td>
											<td id="s_id">${a.aId }</td>
											<td style="width:200px;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" id="s_name"><a href="#">${a.aName }</a></td>
											<td id="s_type">${a.aAuthor }</td>
											<td id="s_size" class="am-hide-sm-only">${a.aType }</td>
											<td id="s_date" class="am-hide-sm-only">${a.aDate }</td>
											<td>
												<div class="am-btn-toolbar">
													<div class="am-btn-group am-btn-group-xs">
														<button  class="am-btn am-btn-default am-btn-xs am-text-secondary">
															<a href="edit_article.jsp?aName=${a.aName }" style="text-decoration:none;"><span class="am-icon-pencil-square-o"></span> 编辑</a>
														</button>
														<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
															<a href="DeleteArticleByName?aName=${a.aName }" style="text-decoration:none;"><span class="am-icon-trash-o" style="color:red;"></span> 删除</a>
														</button>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>

							<div id="test"></div>

							<!-- <div class="am-cf">

								共 条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<li class="am-disabled"><a href="#">«</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div> -->
							<hr />

						</form>
					</div>

				</div>
			</div>

			<footer class="admin-content-footer">
				<hr>
				<p class="am-padding-left">Design by 夏念军  2017年 </p>
			</footer>

			</div>
		</div>
		<!-- content end -->
	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<footer>
		<hr>
		<p class="am-padding-left">
			</p>
	</footer>

	


	
	 <div class="modal fade" id="xzwz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog " role="document">
        <div class="modal-content">
          <div class="modal-body" style="background:#eee;padding:20px;">
            <p style="text-align:center;font-size:24px;">新增文章</p>
             <form id="add-artilce" action="ReleaseArticleServlet" method="post" enctype="multipart/form-data">
			    <div class="form-group">
			        <label for="inputText1" class="control-label required">文章标题</label>
			        <input type="text" name="aname" class="form-control"  placeholder="文章标题" required>
			    </div>
			    <div class="form-group">
			        <label for="inputText2" class="control-label required">文章作者</label>
			        <input type="text" name="aauthor" class="form-control" placeholder="文章作者" required>
			    </div>
			    
			    <div class="form-group">
			        <label for="inputText2" class="control-label required">信息分类</label>
			        <input type="text" name="atype" class="form-control" id="stype" placeholder="信息分类" required>
			    </div>
			    <div class="form-group">
			        <label for="inputText2" class=" control-label required">内容描述</label>
			        <script id="editor" type="text/plain" ></script>
			    </div>
			    
			    <div class="form-group">
			        <label for="inputText2" class="control-label">图片上传</label>
			        <div class="form-comtrol">
				        <div class="fileWrap ">
						  <input type="file" name="aapicture">
						  <button type="button">浏览</button>
						</div>
						<span class="fileName">请上传文件</span>
			        </div>
			    </div>
			    
			    <div class="form-group">
			        <input type="submit" class="btn btn-primary btn-block" value="提交" />
			    </div>
			</form>
             
          </div>
         
        </div>
      </div>
    </div>
	
		

	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/ueditor.all.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="js/layer.js"></script>
	<script type="text/javascript" src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/messages_zh.js"></script>
	<script type="text/javascript" src="js/sweetalert.min.js"></script>
	
	
	 
     
     
     <!-- 批量删除 -->
    <script>
    $('#multiple_delete').on('click', function() {
        var idArray = new Array(); //用于保存 选中的那一条数据的ID   

        $("input[name='selectFlag']:checked").each(function() { //遍历所有的name为selectFlag的 checkbox  
            //alert(this.value);   
            idArray.push(this.value); //将选中的值 添加到 array中  
        })
        for (var i = 0; i < idArray.length; i++) {
            console.log(idArray[i]);
        }
        swal({
            title: "确定删除？",
            text: "你将从数据库中删除掉选中所有项",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function(isConfirm) {
            if (isConfirm) {
                //将要集体删除的数据 传递给action处理   
                $.ajax({
                    type: "GET",
                    url: "DeleteArticleById",
                    data: {
                        "id": idArray,
                        traditional: true,
                    }

                });
                swal("删除!", "选中的项目已经被删除.", "success");
                window.location.reload();
            } else {
                swal("取消", "操作已取消 :)", "error");
            }
        });

    });
    </script>
     
     
	<!-- 百度富文本编辑器 -->
	<script type="text/javascript">
		//实例化编辑器
		//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		var ue = UE.getEditor('editor',{
		});
	</script>

	<script>
       $("#selectType").change(function() {
                   var articletype = $("#selectType").find(
                       "option:selected").text();
                   console.log(articletype);
                   $.ajax({
                           type: "POST",
                           url: "Admin_Article",
                           dataType: "text",
                           data: {
                               "articletype": articletype,
                           },
                           success : function(data, textStatus) {
           						location.href="admin-article.jsp?articletype="+articletype;
           				   }
                   });
       })
       
     </script>
     
     
     <script type="text/javascript">
	    /* 模态框居中代码 */
	    function centerModals(){
	        $('.modal').each(function(i){
	            var $clone = $(this).clone().css('display', 'block').appendTo('body');    var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
	            top = top > 0 ? top : 0;
	            $clone.remove();
	            $(this).find('.modal-content').css("margin-top", top);
	        });
	    }
	    $('.modal').on('show.bs.modal', centerModals);
	    $(window).on('resize', centerModals);
	    
	    var $fileName = $('.fileName');
	    $('input[type=file]').change(function() {
	      var path = $(this).val();
	      var fileName = path ? path.substr(path.lastIndexOf('\\') + 1) : '请上传文件';
	      $fileName.text(fileName);
	    });
    </script>
     
   


</body>
</html>
	