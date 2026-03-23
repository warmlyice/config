function Run-Neovim-Custom {
    nvim -u "D:\workspace\config\nvim\init.lua" $args
}

Set-Alias vv Run-Neovim-Custom
Set-Location "D:\workspace"
# 终端里显示中文
chcp 936
