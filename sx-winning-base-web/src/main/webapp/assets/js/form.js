function clearForm(element) {
    var $form = $(element).find("form");
    if ($form == null)
        return;

    clearFormValidateMsg($form);

    $form.find("input[type!='checkbox'][type!='radio']").each(function (i, element) {
        var $input = $(element);
        var defaultValue = $input.data("defVal");
        if (defaultValue == null)
            defaultValue = "";
        $input.val(defaultValue);
    });

    $form.find("input[type='checkbox']").each(function (i, element) {
        var $input = $(element);
        var name = $input.attr("name");
        $input.prop("checked", true);
    })

    $form.find("textarea").each(function (i, element) {
        var $input = $(element);
        var defaultValue = $input.data("defVal");
        if (defaultValue == null)
            defaultValue = "";
        $input.val(defaultValue);
    });

    $form.find("select").each(function (i, element) {
        $(element).get(0).selectedIndex = 0;
        if (!$(element).attr("sysc")) {
            $(element).empty();
        }
    });

    $form.find(".select2-selection__rendered").each(function (i, element) {
        $(element).html("请选择");
        $(element).attr("title", "");
    });
}


function validateItemNotNull(element) {
    var $input = element;
    var value = $input.val();
    if (value == null || value == "") {
        $input.parent(".field-group").addClass("mdn-error");
        $input.parent(".field-group").find(".mdn-msg").text("数据不能为空");
        $input.parent(".field-group").find(".mdn-msg").removeClass("msg-hidden");
        return false;
    }
    else
        return true;
}

function clearFormValidateMsg(element) {
    $(element).find(".field-group .mdn-msg").each(function (i, element) {
        var $msg = $(element);
        $msg.parent(".field-group").removeClass("mdn-error");
        $msg.text("");
    });
}

function validateFormItems(element) {
    var $form = $(element).find("form");
    if ($form == null)
        return;

    var pass = true;
    $form.find("input").each(function (i, element) {
        var $input = $(element);
        var notnull = $input.attr("notNull");
        if (notnull != null) {
            pass = validateItemNotNull($(element));
        }
    });
}


function initFormItemData(element, data) {
    var $form = $(element).find("form");
    if ($form == null)
        return;

    $form.find("input[type!='checkbox'][type!='radio']").each(function (i, element) {
        var $input = $(element);
        var name = $input.attr("name");
        var value = data[name];
        $input.val(value);
    });

    $form.find("input[type='checkbox']").each(function (i, element) {
        var $input = $(element);
        var name = $input.attr("name");
        var value = data[name];
        $input.attr("checked", value);
    })

    $form.find("textarea").each(function (i, element) {
        var $input = $(element);
        var name = $input.attr("name");
        var value = data[name];
        $input.val(value);
    });
}

function initFormSelect(element, data) {
    var $form = $(element).find("form");
    if ($form == null)
        return;

    $form.find("select").each(function (i, element) {
        var $select = $(element);
        var id = "select2-" + $select.attr("id") + "-container";
        var name = $select.attr("name");
        var value = data[name];
        $select.val(value);
        $('#' + id).html($select.find("option:selected").text());
    });

}


function getFormItemData(element) {
    var $form = $(element).find("form");
    if ($form == null)
        return [];

    var data = {};

    //遍历所有input=text项目
    $form.find("input").each(function (i, element) {
        var $input = $(element);
        var name = $input.attr("name");
        var value = $input.val();
        if (value != null && value != "" && name != null && name != "") {
            data[name] = value;
            //datas.push(data);
        }
    });

    $form.find("select").each(function (i, element) {
        var $select = $(element);
        var name = $select.attr("name");
        var value = $select.val();
        if (value != null && value != "" && name != null && name != "") {
            data[name] = value;
            //datas.push(data);
        }
    });

    $form.find("textarea").each(function (i, element) {
        var $select = $(element);
        var name = $select.attr("name");
        var value = $select.val();
        if (value != null && value != "" && name != null && name != "") {
            data[name] = value;
            //datas.push(data);
        }
    });

    return data;
}