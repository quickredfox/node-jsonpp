# Internal
jsonpp = ( json, ident )->
    str = ''
    ident = if ident then ident+1 else 1
    prepend = "\n" + new Array( ident+1 ).join ' ' 
    if typeof json is 'object'
        if json.length
            for item in json
               result =  jsonpp item, ident+3
               str += [ prepend, _i, ": ", result ].join ''
        else
            for _i,item of json
               result = jsonpp item, ident+3
               str += [ prepend, '"'+_i+'"', ": ", result ].join ''
    else 
      if typeof json is 'string' then json =  '"' + json + '"'
      if json instanceof Date then json = json.getTime()
      str+=json
    return str

# Exposed 
exports.pp = (json,print)->
    unless print is false
        console.log jsonpp json  
    else 
        jsonpp json
  
