local CatppuccinReloaded = {}

function CatppuccinReloaded.setup(opts)
  local catppuccin = require("catppuccin")
  local paths = vim.api.nvim_get_runtime_file("lua/catppuccin/palettes/", true)
  -- those four are already shipped by default
  local seen = { latte = true, frappe = true, macchiato = true, mocha = true }
  local offset = 4

  for _, dir in ipairs(paths) do
    local files = vim.fn.readdir(dir)
    table.sort(files)
    for _, file in ipairs(files) do
      local name = vim.fn.fnamemodify(file, ":t:r")
      if file ~= "init.lua" and not seen[name] then
        seen[name] = true
        catppuccin.flavours[name] = offset + 1
        offset = offset + 1
      end
    end
  end

  catppuccin.setup(opts.catppuccin)
end

return CatppuccinReloaded
