return {
    {
        "olimorris/codecompanion.nvim",
        -- main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
          strategies = {
            chat = {
              adapter = "copilot",
              slash_commands = {
                ["file"] = {
                  -- Location to the slash command in CodeCompanion
                  callback = "strategies.chat.slash_commands.file",
                  description = "Select a file using Telescope",
                  opts = {
                    provider = "telescope", -- Other options include 'default', 'mini_pick', 'fzf_lua', snacks
                    contains_code = true,
                  },
                },
              }
            },
            inline = {
              adapter = "copilot",
            },
          },
          display = {
            action_palette = {
              width = 95,
              height = 10,
              prompt = "Prompt ", -- Prompt used for interactive LLM calls
              opts = {
                show_default_actions = true, -- Show the default actions in the action palette?
                show_default_prompt_library = true, -- Show the default prompt library in the action palette?
              },
              provider="telescope"
            },
            chat = {
              window = {
                border = "single",
                position="right",
                width = 0.4
              }
            },
          }
        }
    }
}
