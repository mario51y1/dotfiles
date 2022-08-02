from modules.keys import keys, mod
from libqtile.lazy import lazy
from libqtile.config import Key, Group, Match
workspaces = [
        {
        "name": "Ⅰ", 
        "key": "1", 
        "matches": [], 
        "lay": "bsp"
    },
    {   
        "name": "Ⅱ", "key": "2", 
        "matches": [
            #Match(wm_class="emacs")
        ], 
        "lay": "bsp"
    },
    {   
        "name": "Ⅲ", "key": "3", 
        "matches": [
            #Match(wm_class="emacs")
        ], 
        "lay": "bsp"
    },
    {
        "name": "", "key": "4",
        "matches": [Match(wm_class="brave")], 
        "lay": "bsp"
    },
    {
        "name": "",
        "key": "5",
        "matches": [
            Match(wm_class="thunderbird"),
            # Match(wm_class="ptask"),
            # Match(wm_class="io.elementary.calendar"),
        ],
        "lay": "bsp",
    },

    {
        "name": "",
        "key": "6",
        "matches": [
            Match(wm_class="slack"),
            Match(wm_class="discord"),
            Match(wm_class="srain"),
        ],
        "lay": "bsp",
    },
    {
        "name": "♬",
        "key": "7",
        "matches": [Match(wm_class="spotify")],
        "lay": "bsp",
    },
    {
        "name": "",
        "key": "8",
        "matches": [Match(wm_class="thunar")],
        "lay": "bsp",
    },
    {
        "name": "",
        "key": "9",
        "matches": [
            Match(wm_class="lxappearance"),
            Match(wm_class="pavucontrol"),
        ],
        "lay": "floating",
    },
]

groups = [
    # ScratchPad(
    #     "scratchpad",
    #     [
    #         # define a drop down terminal.
    #         DropDown(
    #             "term",
    #             "alacritty --class dropdown -e tmux new -As Dropdown",
    #             height=0.6,
    #             on_focus_lost_hide=False,
    #             opacity=1,
    #             warp_pointer=False,
    #         ),
    #     ],
    # ),
]

for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout=workspace["lay"]))
    keys.append(
        Key(
            [mod],
            workspace["key"],
            lazy.group[workspace["name"]].toscreen(toggle=True),
            desc="Focus this desktop",
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]),
            desc="Move focused window to another group",
        )
    )
