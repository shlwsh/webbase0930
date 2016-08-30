<%--
  DataTables多选示例页面
  User:jwl
  Date:2016/8/22
  Time:17:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DataTables多选</title>
    <jsp:include page="/views/inc/head.jsp"></jsp:include>
    <style type="text/css">
        div.dt-buttons {
            float: right;
        }
    </style>
</head>
<body class="theme-whbl fixed-header fixed-footer">
<!-- 顶部 -->
<jsp:include page="/views/inc/top.jsp"></jsp:include>
<!-- 左侧菜单 -->
<jsp:include page="/views/inc/left.jsp"></jsp:include>
<!-- 右侧内容 -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div id="theme-wrapper">
        <div id="page-wrapper" class="container">
            <div class="row">
                <div id="content-wrapper">
                    <div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box clearfix">
                                    <header class="main-box-header clearfix">
                                        <h2>DataTables多选</h2>
                                        <button type="button" class="btn btn-primary"
                                                onclick="location.href = '/';">
                                            <i class="fa fa-refresh"></i> 返回主页
                                        </button>
                                    </header>
                                    <div class="main-box-body clearfix">
                                        <div class="modern-forms" id="formQuery">
                                            <div class="modern-container">
                                                <form>
                                                    <fieldset>
                                                        <div class="form-row">
                                                            <input type="hidden" name="cACTCode" id="cACTCode"/>
                                                            <input type="hidden" name="cACTName" id="cACTName"/>
                                                        </div>
                                                    </fieldset>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="table-responsive">
                                            <table winning-table id="tabQuery" class="table" width="100%">
                                                <thead>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->
<jsp:include page="/views/inc/bottom.jsp"></jsp:include>

<!-- foot -->
<jsp:include page="/views/inc/foot.jsp"></jsp:include>
<script type="text/javascript">

    $("#tabQuery tbody").on('click', 'tr', function () {
        if (!($(this).find("#selectAction").prop("checked"))) {
            $(this).find("#selectAction").prop("checked", true);
        }
        else {
            $(this).find("#selectAction").prop("checked", false);
        }
        $(this).toggleClass('selected');
    });

    var data = getFormItemData($(".table-responsive"));
    var ajaxurl = "${request.contextPath}/datatable/query";
    var reqdatas = {datas: JSON.stringify(data)};
    var columns =
            [
                {"title": "业务域编码", "data": "cProcedureCode"},
                {"title": "业务域名称", "data": "cProcedureName", "className": "editable"},
                {"title": "医疗机构名称", "data": "cHospitalName", "className": "editable"},
                {"title": "描述", "data": "cDescribe", "className": "editable"}
            ];
    var table = $("#tabQuery").winningTable({
        columns: columns,
        pageLength: 10,
        fixedHeader: true,
        "columnDefs": [{
            "targets": 0,
            "visible": false
        }],
        "createdRow": function (row, data) {
            if (data.active == '1') {
                $(row).toggleClass('selected');
            }
        },
        select: {},
        buttons: [],
    });
    procedure_queryData();
    function procedure_queryData() {
        var data = getFormItemData($("#formQuery"));
        table.queryData("/datatable/query", {datas: JSON.stringify(data)});
    }
</script>
</body>
</html>
