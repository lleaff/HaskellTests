{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log
import ParseLogs
import MessageTree





main = build $ parse testString


testString = "I 5053 pci_id: con ing!\n\
\I 4681 ehci 0xf43d000:15: regista14: [0xbffff 0xfed nosabled 00-02] Zonseres: brips byted nored)\n\
\W 3654 e8] PGTT ASF! 00f00000003.2: 0x000 - 0000: 00009dbfffec00000: Pround/f1743colled\n\
\I 4076 verse.'\n\
\I 4764 He trusts to you to set them free,\n\
\I 858 your pocket?' he went on, turning to Alice.\n\
\I 898 would be offended again.\n\
\I 3753 pci 0x18fff steresocared, overne: 0000 (le wailan0: ressio0/derveld fory: alinpu-all)\n\
\I 790 those long words, and, what's more, I don't believe you do either!' And\n\
\I 3899 hastily.\n\
\I 2194 little creature, and held out its arms and legs in all directions, 'just\n\
\I 1447 she was terribly frightened all the time at the thought that it might be\n\
\I 1147 began ordering people about like that!'\n\
\I 3466 pci_hcd beed VRAM=2)"
