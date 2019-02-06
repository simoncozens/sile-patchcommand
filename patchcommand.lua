SILE.patchCommand = function(command, opts)
  local oldcommand = SILE.Commands[command]
  if not oldcommand then
    SILE.error("Attempted to patch non-existing command "..command)
  end
  SILE.Commands[command] = function(options, content)
    if opts["before"] then
      opts["before"](options,content)
    end
    oldcommand(options,content)
    if opts["after"] then
      opts["after"](options,content)
    end
  end
end