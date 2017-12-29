[[font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x0 "Hello from the #red programming language:" text 0x34 "!" font make object! [
    name: "Segoe UI"
    size: 10
    style: [bold]
    angle: 0
    color: 120.60.60
    anti-alias?: true
    shadow: none
    state: [#[handle! 2B0A0C8Dh] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 4x34 "Red Console 2017-12-26 16.37.55.png" font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x68 {I just begun writing little libraries and proof-of-concepts for #scuttlebutt interaction from apps built } font make object! [
    name: "Segoe UI"
    size: 10
    style: [bold]
    angle: 0
    color: 120.60.60
    anti-alias?: true
    shadow: none
    state: [#[handle! 2B0A0C8Dh] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x85 "the Red language" font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 108x85 {. Red is a language for fullstack development going from low level Red/System to } text 0x102 {high level Red/Core. It is heavily inspired by REBOL which has always been one of my favorite } text 0x119 {ever. Going back to Red after almost 15 years since I last used REBOL has been quite fun.} text 0x153 "# Why Red is cool?" text 0x187 {Red, just like REBOL is an extremely productive language due to the following reasons (IMHO):} font make object! [
    name: "Segoe UI"
    size: 10
    style: [italic]
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! D00A09D3h] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x221 { More than 50 built-in types. Even URLs and Emails are built-in types, makes it very easy to experiment as } text 0x238 "things are built in the language." font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x255 { Homoiconic language where, like Lisp, code and data have the same representation.} font make object! [
    name: "Segoe UI"
    size: 10
    style: [italic]
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! D00A09D3h] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x272 { Interactive REPL, you can experiment by simply trying things out in the REPL.} font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x289 " Very human readable syntax." font make object! [
    name: "Segoe UI"
    size: 10
    style: [italic]
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! D00A09D3h] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x306 { Small, the whole system is a single file that weights about 1 MB, } font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] font make object! [
    name: "Segoe UI"
    size: 10
    style: [italic]
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! D00A09D3h] none]
    parent: []
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 360x306 "YES ONE MEGABYTE FOR THE WHOLE ENGINE" font make object! [
    name: "Segoe UI"
    size: 10
    style: []
    angle: 0
    color: 30.30.30
    anti-alias?: true
    shadow: none
    state: [#[handle! C70A0C36h] none]
    parent: [make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ] make object! [
        type: 'face
        offset: none
        size: none
        text: none
        image: none
        color: none
        menu: none
        data: none
        enabled?: true
        visible?: true
        selected: none
        flags: none
        options: none
        parent: none
        pane: none
        state: none
        rate: none
        edge: none
        para: none
        font: make object! [...]
        actors: none
        extra: none
        draw: none
        on-change*: func [word old new 
            /local srs same-pane? f saved
        ][
            if system/view/debug? [
                print [
                    "-- on-change event --" lf 
                    tab "face :" type lf 
                    tab "word :" word lf 
                    tab "old  :" type? old lf 
                    tab "new  :" type? new
                ]
            ] 
            if all [word <> 'state word <> 'extra] [
                all [
                    not empty? srs: system/reactivity/source srs/1 = self srs/2 = word 
                    set-quiet in self word old 
                    exit
                ] 
                if word = 'pane [
                    if all [type = 'window object? new new/type = 'window] [
                        cause-error 'script 'bad-window []
                    ] 
                    same-pane?: all [block? old block? new same? head old head new] 
                    if all [not same-pane? block? old not empty? old] [
                        modify old 'owned none 
                        foreach f head old [f/parent: none 
                            if all [block? f/state handle? f/state/1] [system/view/platform/destroy-view f no]
                        ]
                    ] 
                    if type = 'tab-panel [link-tabs-to-parent/init self]
                ] 
                if all [not same-pane? any [series? old object? old]] [modify old 'owned none] 
                unless any [same-pane? find [font para edge actors extra] word] [
                    if any [series? new object? new] [modify new 'owned reduce [self word]]
                ] 
                if word = 'font [link-sub-to-parent self 'font old new] 
                if word = 'para [link-sub-to-parent self 'para old new] 
                if find [field text] type [
                    if word = 'text [
                        set-quiet 'data any [
                            all [not empty? new attempt/safer [load new]] 
                            all [options options/default]
                        ]
                    ] 
                    if 'data = word [
                        either data [
                            if string? text [modify text 'owned none] 
                            set-quiet 'text form data 
                            modify text 'owned reduce [self 'text]
                        ] [
                            clear text
                        ] 
                        saved: 'data 
                        word: 'text
                    ]
                ] system/reactivity/check/only self any [saved word] 
                if state [state/2: state/2 or (1 << ((index? in self word) - 1)) 
                    if all [state/1 system/view/auto-sync?] [show self]
                ]
            ]
        ]
        on-deep-change*: func [owner word target action new index part][
            on-face-deep-change* owner word target action new index part state no
        ]
    ]]
    on-change*: func [word old new][
        if system/view/debug? [
            print [
                "-- font on-change event --" lf 
                tab "word :" word lf 
                tab "old  :" type? :old lf 
                tab "new  :" type? :new
            ]
        ] 
        if word <> 'state [
            if any [series? :old object? :old] [modify old 'owned none] 
            if any [series? :new object? :new] [modify new 'owned reduce [self word]] 
            if all [block? state handle? state/1] [system/view/platform/update-font self (index? in self word) - 1 
                update-font-faces parent
            ]
        ]
    ]
    on-deep-change*: func [owner word target action new index part][
        if all [
            state 
            word <> 'state 
            not find [remove clear take] action
        ] [system/view/platform/update-font self (index? in self word) - 1 
            update-font-faces parent
        ]
    ]
] text 0x323 "all you need to develop is that single file..." text 0x357 {There are many more reasons but those might be enough to pick your curiosity.} text 0x391 "# Why Red for Scuttlebutt Apps?" text 0x425 {Most of our current apps are Electron based, and don't get me wrong, I love #JS and the #Web as } text 0x442 {but all those electron apps have a price in RAM and CPU. Imagine that you're running Firefox, VS } text 0x459 {Patchwork and Slack on your machine. That is 3 Chrome engines and 1 Gecko engine loaded, all } text 0x476 {basically the same thing. That is one of the reasons I also been experimenting with the creation of } text 0x493 {webextensions for ssb as well, so that you can run everything (web, mail, slack, ssb) from a single } text 0x510 {engine. Still, creating ssb tools that are nimble and consume very few resources is desirable if only to } text 0x527 {you to devote your CPU and RAM to other heavy web engines while still enjoying ssb.} text 0x561 {My plan is to build tiny tiny standalone tools that talk to a globally installed _sbot_ and present } text 0x578 {as a native simple GUI. I am thinking about building a #ticktack reader app first, so that you can keep } text 0x595 "of your friends blogs." text 0x629 {Red, just like REBOL, is self documenting, the shot above shows the Red console introspection of the } text 0x646 {library. It understands the object and its functions and provides help to it automatically. Very ergonomic.} text 0x663 " " text 0x680 "  "] 600x697 [#(
    type: area
    offset: 0x0
    size: 262x17
    text: "Hello from the #red programming language:"
) #(
    type: area
    offset: 0x34
    size: 4x17
    text: "!"
) #(
    type: link
    offset: 4x34
    size: 228x17
    text: "Red Console 2017-12-26 16.37.55.png"
    link: &Dt47oPWAf2zDGn3OgOHKG7M7p9UOmn7TkVEMVtSXlRo=.sha256
) #(
    type: area
    offset: 0x68
    size: 583x17
    text: {I just begun writing little libraries and proof-of-concepts for #scuttlebutt interaction from apps built }
) #(
    type: link
    offset: 0x85
    size: 108x17
    text: "the Red language"
    link: http://www.red-lang.org
) #(
    type: area
    offset: 108x85
    size: 480x17
    text: {. Red is a language for fullstack development going from low level Red/System to }
) #(
    type: area
    offset: 0x102
    size: 546x17
    text: {high level Red/Core. It is heavily inspired by REBOL which has always been one of my favorite }
) #(
    type: area
    offset: 0x119
    size: 521x17
    text: {ever. Going back to Red after almost 15 years since I last used REBOL has been quite fun.}
) #(
    type: area
    offset: 0x153
    size: 112x17
    text: "# Why Red is cool?"
) #(
    type: area
    offset: 0x187
    size: 550x17
    text: {Red, just like REBOL is an extremely productive language due to the following reasons (IMHO):}
) #(
    type: area
    offset: 0x221
    size: 588x17
    text: { More than 50 built-in types. Even URLs and Emails are built-in types, makes it very easy to experiment as }
) #(
    type: area
    offset: 0x238
    size: 176x17
    text: "things are built in the language."
) #(
    type: area
    offset: 0x255
    size: 495x17
    text: { Homoiconic language where, like Lisp, code and data have the same representation.}
) #(
    type: area
    offset: 0x272
    size: 428x17
    text: { Interactive REPL, you can experiment by simply trying things out in the REPL.}
) #(
    type: area
    offset: 0x289
    size: 172x17
    text: " Very human readable syntax."
) #(
    type: area
    offset: 0x306
    size: 360x17
    text: { Small, the whole system is a single file that weights about 1 MB, }
) #(
    type: area
    offset: 360x306
    size: 263x17
    text: "YES ONE MEGABYTE FOR THE WHOLE ENGINE"
) #(
    type: area
    offset: 0x323
    size: 245x17
    text: "all you need to develop is that single file..."
) #(
    type: area
    offset: 0x357
    size: 467x17
    text: {There are many more reasons but those might be enough to pick your curiosity.}
) #(
    type: area
    offset: 0x391
    size: 190x17
    text: "# Why Red for Scuttlebutt Apps?"
) #(
    type: area
    offset: 0x425
    size: 581x17
    text: {Most of our current apps are Electron based, and don't get me wrong, I love #JS and the #Web as }
) #(
    type: area
    offset: 0x442
    size: 567x17
    text: {but all those electron apps have a price in RAM and CPU. Imagine that you're running Firefox, VS }
) #(
    type: area
    offset: 0x459
    size: 563x17
    text: {Patchwork and Slack on your machine. That is 3 Chrome engines and 1 Gecko engine loaded, all }
) #(
    type: area
    offset: 0x476
    size: 573x17
    text: {basically the same thing. That is one of the reasons I also been experimenting with the creation of }
) #(
    type: area
    offset: 0x493
    size: 570x17
    text: {webextensions for ssb as well, so that you can run everything (web, mail, slack, ssb) from a single }
) #(
    type: area
    offset: 0x510
    size: 594x17
    text: {engine. Still, creating ssb tools that are nimble and consume very few resources is desirable if only to }
) #(
    type: area
    offset: 0x527
    size: 498x17
    text: {you to devote your CPU and RAM to other heavy web engines while still enjoying ssb.}
) #(
    type: area
    offset: 0x561
    size: 555x17
    text: {My plan is to build tiny tiny standalone tools that talk to a globally installed _sbot_ and present }
) #(
    type: area
    offset: 0x578
    size: 592x17
    text: {as a native simple GUI. I am thinking about building a #ticktack reader app first, so that you can keep }
) #(
    type: area
    offset: 0x595
    size: 126x17
    text: "of your friends blogs."
) #(
    type: area
    offset: 0x629
    size: 589x17
    text: {Red, just like REBOL, is self documenting, the shot above shows the Red console introspection of the }
) #(
    type: area
    offset: 0x646
    size: 608x17
    text: {library. It understands the object and its functions and provides help to it automatically. Very ergonomic.}
) #(
    type: area
    offset: 0x663
    size: 4x17
    text: " "
) #(
    type: area
    offset: 0x680
    size: 8x17
    text: "  "
)]]