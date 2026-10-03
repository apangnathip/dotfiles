---@diagnostic disable: undefined-global

return {
	s({ trig = "html!", snippetType = "autosnippet" },
		fmt(
      [[
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>{}</title>
          </head>
          <body>
            {}
          </body>
        </html>
      ]],
      { i(1, "Title"), i(2) }
    )
	),
}
