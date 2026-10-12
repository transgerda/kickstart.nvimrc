return {
  {
    'nomnivore/ollama.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    -- All the user commands added by the plugin
    cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oo',
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = 'ollama prompt',
        mode = { 'n', 'v' },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        '<leader>oG',
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = 'ollama Generate Code',
        mode = { 'n', 'v' },
      },
    },

    ---@type Ollama.Config
    opts = {
      model = 'mistral',
      url = 'http://192.168.2.4:11434',
      serve = {
        on_start = false,
        command = 'ollama',
        args = { 'serve' },
        stop_command = 'pkill',
        stop_args = { '-SIGTERM', 'ollama' },
      },
      -- View the actual default prompts in ./lua/ollama/prompts.lua
      prompts = {
        Sample_Prompt = {
          prompt = 'This is a sample prompt that receives $input and $sel(ection), among others.',
          input_label = '> ',
          model = 'mistral',
          action = 'display',
        },
      },
    },
  },
  {
    'jacob411/Ollama-Copilot',
    opts = {
      model_name = 'deepseek-coder:base',
      ollama_url = 'http://192.168.2.4:11434', -- URL for Ollama server, Leave blank to use default local instance.
      stream_suggestion = false,
      python_command = 'python3',
      filetypes = { 'python', 'lua', 'vim', 'markdown' },
      capabilities = nil,
      ollama_model_opts = {
        num_predict = 40,
        temperature = 0.1,
      },
      keymaps = {
        suggestion = '<leader>os',
        reject = '<leader>or',
        insert_accept = '<C-S-K>',
      },
    },
  },
}
