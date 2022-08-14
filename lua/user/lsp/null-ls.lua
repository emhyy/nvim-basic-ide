local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" },
			-- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.eslint,
		-- formatting.black.with { extra_args = { "--fast" }},
		formatting.yapf.with({
			extra_args = { "--style={based_on_style: google, column_limit: 100, indent_width: 4}" },
		}),
		formatting.isort,
		formatting.stylua,
		formatting.google_java_format,
		formatting.fixjson,
		formatting.shfmt,
		diagnostics.flake8.with({ extra_args = { "--max-line-length=100" } }),
		diagnostics.eslint,
    code_actions.eslint,
    code_actions.eslint_d,
    code_actions.shellcheck,
    code_actions.refactoring,
	},
})
