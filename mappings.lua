-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
function search_file_telescope(path_arg)
    -- local cwd = vim.fn.stdpath "config" .. "/.."
    -- local cwd = vim.fn.getcwd("$HOME/myworld/")
    local cwd = path_arg
    -- check is dir exists table insert else notify 
    if vim.fn.isdirectory(cwd) == 0 then
      vim.notify("No such directory: " .. cwd, vim.log.levels.ERROR)
      return
    end
    
    local search_dirs = {}
    table.insert(search_dirs, cwd)
    -- for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations
    -- if dir == astronvim.install.home then dir = dir .. "/lua/user" end -- don't search the astronvim core files
    -- if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
    -- end
    if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
      utils.notify("No user configuration files found", vim.log.levels.WARN)
    else
      if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
      require("telescope.builtin").find_files {
        prompt_title = "Search in learn dir",
        search_dirs = search_dirs,
        cwd = cwd,
        follow = true,
      } -- call Telescope
    end
  end


return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
    function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    desc = "Next buffer",
    },
    H = {
    function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    desc = "Previous buffer",
    },

    
    ["<C-e>"] = { "<esc>A", desc = "The end of the line" },
    ["<C-a>"] = { "<esc>I", desc = "The begining of the line" },
    ["<leader>3"] = {":Neotree left reveal<cr>", desc = "Change directory"},

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    ["<leader>TR"] = {
      function()
          require("astronvim.utils").reload()
          local hls_status = vim.v.hlsearch
          for name,_ in pairs(package.loaded) do
            if name:match('^cnull') then
              package.loaded[name] = nil
            end
          end

          dofile(vim.env.MYVIMRC)
          if hls_status == 0 then
            vim.opt.hlsearch = false
          end
          vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
      end,
      desc = "Reload nvim"
    },

    ["<leader>TB"] = {
      function()
        require("dapui").toggle()
        vim.notify("DAPUI Toggled!", vim.log.levels.INFO)
      end,
      desc = "DAPUI Tooggle"
    },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<C-f>"] = { ":HopChar2<cr>", desc = "Find line" },
    ["<leader>T"] = {name= "Toggle"},
    ["<leader>TA"] = { ":AerialToggle<cr>", desc = "Aerial for navigation"},
    ["<leader>TT"] = { ":Telekasten<cr>", desc = "Toggle terminal"},
    ["<leader>TC"] = { ":Cheatsheet<cr>", desc = "Toggle cheatsheet telescope"},
    ["<leader>Tt"] = { ":Calendar -view=clock <cr>", desc = "Toggle clock"},
    ["<leader>Tc"] = { ":Calendar<cr>", desc = "Toggle Calendar"},
    ["<leader>TD"] = { ":DBUIToggle<cr>", desc = "Toggle DBUI"},

    ["<leader>Tm"] = { ":MarkdownHeaders<cr>", desc = "MarkdownHeaders"},

    ["<leader>Tn"] = { ":tabnew<cr>", desc = "Toggle DBUI"},
    -- ["<leader>Y"] = {"<cmd>%yank<cr>", desc = "yank entire buffer" },
    ["<leader>fp"] = { ":Telescope live_grep search_dir='~/myworld/live_coding/'<cr>", desc = "Search files in live_codding"},

    ["<leader>tt"] = { ":ToggleTerm direction=tab<cr>", desc = "ToggleTerm in new tab"},
    ["<leader>tl"] = { ":luafile %<cr>", desc = "Run lua file"},
    ["<leader>N"] = {name= "Notice"},

    -- find files in dir ~/myworld/  
    ["<leader>f."] = {name = "MyWorld"},
    ["<leader>f.c"] = {
      --call function search_file_telescope("$HOME/myworld/live_coding/")
      "<cmd>lua search_file_telescope('$HOME/myworld/code/live_coding')<cr>",
      -- search_file_telescope("$HOME/myworld/live_coding/"),
      -- lua require('telescope.builtin').live_grep({default_text = " ", search_dirs = { "~/myworld/code/" }})
      desc = "Find my live_coding files",
      silent = true,
    },
    ["<leader>f.l"] = {
    "<cmd>lua search_file_telescope('$HOME/myworld/code/learn')<cr>",
    desc = "Find my learn file",
    silent = true,
    },
 
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
["<C-t>"] = { "<C-\\><C-n><cr>", desc = "Escape terminal mode" },
  },
  i = {
    ["<C-f>"] = { "<esc>:HopChar2<cr>", desc = "Find line", noremap = false, silent = false },
    -- rewrite method to work with insert mode instead of normal mode 
    ["<C-e>"] = { "<esc>A", desc = "The end of the line" },
    ["<C-a>"] = { "<esc>I", desc = "The begining of the line" },
  },

  -- vim.api.nvim_set_keymap("n", "<C-e>","<esc>A")
}
