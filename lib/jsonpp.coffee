jsonpp = ( json, ident )->
    ident = if ident then ++ident else 1
    str = ''
    prepend = "\n" + jsonpp.repChr ' ', ident
    if typeof json is 'object'
        if json instanceof Array
            for item in json
               result =  jsonpp item, ident+1 
               str += [ prepend, _i, " -> ", result ].join ''
        else
            for _i,item of json
               result = jsonpp item, ident+1
               str += [ prepend, _i, ": ", result ].join ''
    else 
      if typeof json is 'string' then json =  '"' + json + '"'
      str+=json
    return str

jsonpp.repChr = (chr,times) ->
    return new Array( times+1 ).join(chr)

if typeof exports is 'undefined'
    exports = this;
exports.jsonpp = (json)->
  jsonpp(json)