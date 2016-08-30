<%--
  DataTables自定义增删改查页面
  User:jwl
  Date:2016/8/22
  Time:17:52
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>DataTables自定义增删改查</title>
    <jsp:include page="/views/inc/head.jsp"></jsp:include>
    <style type="text/css">
        div.dt-buttons {
            float: right;
        }

        .modern-container {
            background: #fff;
            padding: 5px 10px;
            margin: 0;
            max-width: 1000px;
        }

        .mdn-label {
            font-size: 15px !important;
        }

        .modern-forms .txtarea {
            line-height: 20px;
            margin-top: 10px;
            height: 80px;
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
                        <div id="btnToolQuery" class="btn-group" style="width:440px;">
                            <button type="button" class="btn btn-primary"
                                    onclick="javascript:procedure_queryData();">
                                <i class="fa fa-refresh"></i> 查询
                            </button>
                            <button type="button" class="btn btn-success"
                                    onclick="javascript:procedure_newRow();">
                                <i class="fa fa-plus"></i> 新增
                            </button>
                            <button type="button" class="btn btn-warning"
                                    onclick="javascript:procedure_editRow();">
                                <i class="fa fa-edit"></i> 修改
                            </button>
                            <button type="button" class="btn btn-danger"
                                    onclick="javascript:procedure_deleteRow();">
                                <i class="fa fa-remove"></i> 删除
                            </button>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="main-box clearfix">
                                    <header class="main-box-header clearfix">
                                        <h2>DataTables自定义增删改查</h2>
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
    <div id="modalProcedure" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document" style="width:auto;max-width: 800px;height: auto;min-height: 600px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" onclick="$('#modalProcedure').modal('hide')"
                            aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"></h4>
                </div>
                <div class="modal-body">
                    <div class="modern-forms" id="formEdit_Procedure">
                        <div class="modern-container">
                            <form>
                                <fieldset>
                                    <div class="form-row">
                                        <div class="col col-4">
                                            <div class="field-group prepend-icon">
                                                <input id="cProcedureCode" name="cProcedureCode" type="text"
                                                       class="mdn-input" placeholder=请输入业务域编码
                                                       value="" data-defVal="" onClick="">
                                                <label class="mdn-label">业务域编码</label>
                                                <span class="mdn-icon"><i class="fa fa-edit"></i></span>
                                                <span class="mdn-msg msg-hidden right"></span>
                                                <span class="mdn-bar"></span>
                                            </div>
                                        </div>
                                        <div class="col col-4">
                                            <div class="field-group prepend-icon">
                                                <input id="cProcedureName" name="cProcedureName" type="text"
                                                       class="mdn-input" placeholder=请输入业务域名称
                                                       value="" data-defVal="" onClick="">
                                                <label class="mdn-label">业务域名称</label>
                                                <span class="mdn-icon"><i class="fa fa-edit"></i></span>
                                                <span class="mdn-msg msg-hidden right"></span>
                                                <span class="mdn-bar"></span>
                                            </div>
                                        </div>
                                        <div class="col col-4">
                                            <div class="field-group mdn-select">
                                                <select id="cHospitalCode" name="cHospitalCode" sysc="true" onchange="">
                                                    <option value="-1">请选择</option>
                                                    <option value="713626580">同煤集团总医院</option>
                                                    <option value="713626580_01">同煤集团总医院(小店分院)</option>
                                                </select>
                                                <label class="mdn-label">医疗机构</label>
                                                <span class="mdn-bar"></span>
                                            </div>
                                        </div>
                                        <input name="cHospitalName" id="cHospitalName" value="" type="hidden"/>
                                    </div>
                                </fieldset>
                                <fieldset>
                                    <div class="form-row">
                                        <div class="col col-12">
                                            <div class="field-group prepend-icon">
                                            <textarea id="cDescribe" name="cDescribe" type="text"
                                                      class="txtarea mdn-input" placeholder=请输入描述 value=""
                                                      data-defVal="" rows="3" cols="20"></textarea>
                                                <label class="mdn-label">描述</label>
                                                <span class="mdn-icon"><i class="fa fa-edit"></i></span>
                                                <span class="mdn-msg msg-hidden right"></span>
                                                <span class="mdn-bar"></span>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <input name="bEncrypt" id="bEncrypt" type="hidden">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" onclick="$('#modalProcedure').modal('hide')">关闭</button>
                    <button id="btnProcedureSave" type="button" class="btn btn-success">保存</button>
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
        toolbar: '#btnToolQuery',
        buttons: [],
    });
    procedure_queryData();
    function procedure_queryData() {
        var data = getFormItemData($("#formQuery"));
        table.queryData("/datatable/query", {datas: JSON.stringify(data)});
    }
    function procedure_newRow() {
        var $modal = $("#modalProcedure");
        $modal.find(".modal-title").text("新增");
        clearForm($modal);
        $("#cProcedureCode").val("编码自动生成");
        $("#bEncrypt").val(0);
        $("#btnProcedureSave").unbind();
        $("#btnProcedureSave").click(procedure_saveNew);
        $modal.modal();
    }
    function procedure_editRow() {
        var datas = table.getSelectedDatas();
        if (datas == null || datas.length == 0 || datas.length > 1) {
            swal("错误", "请选择一行数据", "error");
            return;
        }
        var $modal = $("#modalProcedure");
        $modal.find(".modal-title").text("修改");
        clearForm($modal);
        var data = datas[0];
        initFormItemData($("#modalProcedure"), data);
        $("#btnProcedureSave").unbind();
        $("#btnProcedureSave").click(procedure_saveUpdate);
        $modal.modal();
        $modal.on('shown.bs.modal', function (e) {
            initFormSelect($("#modalProcedure"), data);
        })
    }
    function procedure_deleteRow() {
        var datas = table.getSelectedDatas();
        if (datas == null || datas.length == 0 || datas.length > 1) {
            swal("错误", "请选择一行数据", "error");
            return;
        }
        var data = datas[0];
        var cProcedureCode = data.cProcedureCode;
        var bEncrypt = data.bEncrypt;
        swal({
            title: "确定删除",
            text: "是否确定删除此数据",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是的,确定",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            $.ajax({
                type: 'POST',
                data: 'cProcedureCode=' + cProcedureCode + '&bEncrypt=' + bEncrypt,
                url: '${request.contextPath}/procedure/delete',
                success: function (data) {
                    //成功之后
                    if (data.success) {
                        swal({
                            title: "成功",
                            text: "操作成功!",
                            type: "success",
                            showCancelButton: false,
                            confirmButtonText: "确定"
                        }, function () {
                            var newRow = data.data;
                            // 删除table行
                            table.getSelectedRows().remove().draw();
                            $("#modalProcedure").modal('hide');
                        });
                    }
                    else {
                        swal("错误", data.errorMsg, "error");
                    }
                },
                error: function (xhr, type) {
                    swal("错误", "系统发生内部错误!请稍后再试!", "error");
                }
            });
        });
    }
    function procedure_saveNew() {
        $("#cHospitalName").val($("#cHospitalCode").find("option:selected").text());
        var pass = validateItemNotNull($("#cProcedureCode"));
        pass = validateItemNotNull($("#cProcedureName")) && pass;
        if (!pass)
            return;
        swal({
            title: "确定新增",
            text: "是否确定新增此数据",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是的,确定",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var code = new Date().getTime();
            $("#formEdit_Procedure").find("#cProcedureCode").val(code);
            var requestData = $("#formEdit_Procedure form").serialize();
            $.ajax({
                type: 'POST',
                data: requestData,
                url: '${request.contextPath}/procedure/new',
                success: function (data) {
                    //成功之后
                    if (data.success) {
                        swal({
                            title: "成功",
                            text: "操作成功!",
                            type: "success",
                            showCancelButton: false,
                            confirmButtonText: "确定"
                        }, function () {
                            var newRow = data.data;
                            var row = table.dataTables.row.add(newRow).draw().node();
                            $(row).insertBefore(table.dataTables.rows().nodes()[0]);
                            //table.dataTables.row.insert(0,newRow).draw();
                            $("#modalProcedure").modal('hide');
                        });
                    }
                    else {
                        swal("错误", data.errorMsg, "error");
                    }
                },
                error: function (xhr, type) {
                    swal("错误", "系统发生内部错误!请稍后再试!", "error");
                }
            });
        });
    }
    function procedure_saveUpdate() {
        $("#cHospitalName").val($("#cHospitalCode").find("option:selected").text());
        var pass = validateItemNotNull($("#cProcedureCode"));
        pass = validateItemNotNull($("#cProcedureName")) && pass;
        if (!pass)
            return;
        swal({
            title: "确定修改",
            text: "是否确定修改此数据",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "是的,确定",
            cancelButtonText: "取消",
            closeOnConfirm: false
        }, function () {
            var requestData = $("#formEdit_Procedure form").serialize();
            $.ajax({
                type: 'POST',
                data: requestData,
                url: '${request.contextPath}/procedure/update',
                success: function (data) {
                    //成功之后
                    if (data.success) {
                        swal({
                            title: "成功",
                            text: "操作成功!",
                            type: "success",
                            showCancelButton: false,
                            confirmButtonText: "确定"
                        }, function () {
                            var newRow = data.data;
                            var index = table.getSelectedRows()[0];
                            table.dataTables.row(index).data(data.data);
                            $("#modalProcedure").modal('hide');
                        });
                    }
                    else {
                        swal("错误", data.errorMsg, "error");
                    }
                },
                error: function (xhr, type) {
                    swal("错误", "系统发生内部错误!请稍后再试!", "error");
                }
            });
        });
    }
</script>
</body>
</html>
