return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'cuda', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', '.clangd', 'CMakeLists.txt', '.git' },
}
