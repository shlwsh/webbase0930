<%--
  DataTables行内增删改查示例页面
  User:jwl
  Date:2016/8/24
  Time:17:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DataTables行内增删改查</title>
    <jsp:include page="/views/inc/head.jsp"></jsp:include>
    <style type="text/css">
        td.details-control {
            background: url('../../assets/images/details_open.png') no-repeat center center !important;
            cursor: pointer;
        }

        tr.shown td.details-control {
            background: url('../../assets/images/details_close.png') no-repeat center center !important;
        }

        td.DTE_EditorDetails:hover {
            background-color: white !important;
        }

        div.dt-buttons {
            float: left;
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
                                        <h2>DataTables行内增删改查</h2>
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
    var data = getFormItemData($("#formQuery"));
    var ajaxurl = "${request.contextPath}/datatable/updata";
    var ajaxurl1 = "${request.contextPath}/datatable/query";
    var reqdatas = {datas: JSON.stringify(data)};

    var columns =
            [
                {
                    className: 'details-control',
                    orderable: false,
                    data: null,
                    defaultContent: ''
                },
                {"title": "业务域编码", "data": "cProcedureCode"},
                {"title": "业务域名称", "data": "cProcedureName"},
                {"title": "医疗机构编码", "data": "cHospitalCode"},
                {"title": "医疗机构名称", "data": "cHospitalName"},
                {"title": "描述", "data": "cDescribe"}
            ];
    var Editor = $.fn.dataTable.Editor;
    Editor.display.details = $.extend(true, {}, Editor.models.displayController, {
        "init": function (editor) {
            return Editor.display.details;
        },
        "open": function (editor, append, callback) {
            var table = $(editor.s.table).DataTable();
            var row = editor.s.modifier;
            Editor.display.details.close(editor);
            table.row(row).child(append).show();
            $(table.row(row).node()).addClass('shown');
            if (callback) {
                callback();
            }
        },
        "close": function (editor, callback) {
            var table = $(editor.s.table).DataTable();
            table.rows().every(function () {
                if (this.child.isShown()) {
                    this.child.hide();
                    $(this.node()).removeClass('shown');
                }
            });
            if (callback) {
                callback();
            }
        }
    });

    var editor = new $.fn.dataTable.Editor({
        "ajax": {
            "url": ajaxurl,
            "dataSrc": "datas",
        },
        table: "#tabQuery",
        idSrc: "cProcedureCode",
        display: "details",
        i18n: {
            create: {
                button: "新增",
                title: "",
                submit: "提交"
            }
        },
        fields: [{
            label: "业务域编码:",
            name: "cProcedureCode",
            type: "hidden"
        }, {
            label: "业务域名称:",
            name: "cProcedureName"
        }, {
            label: "医疗机构:",
            name: "cHospitalCode",
            type: "select",
            options: [
                {label: "请选择", value: "-1"}
                <c:forEach items="${hospitalList}" var="hospital">
                , {label: "${hospital.text}", value: "${hospital.value}"}
                </c:forEach>
            ]
        }, {
            label: "医疗机构名称:",
            name: "cHospitalName",
            type: "hidden"
        }, {
            label: "描述:",
            name: "cDescribe"
        }, {
            label: "是否加密:",
            name: "bEncrypt",
            type: "hidden"
        }
        ]
    });
    //    editor.field("cHospitalName").options("{\"label\":\"1\",\"value\":\"1\"},{\"label\":\"2\",\"value\":\"2\"}");
    var table = $('#tabQuery').DataTable({
        "ajax": {
            "url": ajaxurl1,
            "dataSrc": "datas",
            "data": reqdatas
        },
        deferRender: true,
        classes: 'table',
        dom: "Bfrtip",
        columns: columns,
        columnDefs: [
            {
                "targets": [3],
                "visible": false
            }
        ],
        order: [[1, 'asc']],
        select: {style: 'os'},
        buttons: [
//            'excel', 'pdf', 'print'
            {extend: "create", editor: editor}
        ],
        pageLength: 10,
        lengthChange: false,
        ordering: false,
        searching: false,
        info: true,
        processing: true,
        fixedHeader: {
            headerOffset: 50
        },
        language: {
            sProcessing: "处理中...",
            sLengthMenu: "显示 _MENU_ 项结果",
            sZeroRecords: "没有匹配结果",
            sInfo: "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            sInfoEmpty: "显示第 0 至 0 项结果，共 0 项",
            sInfoFiltered: "(由 _MAX_ 项结果过滤)",
            sInfoPostFix: "",
            sSearch: "搜索：",
            sUrl: "",
            sEmptyTable: "表中数据为空",
            sLoadingRecords: "载入中...",
            // old, obsolete, using sThousands instead
            sInfoThousands: ",",
            sThousands: ",",
            oPaginate: {
                sFirst: "首页",
                sPrevious: "上页",
                sNext: "下页",
                sLast: "末页"
            },
            oAria: {
                sSortAscending: ": 以升序排列此列",
                sSortDescending: ": 以降序排列此列"
            },
            select: {
                rows: {
                    _: "已选择 %d 行",
                    0: "点击选择行1",
                    1: "已选择 1 行"

                }
            }
        }
    });
    $('#tabQuery').on('click', 'td.details-control', function () {
        var tr = this.parentNode;
//        .dataTables
        if (table.row(tr).child.isShown()) {
            editor.close();
        }
        else {
            editor.edit(
                    tr,
                    '',
                    [
                        {
                            "className": "delete",
                            "label": "删除",
                            "fn": function () {
                                // Close the edit display and delete the row immediately
                                editor.close();
                                editor.remove(tr, '', null, false);
                                editor.submit();
                            }
                        }, {
                        "label": "更新",
                        "fn": function () {
                            editor.submit();
                        }
                    }
                    ]
            );
        }
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
