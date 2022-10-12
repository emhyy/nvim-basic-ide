local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		-- formatting.eslint,
		formatting.prettier.with({
			extra_filetypes = { "toml" },
			-- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		-- formatting.black.with { extra_args = { "--fast" }},
		formatting.yapf.with({
			extra_args = { "--style={based_on_style: google, column_limit: 100, indent_width: 4}" },
		}),
		formatting.isort,
		formatting.stylua,
		-- formatting.google_java_format,
		formatting.fixjson,
		formatting.shfmt,
		diagnostics.flake8.with({ extra_args = { "--max-line-length=100" } }),
		diagnostics.eslint,
		-- diagnostics.cspell.with({
		-- 	diagnostic_config = {
		-- 		-- see :help vim.diagnostic.config()
		-- 		-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
		-- 		underline = true,
		-- 		virtual_text = false,
		-- 		signs = false,
		-- 		update_in_insert = false,
		-- 		severity_sort = false,
		-- 	},
		-- }),
		code_actions.eslint,
		code_actions.eslint_d,
		code_actions.shellcheck,
		code_actions.refactoring,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
