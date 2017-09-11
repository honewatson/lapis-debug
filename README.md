# Install

```bash
luarocks install luaprompt
luarocks install stacktraceplus
luarocks install inspect
```

```moonscript

lapis = require "lapis"
Ldebug = require "ldebug"


class extends lapis.Application
  "/": =>
  	-- create data you want available in the debugger
    random_table = { one: "two", three: { four: "five" } }

	-- set up debugger
    dbg = Ldebug(random_table)

	-- print to lapis server shell
	-- will print out 'random_table' as a string
    dbg\print!

	-- enter interactive debug
	-- 'random_table' will be available as 'ldata'
	-- each root level table key will also be available
	-- in this example 'one', and 'three' will also be available in the interactive debugger
	-- any changes to the root level table values will be available to the request application
    dbg\debug!

	-- makes 'random_table' a string wrapped with <pre> tags to print to the browser
    dbg\html!
```
