return {
	{
		"mfussenegger/nvim-dap",
		name = "nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "leoluz/nvim-dap-go" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})

			vim.keymap.set("n", "<Leader>dc", dap.continue, {})

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
