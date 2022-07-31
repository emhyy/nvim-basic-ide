local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
        ensure_installed = {
        "bash", "lua", "dockerfile", "graphql", "javascript", "json", "html", "python", "regex", "scss", "typescript",
        "yaml", "java", "go", "css", "markdown"
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
