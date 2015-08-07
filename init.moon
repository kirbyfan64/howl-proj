import app, signal, Project from howl
import File from howl.io

tstack = {}

handler = (args) ->
  tstack[#tstack+1] = args.file
  if args.file.basename == '-'
    app.window\remove_view!
    fn = tstack[#tstack-1] or File '.howl-proj'
    file = fn\open!
    app\open_file File '.howl-proj' unless tstack[#tstack-1]
    table.insert Project.roots, File '.'
    script = ''
    iscript = false
    for line in file\lines!
      continue if line\gsub("^%s*(.-)%s*$", "%1") == ''
      if iscript
        script ..= line .. '\n'
      elseif line == '!:'
        iscript = true
      else
        app\open_file File line
        app.window\remove_view! if #app.window.views > 1
    app\close_buffer args.buffer
    if script != ''
      f = require('moonscript').loadstring script
      assert f
      f!

signal.connect 'file-opened', handler

{
  info:
    author: 'Ryan Gonzalez'
    description: 'An extended project system'
    license: 'MIT'
  unload: ->
    signal.disconnect 'file-opened', handler
}
