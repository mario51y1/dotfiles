from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from qtile_extras.widget.decorations import BorderDecoration
from modules.keys import mod, keys
from modules.groups import groups

border_color="7E9CD8"
layouts = [
    layout.Columns(border_focus_stack=["#7E9CD8","#7E9CD8"], border_width=3, border_focus="#7E9CD8",margin=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Fira Code",
    fontsize=12,
    padding=3,
    # decorations=[
    #     BorderDecoration(
    #         border_width=[11,0,10,0]
    #     )
    # ]
)
def getDefaultScreen(main_screen=True):
    return Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    rounded=True,
                    fontsize=18,
                    padding_x = 6,
                    padding_y = 6,
                    font='Fira Code Nerf Font',
                    borderwidth=4,
                    highlight_method='block'

                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CheckUpdates(no_update_string='No updates'),
                widget.TextBox('|'),
                widget.Volume(fmt='Vol: {}'),
                widget.TextBox('|'),
                widget.Battery(format='Bat: {percent:2.0%}'),
                widget.TextBox('|'),
                widget.Clock(format="%Y-%m-%d %A %H:%M"),
                widget.TextBox('|'),
                widget.Systray(), 
                widget.QuickExit(),
            ],
            30,
            margin=4,
            border_width=3,  # Draw top and bottom borders
            border_color=border_color,  # Borders are magenta
            background='#1F1F28'
        ),
        wallpaper='~/wallpapers/5117688.jpg',
        wallpaper_mode='fill'
    )

extension_defaults = widget_defaults.copy()
screens = [
    getDefaultScreen(),
    getDefaultScreen(main_screen=False)
] 

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

from libqtile import hook
import os
import subprocess
from modules.groups import apps_to_group_dict
@hook.subscribe.client_new
def client_new(client):
    for app_name,group in apps_to_group_dict.items():
        if app_name == client.name:
            client.togroup(group)

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    #subprocess.call([home])
    subprocess.Popen([home])

