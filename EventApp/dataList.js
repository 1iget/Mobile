// https://www.codeproject.com/tips/201899/string-format-in-javascript
// Sample usage.
// var str = "She {1} {0}{2} by the {0}{3}. {-1}^_^{-2}";
// str = str.format(["sea", "sells", "shells", "shore"]);
// alert(str);
function addStringFormat() {
    String.prototype.format = function (args) {
            var str = this;
            return str.replace(String.prototype.format.regex, function(item) {
                var intVal = parseInt(item.substring(1, item.length - 1));
                var replace;
                if (intVal >= 0) {
                    replace = args[intVal];
                } else if (intVal === -1) {
                    replace = "{";
                } else if (intVal === -2) {
                    replace = "}";
                } else {
                    replace = "";
                }
                return replace;
            });
    };
    String.prototype.format.regex = new RegExp("{-?[0-9]+}", "g");
}

function fieldsObjToArr(titles, dataObj) {
    var formatArr = [];
    for ( var i=0 ; i < titles.length ; i++ )
    {
        var model = titles[i].modelName;
        var reqField = dataObj[model];
        formatArr.push(reqField);
    }
    return formatArr;
}

function addTT(control, tipText) {

    control.hoverEnabled = true;
    var toolTipQml = "import QtQuick 2.7\n"
                    + "import QtQuick.Controls 2.1\n"
                    + "ToolTip {\n"
                    + "\tdelay: 1000\n"
                    + "\ttimeout: 5000\n"
                    + "\tvisible: true\n"
                    + "\ttext: qsTr(\"" + tipText + "\")\n"
                    + "}\n";
    console.log("toolTipQml",toolTipQml);
    var newObject = Qt.createQmlObject(toolTipQml, control,"dynamicSnippet1");
    console.log("newObject",newObject);
    control.ToolTip = newObject;
    /*
    control.ToolTip.delay = 1000;
    control.ToolTip.timeout = 5000;
    control.ToolTip.visible = true;
    control.ToolTip.text = qsTr(tipText);*/
}






























