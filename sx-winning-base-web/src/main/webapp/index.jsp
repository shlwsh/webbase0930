<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>- 后台管理系统 -</title>
    <!-- head -->
    <jsp:include page="/views/inc/head.jsp"></jsp:include>
</head>

<body>
<!-- 顶部 -->
<jsp:include page="/views/inc/top.jsp"></jsp:include>
<!-- 左侧菜单 -->
<jsp:include page="/views/inc/left.jsp"></jsp:include>
<!-- 右侧内容 -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台
        <small>&nbsp;&nbsp;&nbsp;欢迎使用XXX后台管理系统</small>
    </h1>
    <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
    <div id="content">
        <h4>
            <strong>使用指南：</strong><br>
            <br><br>默认页面内容……
        </h4>
    </div>
</div>
<!-- 底部 -->
<jsp:include page="/views/inc/bottom.jsp"></jsp:include>

<!-- foot -->
<jsp:include page="/views/inc/foot.jsp"></jsp:include>


</body>
</html>