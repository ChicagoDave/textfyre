//
// Zifmia-HTMLFormatting.js
//
// This file is required to convert raw channel text to pretty html.
//
//

function _StringFormatHtmlInline() {
    var txt = this;

    txt = '<div class="paragraph">' + txt.replace(new RegExp('\\n', 'g'), '</div><div class="paragraph">') + '</div>';         // replaces newlines with paragraph styling.

    // check for JSON markup
    while (txt.indexOf('{') >= 0) {
        var left = txt.indexOf('{');
        var right = txt.indexOf('}');

        // extract the json data
        var jsonText = txt.substring(left, right);

        // remove the json data, for now
        txt = txt.replace(jsonText, '');        
    }

    return txt;
}

if (!String.prototype.toHtml) {
    String.prototype.toHtml = _StringFormatHtmlInline;
}
