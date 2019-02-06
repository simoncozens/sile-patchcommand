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

return { documentation = [[\begin{document}

This package is intended to be used by other package developers. It redefines
a command, running additional code either both its execution, after it, or
both:

\begin{verbatim}
    SILE.patchCommand("chapter", \{
      before = function() print("I am run before a chapter heading") end,
      after  = function() print("I am run after a chapter heading") end
    \})
\end{verbatim}

\end{document}]] }
