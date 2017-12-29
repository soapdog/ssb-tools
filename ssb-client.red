Red [
    Title: "SSB Client Library"
    File: %ssb-client.red
    Author: "Andre Alves Garzia <andre@amoralabs.com>"
    License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
    Tabs: 4
]

#include %json.red

ssb-client: context [
    running?: func [
        "Returns a boolean depending if sbot is running or not"
    ][
        true
    ]

    execute: function [
        "Execute a command in sbot"
        command
        /with-params "Optional parameters for command"
            params "Object with params"
        /raw "Do not process output as JSON"
        /debug "Output the shell command used and the output from stdout"
    ][
        ;if running? [
            out: ""
            shell-command: rejoin ["sbot " command]
            if debug [
                print shell-command
            ]
            either with-params [
                data: json/encode params
                ret: call/wait/input/output shell-command data out 
            ][
                ret: call/wait/output shell-command out 
            ]
            if debug [
                probe out
            ]
            either raw [
                out 
            ][
                json/decode out
            ]
        ;]
    ]

    whoami: function [
        "Gets the default identity for sbot"
    ][
        execute "whoami"
    ]

    get: function [ 
        "Gets a message from the feed."
        message-id
        /debug "Output debug info to console"
    ][
        either debug [
            execute/debug rejoin ["get " message-id]

        ][
            execute rejoin ["get " message-id]
        ]
    ]

    blobs: function [ 
        "Manipulates ssb blobs using refinements"
        /want "Begin searching the network for the blob of the given hash."
            wanted-hash
        /get "Get a blob by its ID."
            blob-id
    ][
        if want [
            execute/raw rejoin ["blobs.want " "^"" wanted-hash "^"" ]
        ]

        if get [
            execute/raw rejoin ["blobs.get " "^"" blob-id "^"" ]
        ]
    ] 
]