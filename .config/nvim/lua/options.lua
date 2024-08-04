local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  relativenumber = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
