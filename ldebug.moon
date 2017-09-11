inspect = require "inspect"
STP = require "StackTracePlus"
debug.traceback = STP.stacktrace

--- Ldebug for Lapis
-- debug_data = { :some, :local_table, :vars }
-- dbg = Ldebug(debug_data)
-- dbg\print!
-- dbg\debug!
-- dbg\html!debug_data)
-- dbg\print!
-- dbg\debug!
-- dbg\html!
-- 
class Ldebug
  new: (@data) =>

  tostring: () =>
    out = inspect @data
    out

  html: () =>
    "<pre>#{@tostring!}</pre>"

  print: () =>
    print @tostring!
    
  debug: () =>
    prompt = require "prompt"
    prompt.colorize = true
    prompt.name = "myprompt"
    prompt.history = "/tmp/.myprompt_history"
    prompt.prompts = {"%  ", "%% "}
    _G.ldata = @data
    for k, v in pairs ldata
      _G[k] = v
    prompt.enter()
