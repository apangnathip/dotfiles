# pyright: basic
# modified catpuccin to pywal


def hex_to_rgb(color):
    return tuple(bytes.fromhex(color.strip("#")))


def rgb_to_hex(color):
    return "#%02x%02x%02x" % (*color,)


def lighten(color, amount):
    ctup = hex_to_rgb(color)
    nctup = []
    for col in ctup:
        nctup.append(int(col + (255 - col) * (amount / 100)))
    return rgb_to_hex(nctup)


def darken(color, amount):
    ctup = hex_to_rgb(color)
    nctup = []
    for col in ctup:
        nctup.append(int(col * (1 - (amount / 100))))
    return rgb_to_hex(nctup)


def blend_color(color, color2):
    r1, g1, b1 = hex_to_rgb(color)
    r2, g2, b2 = hex_to_rgb(color2)
    r3 = int(0.5 * r1 + 0.5 * r2)
    g3 = int(0.5 * g1 + 0.5 * g2)
    b3 = int(0.5 * b1 + 0.5 * b2)
    return rgb_to_hex((r3, g3, b3))


def get_pywal_colors():
    colors = {}
    with open("/home/alpan/.cache/wal/colors", "r") as file:
        for i, line in enumerate(file):
            colors[i] = line.strip()
    colors["bg"] = colors[0]
    colors["fg"] = colors[15]
    colors["bg+3"] = lighten(colors["bg"], 20)
    colors["bg+2"] = lighten(colors["bg"], 10)
    colors["bg+1.5"] = lighten(colors["bg"], 7)
    colors["bg+1"] = lighten(colors["bg"], 5)
    colors["fg-1"] = darken(colors["fg"], 10)
    colors["fg-2"] = darken(colors["fg"], 20)
    colors["fg-3"] = darken(colors["fg"], 30)
    colors["red"] = blend_color("#AA0000", colors[6])
    colors["green"] = blend_color("#00AA00", colors[6])
    colors["blue"] = blend_color("#0000AA", colors[6])
    colors["yellow"] = blend_color("#AAAA00", colors[6])
    return colors


get_pywal_colors()


def setup(c):
    colors = get_pywal_colors()

    # completion menu, e.g. when opening links
    c.colors.completion.category.bg = colors["bg+1"]
    c.colors.completion.category.border.bottom = colors["bg"]
    c.colors.completion.category.border.top = colors["bg+1"]
    c.colors.completion.category.fg = colors[1]
    c.colors.completion.even.bg = colors["bg"]
    c.colors.completion.odd.bg = c.colors.completion.even.bg
    c.colors.completion.fg = colors["fg-1"]

    c.colors.completion.item.selected.bg = colors[7]
    c.colors.completion.item.selected.border.bottom = colors[7]
    c.colors.completion.item.selected.border.top = c.colors.completion.item.selected.bg
    c.colors.completion.item.selected.fg = colors["bg+1"]
    c.colors.completion.item.selected.match.fg = colors[2]
    c.colors.completion.match.fg = colors[2]

    c.colors.completion.scrollbar.bg = colors["bg"]
    c.colors.completion.scrollbar.fg = colors["fg-2"]

    c.colors.downloads.bar.bg = colors["bg"]
    c.colors.downloads.error.bg = colors["bg"]
    c.colors.downloads.start.bg = colors["bg"]
    c.colors.downloads.stop.bg = colors["bg"]

    c.colors.downloads.error.fg = colors["red"]
    c.colors.downloads.start.fg = colors["blue"]
    c.colors.downloads.stop.fg = colors["green"]
    c.colors.downloads.system.fg = "none"
    c.colors.downloads.system.bg = "none"

    # link hints
    c.colors.hints.bg = colors[2]
    c.colors.hints.fg = colors["bg"]
    c.colors.hints.match.fg = colors[6]
    c.colors.keyhint.bg = colors["bg"]
    c.colors.keyhint.fg = colors["fg"]
    c.colors.keyhint.suffix.fg = colors["fg-2"]
    c.hints.border = f"1px solid {colors['bg']}"

    c.colors.messages.error.bg = colors["bg+1"]
    c.colors.messages.info.bg = colors["bg+1"]
    c.colors.messages.warning.bg = colors["bg+1"]
    c.colors.messages.error.border = colors["bg+1"]
    c.colors.messages.info.border = colors["bg+1"]
    c.colors.messages.warning.border = colors["bg+1"]

    c.colors.messages.error.fg = colors["red"]
    c.colors.messages.info.fg = colors["fg"]
    c.colors.messages.warning.fg = colors["yellow"]

    c.colors.prompts.bg = colors["bg"]
    c.colors.prompts.border = "1px solid " + colors[7]
    c.colors.prompts.fg = colors[15]

    c.colors.prompts.selected.bg = colors[7]
    c.colors.prompts.selected.fg = colors["bg+1"]

    c.colors.statusbar.normal.bg = colors["bg"]
    c.colors.statusbar.insert.bg = colors["bg+3"]
    c.colors.statusbar.command.bg = colors["bg"]
    c.colors.statusbar.caret.bg = colors["bg"]
    c.colors.statusbar.caret.selection.bg = colors["bg"]

    c.colors.statusbar.progress.bg = colors["bg"]
    c.colors.statusbar.passthrough.bg = colors["bg"]

    c.colors.statusbar.normal.fg = colors[15]
    c.colors.statusbar.insert.fg = colors[6]
    c.colors.statusbar.command.fg = colors[15]
    c.colors.statusbar.passthrough.fg = colors[4]
    c.colors.statusbar.caret.fg = colors[4]
    c.colors.statusbar.caret.selection.fg = colors[4]

    c.colors.statusbar.url.error.fg = colors["red"]
    c.colors.statusbar.url.fg = colors[15]
    c.colors.statusbar.url.hover.fg = colors[6]
    c.colors.statusbar.url.success.http.fg = colors["blue"]
    c.colors.statusbar.url.success.https.fg = colors["green"]
    c.colors.statusbar.url.warn.fg = colors["yellow"]

    c.colors.statusbar.private.bg = "black"
    c.colors.statusbar.private.fg = "white"
    c.colors.statusbar.command.private.bg = "black"
    c.colors.statusbar.command.private.fg = "white"

    c.colors.tabs.bar.bg = colors["bg"]
    c.colors.tabs.even.bg = colors["bg+1.5"]
    c.colors.tabs.odd.bg = colors["bg+1"]

    c.colors.tabs.even.fg = colors["fg-3"]
    c.colors.tabs.odd.fg = colors["fg-3"]

    c.colors.tabs.indicator.error = colors["red"]
    c.colors.tabs.indicator.system = "none"

    c.colors.tabs.selected.even.bg = colors["bg"]
    c.colors.tabs.selected.odd.bg = colors["bg"]

    c.colors.tabs.selected.even.fg = colors["fg"]
    c.colors.tabs.selected.odd.fg = colors["fg"]

    c.colors.contextmenu.menu.bg = colors["bg"]
    c.colors.contextmenu.menu.fg = colors["fg"]

    c.colors.contextmenu.disabled.bg = colors["bg+1"]
    c.colors.contextmenu.disabled.fg = colors["fg-3"]

    c.colors.contextmenu.selected.bg = colors["fg-3"]
    c.colors.contextmenu.selected.fg = colors["bg"]
