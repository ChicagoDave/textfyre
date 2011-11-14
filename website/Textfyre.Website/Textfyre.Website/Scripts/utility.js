
function _StringFormatInline() {
    var txt = this;
    for (var i = 0; i < arguments.length; i++) {
        var exp = new RegExp('\\{' + (i) + '\\}', 'gm');
        txt = txt.replace(exp, arguments[i]);
    }
    return txt;
}

function _StringFormatStatic() {
    for (var i = 1; i < arguments.length; i++) {
        var exp = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
        arguments[0] = arguments[0].replace(exp, arguments[i]);
    }
    return arguments[0];
}

if (!String.prototype.format) {
    String.prototype.format = _StringFormatInline;
}

if (!String.format) {
    String.format = _StringFormatStatic;
}

function htmlEncode(value) {
    return $('<div/>').text(value).html();
}

function htmlDecode(value) {
    return $('<div/>').html(value).text();
}

function checkRequired(obj, reportError) {
    if (obj.value == null || obj.value == "") {
        reportError();
        return false;
    }
    return true;
}

function clearError(field) {
    errorField = getErrorField(field);
    errorField.innerHtml = "";
}

function getErrorField(field) {
    if (field != null) {
        var errorFieldId = field.id + "Error";
        return document.getElementById(errorFieldId);
    }

    return null;
}

//
// This assumes there is a span after an input
//
function setRequiredValidator(field) {
    var errorField = document.getElementById(field.id + "Error");
    var formButton = document.getElementById(field.id.substring(0, 4) + "Submit");
    field.value = "";
    field.isValid = false;
    formButton.style.display = "none";
    field.formButton = formButton;
    errorField.innerText = "*";
    errorField.style.fontWeight = "bold";
    errorField.style.color = "red";
    errorField.style.marginLeft = "2px";
}

function validateRequiredField(field) {
    var errorField = document.getElementById(field.id + "Error");
    var formButton = document.getElementById(field.id.substring(0, 4) + "Submit");
    var keynum = 0;

    if (window.event) // IE
    {
        keynum = event.keyCode
    }
    else if (event.which) // Netscape/Firefox/Opera
    {
        keynum = event.which
    }
    var keychar = String.fromCharCode(keynum).toLowerCase();
 
    if ((field.value == null || field.value == "") && ("0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&*()-_=+[]\{}|;:'`~,./<>?".indexOf(keychar) == -1)) {
        errorField.style.fontWeight = "bold";
        errorField.style.color = "red";
        errorField.innerText = "*";
        field.isValid = false;
    } else {
        errorField.style.fontWeight = "normal";
        errorField.style.color = "black";
        errorField.innerText = "ok";
        field.isValid = true;
    }

    var vFormId = field.id.substring(0, 4);

    if (validateForm(vFormId)) {
        formButton.style.display = "block";
    } else {
        formButton.style.display = "none";
    }
}

function validateForm(formId) {
    var fields = document.getElementsByTagName("input");
    var isValid = true;
    for (f = 0; f < fields.length; f++) {
        if (fields[f].id.substring(0, 4) == formId) {
            if (!fields[f].isValid) {
                isValid = false;
                break;
            }
        }
    }

    return isValid;
}

function loadScript(filename) {
    var fileref = document.createElement('script')
    fileref.setAttribute("type", "text/javascript")
    fileref.setAttribute("src", filename);
    if (typeof fileref != "undefined")
        document.getElementsByTagName("head")[0].appendChild(fileref);
}