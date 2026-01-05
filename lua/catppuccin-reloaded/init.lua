local CatppuccinReloaded = {}

function CatppuccinReloaded.setup(opts)
  local catppuccin = require("catppuccin")
  local paths = vim.api.nvim_get_runtime_file("lua/catppuccin/palettes", true)
  local files = vim.fn.globpath(paths, "*", false, true)
  for i, file in ipairs(files) do
    if catppuccin.flavours[vim.fn.fnamemodify(file, ":t:r")] == nil then
      catppuccin.flavours[vim.fn.fnamemodify(file, ":t:r")] = 4 + i
    end
  end

  catppuccin.setup(opts.catppuccin or {})
end

return CatppuccinReloaded
