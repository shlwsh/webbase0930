<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid">
    <div class="row-fluie">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li>
                    <a href="/index.jsp" onclick="showAtRight('index.jsp')" class="nav-header menu-first collapsed"
                       data-toggle="collapse">
                        <i class="glyphicon glyphicon-th-large"></i>&nbsp; 首页
                        <span class="sr-only"></span>
                    </a>
                </li>
                <!-- 一级菜单 -->
                <li>
                    <a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-user"></i>&nbsp; 用户管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                </li>
                <!-- 二级菜单 -->
                <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                <ul id="userMeun" class="nav nav-list collapse">
                    <li><a href="/userList" class="menu-second"><i class="fa fa-users"></i> 用户列表</a></li>
                    <li><a href="#" class="menu-second"><i class="fa fa-users"></i> 用户列表1</a>
                    </li>
                    <li><a href="#" class="menu-second"><i class="fa fa-users"></i> 用户列表2</a>
                    </li>
                </ul>

                <li>
                    <a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-globe"></i>&nbsp; 产品管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                </li>
                <ul id="productMeun" class="nav nav-list collapse">
                    <li><a href="#" class="menu-second"><i class="fa fa-list-alt"></i> 产品列表</a></li>
                </ul>

                <li>
                    <a href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-file-text"></i>&nbsp; 订单管理
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                </li>
                <ul id="recordMeun" class="nav nav-list collapse">
                    <li><a href="#" class="menu-second"><i class="fa fa-list"></i> 订单列表</a></li>
                </ul>

                <li>
                    <a href="#datatablesMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-file-text"></i>&nbsp; datatables
                        <span class="pull-right glyphicon glyphicon-chevron-toggle"></span>
                    </a>
                </li>
                <ul id="datatablesMeun" class="nav nav-list collapse">
                    <li><a href="/datatable/0" class="menu-second"><i class="fa fa-list"></i> datatables</a></li>
                    <li><a href="/datatable/1" class="menu-second"><i class="fa fa-list"></i> datatables1</a></li>
                    <li><a href="/datatable/2" class="menu-second"><i class="fa fa-list"></i> datatables2</a></li>
                    <li><a href="/datatable/3" class="menu-second"><i class="fa fa-list"></i> datatables3</a></li>
                    <li><a href="/datatable/4" class="menu-second"><i class="fa fa-list"></i> datatables4</a></li>
                    <li><a href="/datatable/5" class="menu-second"><i class="fa fa-list"></i> datatables5</a></li>
                    <li><a href="/datatable/5" class="menu-second"><i class="fa fa-list"></i> datatables6</a></li>
                </ul>

            </ul>
        </div>
    </div>
</div>