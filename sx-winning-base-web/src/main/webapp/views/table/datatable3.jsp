<%--
  DataTables穿梭示例页面
  User:jwl
  Date:2016/8/24
  Time:17:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DataTables穿梭</title>
    <jsp:include page="/views/inc/head.jsp"></jsp:include>
    <style type="text/css">
        body {
            color: #555;
            font-size: 12px;
            background: #fff;
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
                                        <h2>DataTables穿梭</h2>
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
                                        <div class="tab-pane active" id="tab-table1">
                                            <table id="myTable1" class="table table-striped table-bordered"
                                                   cellspacing="0" width="100%">
                                                <thead>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="tab-table2">
                                            <table id="myTable2" class="table table-striped table-bordered"
                                                   cellspacing="0" width="100%">
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
    var data = getFormItemData($("#formQuery"));
    var ajaxurl = "${request.contextPath}/datatable/updata";
    var ajaxurl1 = "${request.contextPath}/datatable/query";
    var reqdatas = {datas: JSON.stringify(data)};
    var columns1 =
            [
                {"title": "业务域编码", "data": "cProcedureCode"},
                {"title": "业务域名称", "data": "cProcedureName"},
                {"title": "医疗机构编码", "data": "cHospitalCode"},
                {"title": "医疗机构名称", "data": "cHospitalName"},
                {"title": "描述", "data": "cDescribe"},
                {
                    "title": "操作",
                    "data": null,
                    "className": "center",
                    "defaultContent": "<button type=\"button\" id=\"t_remove\" class=\"btn btn-link btn-sm\">移除</button>"
                }
            ];
    var columns2 =
            [
                {"title": "业务域编码", "data": "cProcedureCode"},
                {"title": "业务域名称", "data": "cProcedureName"},
                {"title": "医疗机构编码", "data": "cHospitalCode"},
                {"title": "医疗机构名称", "data": "cHospitalName"},
                {"title": "描述", "data": "cDescribe"},
                {
                    "title": "操作",
                    "data": null,
                    "className": "center",
                    "defaultContent": "<button type=\"button\" id=\"x_select\" class=\"btn btn-link btn-sm\">选择</button>"
                }
            ];
    var table1 = $('#myTable1').winningTable({
        "ajax": {
            "url": ajaxurl1,
            "dataSrc": "datas",
            "data": reqdatas
        },
        scrollY: 200,
        scrollCollapse: true,
        deferRender: true,
        dom: "Bfrtip",
        columns: columns1,
        columnDefs: [
            {
                "targets": [3],
                "visible": false
            }
        ],
        order: [[1, 'asc']],
        select: true,
        buttons: [
            'excel', 'pdf', 'print'
        ]
    });
    var table2 = $('#myTable2').winningTable({
        "ajax": {
            "url": ajaxurl1,
            "dataSrc": "datas",
            "data": reqdatas
        },
        deferRender: true,
        searching: true,
        dom: "Bfrtip",
        columns: columns2,
        columnDefs: [
            {
                "targets": [3],
                "visible": false
            }
        ],
        order: [[1, 'asc']],
        select: true,
        toolbar: '#btnToolQuery',
        buttons: [
            'excel', 'pdf', 'print'
        ]
    });
    table2.dataTables.search("Y").draw();

    $('#myTable1').on("click", "#t_remove", function () {
        //移除选中信息
        table1.dataTables.row($(this).closest('tr')).remove().draw();
    });
    $('#myTable2').on("click", "#x_select", function () {
        //将选中信息移动至table1
        var item = table2.dataTables.row($(this).closest('tr')).data();
        table1.dataTables.row.add(item).draw().node();
    });
    //    procedure_queryData();
    function procedure_queryData() {
        var data = getFormItemData($("#formQuery"));
        table.queryData("/datatable/query", {datas: JSON.stringify(data)});
//        var row = "Object{\"cProcedureCode\":\"1\",\"cProcedureName\":\"1\",\"cHospitalName\":\"1\",\"cDescribe\":\"1\"}";
//        table.dataTables.row.add(row).draw().node();
    }

</script>
</body>
</html>
