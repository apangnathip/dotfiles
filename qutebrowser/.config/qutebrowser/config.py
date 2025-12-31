# pyright: basic, reportMissingImports=false
c = c  # pyright: ignore
config = config  # pyright: ignore

import theme

config.load_autoconfig(False)

theme.setup(c)

c.auto_save.session = True
c.scrolling.smooth = True
c.editor.command = [
    "ghostty",
    "-e",
    "nvim",
    "{file}",
    "+startinsert",
    "+call cursor({line}, {column})",
]

c.tabs.title.format = "{audio}{current_title}"
c.tabs.padding = {"top": 5, "bottom": 5, "left": 9, "right": 9}
c.tabs.last_close = "close"
c.tabs.indicator.width = 0

c.fonts.default_family = ["Inter"]
c.fonts.default_size = "10pt"

c.content.blocking.method = "both"
c.content.blocking.enabled = True
c.content.javascript.clipboard = "access"
c.colors.webpage.preferred_color_scheme = "dark"

config.set("colors.webpage.darkmode.enabled", True, "qute://*")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:135.0) Gecko/20100101 Firefox/135",
    "https://accounts.google.com/*",
)

config.unbind("d")
config.unbind(":")
config.bind("q", "tab-close")
config.bind("Q", "macro-record")
config.bind("cs", "config-source")
config.bind("gj", "tab-move +")
config.bind("gk", "tab-move -")
config.bind("gm", "tab-move")
config.bind("gn", "open -p")
config.bind("<Ctrl-=>", "zoom-in")
config.bind("<Ctrl-->", "zoom-out")
config.bind("<Ctrl-0>", "zoom")
config.bind("<Ctrl-1>", "tab-focus 1")
config.bind("<Ctrl-2>", "tab-focus 2")
config.bind("<Ctrl-3>", "tab-focus 3")
config.bind("<Ctrl-4>", "tab-focus 4")
config.bind("<Ctrl-5>", "tab-focus 5")
config.bind("<Ctrl-6>", "tab-focus 6")
config.bind("<Ctrl-7>", "tab-focus 7")
config.bind("<Ctrl-8>", "tab-focus 8")
config.bind("<Ctrl-9>", "tab-focus -1")
config.bind("<Ctrl-m>", "tab-mute")
config.bind("<Ctrl-o>", "open -t")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind(";", "cmd-set-text :")
config.bind(":I", "hint images tab")
config.bind(":O", "hint links fill :open -t -r {hint-url}")
config.bind(":R", "hint --rapid links window")
config.bind(":Y", "hint links yank-primary")
config.bind(":b", "hint all tab-bg")
config.bind(":d", "hint links download")
config.bind(":f", "hint all tab-fg")
config.bind(":h", "hint all hover")
config.bind(":i", "hint images")
config.bind(":o", "hint links fill :open {hint-url}")
config.bind(":r", "hint --rapid links tab-bg")
config.bind(":t", "hint inputs")
config.bind(":y", "hint links yank")
config.bind(":<Ctrl-I>", "edit-text", mode="insert")
