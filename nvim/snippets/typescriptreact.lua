---@diagnostic disable: undefined-global

return {
	s({ trig = "trycatch", snippetType = "autosnippet" },
		fmta(
      [[
        try {
          <>
        } catch(err) {
          console.error(err);
        }
      ]],
      { i(1) }
    )
	),
}
