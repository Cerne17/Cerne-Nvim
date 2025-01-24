require("cmp").setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- For `mini.snippets` users:
			local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
			insert({ body = args.body }) -- Insert at cursor
			cmp.resubscribe({ "TextChangedI", "TextChangedP" })
			require("cmp.config").set_onetime({ sources = {} })
		end,
	},
})
