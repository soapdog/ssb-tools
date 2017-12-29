Red [
    Title: "view-message"
    File: %view-message.red
    Author: "Andre Alves Garzia <andre@amoralabs.com>"
    License: "BSD-3 - https://github.com/red/red/blob/master/BSD-3-License.txt"
    Notes: "A simple ssb message viewer"
    Tabs: 4
]

#include %ssb-client.red
#include %marky-mark.red
#include %rich-text.red

view [
    title "View Message"
    text "Message id" message-id: field 300 on-enter [
       
    ]
    button "Load message" [
        data: ssb-client/get message-id/text
        body: rich-text/info  emit-rich marky-mark data/content/text 600
        message-content/text: data/content/text
    ]
    return
    message-content: area 600x700 wrap
]




