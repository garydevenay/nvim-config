local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "gopls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- typescript
lspconfig.tsserver.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
})

-- golang
lspconfig.gopls.setup({
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
	on_attach = function(client, bufnr)
		local augroup = vim.api.nvim_create_augroup("LspAutocommands", { clear = true })
		local function go_organize_imports_sync(timeout_ms)
			local params = vim.lsp.util.make_range_params()
			params.context = { only = { "source.organizeImports" } }

			local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, timeout_ms)
			if result then
				for _, res in pairs(result) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(client.id) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
			end
		end

		-- Autocmd for organizing imports and running gofumpt before saving
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				go_organize_imports_sync(1000)
				vim.lsp.buf.format({ bufnr = bufnr, async = false })
			end,
		})
	end,
})
