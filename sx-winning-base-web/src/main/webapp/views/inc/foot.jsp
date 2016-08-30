<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/sweetalert.min.js"></script>

<!-- datatables -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.bootstrap.min.js"></script>
<!-- autoFill 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.autoFill.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/autoFill.bootstrap.min.js"></script>
<!-- buttons 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/buttons.bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/buttons.print.min.js"></script>
<!-- colReorder 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.colReorder.min.js"></script>
<!-- fixedColumns 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.fixedColumns.min.js"></script>
<!-- fixedHeader 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.fixedHeader.min.js"></script>
<!-- keyTable 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.keyTable.min.js"></script>
<!-- responsive 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.responsive.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/responsive.bootstrap.min.js"></script>
<!-- rowReorder 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.rowReorder.min.js"></script>
<!-- scroller 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.scroller.min.js"></script>
<!-- select 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.select.min.js"></script>
<!-- select 扩展 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/dataTables.editor.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/editor.bootstrap.min.js"></script>

<!-- 其他 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/jszip.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/pdfmake.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/datatables/js/vfs_fonts.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/winning-table.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/form.js"></script>

<script type="text/javascript">
    /*
     * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
     * （实现左侧菜单中的标签点击后变色的效果）
     */
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            $(this).toggleClass("active");
        });

//        $('.menu-second').click(function () {
//            $(".menu-second-selected").each(function () {
//                $(this).attr("class", "menu-second");
//                $(this).css("background-color", "#f6f6f6");
//            });
//            var href = $(this).parent().parent().attr("id");
//            $("[href='#" + href + "']").parent().addClass("active"); //选中
//            $("[href='#" + href + "']").removeClass("collapsed"); //改变箭头
//            $(this).parent().parent().attr("class", "nav nav-list collapse in");
//            $(this).attr("class", "menu-second-selected"); //选中二级
//            $(this).css("background-color", "#66c3ec");
//            $(this).css("text-decoration", "none");
//        });

        $(".nav-header").each(function () {
            var pathname = window.location.pathname;
            if (window.location.pathname == "/") {
                pathname = "/index.jsp";
            }
            if ($(this).attr("href") == pathname) {
                $(this).parent().addClass("active");
            }
        });

        $(".menu-second").each(function () {
            if ($(this).attr("href") == window.location.pathname) {
                var href = $(this).parent().parent().attr("id");
                $("[href='#" + href + "']").parent().addClass("active"); //选中
                $("[href='#" + href + "']").removeClass('collapsed'); //改变箭头
                $(this).parent().parent().attr("class", "nav nav-list collapse in");
                $(this).attr("class", "menu-second-selected"); //选中二级
            }
        });

    });

    /*
     * 解决ajax返回的页面中含有javascript的办法：
     * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
     */
    function executeScript(html) {
        var reg = /<script[^>]*>([^\x00]+)$/i;
        //对整段HTML片段按<\/script>拆分
        var htmlBlock = html.split("<\/script>");
        for (var i in htmlBlock) {
            var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
            if (blocks = htmlBlock[i].match(reg)) {
                //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                var code = blocks[1].replace(/<!--/, '');
                try {
                    eval(code) //执行脚本
                }
                catch (e) {
                }
            }
        }
    }

    /*
     * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
     * 注意：
     *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
     *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
     *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
     */
    function showAtRight(url) {
        if (url.indexOf(".jsp") > 0)
            location.href = url;
        else
            return;

        var xmlHttp;
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlHttp = new XMLHttpRequest();    //创建 XMLHttpRequest对象
        }
        else {
            // code for IE6, IE5
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.onreadystatechange = function () {
            //onreadystatechange — 当readystate变化时调用后面的方法
            if (xmlHttp.readyState == 4) {
                //xmlHttp.readyState == 4    ——    finished downloading response
                if (xmlHttp.status == 200) {
                    //xmlHttp.status == 200        ——    服务器反馈正常
                    document.getElementById("content").innerHTML = xmlHttp.responseText;    //重设页面中id="content"的div里的内容
                    executeScript(xmlHttp.responseText);    //执行从服务器返回的页面内容里包含的JavaScript函数
                }
                //错误状态处理
                else if (xmlHttp.status == 404) {
                    alert("出错了☹   （错误代码：404 Not Found），……！");
                    /* 对404的处理 */
                    return;
                }
                else if (xmlHttp.status == 403) {
                    alert("出错了☹   （错误代码：403 Forbidden），……");
                    /* 对403的处理  */
                    return;
                }
                else {
                    alert("出错了☹   （错误代码：" + request.status + "），……");
                    /* 对出现了其他错误代码所示错误的处理   */
                    return;
                }
            }
        }

        //把请求发送到服务器上的指定文件（url指向的文件）进行处理
        xmlHttp.open("GET", url, true);        //true表示异步处理
        xmlHttp.send();
    }
</script>

