(function() {
  var exports, jsonpp;
  var __hasProp = Object.prototype.hasOwnProperty;
  jsonpp = function(json, ident) {
    var _i, _len, item, prepend, result, str;
    ident = ident ? ++ident : 1;
    str = '';
    prepend = "\n" + jsonpp.repChr(' ', ident);
    if (typeof json === 'object') {
      if (json instanceof Array) {
        for (_i = 0, _len = json.length; _i < _len; _i++) {
          item = json[_i];
          result = jsonpp(item, ident + 1);
          str += [prepend, _i, " -> ", result].join('');
        }
      } else {
        for (_i in json) {
          if (!__hasProp.call(json, _i)) continue;
          item = json[_i];
          result = jsonpp(item, ident + 1);
          str += [prepend, _i, ": ", result].join('');
        }
      }
    } else {
      if (typeof json === 'string') {
        json = '"' + json + '"';
      }
      str += json;
    }
    return str;
  };
  jsonpp.repChr = function(chr, times) {
    return new Array(times + 1).join(chr);
  };
  if (typeof exports === 'undefined') {
    exports = this;
  }
  exports.jsonpp = function(json) {
    return jsonpp(json);
  };
}).call(this);