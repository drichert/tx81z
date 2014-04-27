# Voice Bulk Data Format (VMEM)
defaults = 
  offset: 1 # bit position
  size:   7 # number of bits

# n - Operator number (1-4)
opTmpl = (n) ->
  [
    { name: "ar#{n}", offset: 3, size: 5 }
    { name: "d1r#{n}", offset: 3, size: 5 }
    { name: "d2r#{n}", offset: 3, size: 5 }
    { name: "rr#{n}", offset: 4, size: 4 }
    { name: "d1l#{n}", offset: 4, size: 4}
    "ls#{n}"
    { name: "ame#{n}", offset: 1, size: 1 }
    { name: "ebs#{n}", offset: 2, size: 3}
    { name: "kvs#{n}", offest: 5, size: 3 }
    "out",
    { name: "f#{n}", offset: 2, size: 6 }
    { name: "rs#{n}", offset: 3, size: 2 }
    { name: "dbt#{n}", offset: 5, size: 3 }
  ]

[
  opTmpl(4)
  opTmpl(3)
  opTmpl(2)
  opTmpl(1)
  [
    { name: "sy", size: 1 }
    { name: "fbl", offset: 2, size: 3 } 
    { name: "alg", offset: 5, size: 3 }
    "lfs"
    "lfd"
    "pmd"
    "amd"
    { name: "pms", size: 3 }
    { name: "ams", offset: 4, size: 2 }
    { name: "lfw", offset: 6, size: 2 }
    { name: "trps", offset: 4, size: 4 }
    { name: "pbr", offset: 4, size: 4 }
    { name: "ch", offset: 3, size: 1 }
    { name: "mo", offset: 4, size: 1 }
    { name: "su", offset: 5, size: 1 }
    { name: "po", offset: 6, size: 1 }
    { name: "pm", offset: 7, size: 1 }
    "port"
    "fcVol"
    "mwPitch"
    "mwAmpli"
    "bcPitch"
    "bcAmpli"
    "bcPBias"
    "bcEBias"
    "voiceName1"
    "voiceName2"
    "voiceName3"
    "voiceName4"
    "voiceName5"
    "voiceName6"
    "voiceName7"
    "voiceName8"
    "voiceName9"
    "voiceName10"
    "pr1"
    "pr2"
    "pr3"
    "pl1"
    "pl2"
    "pl3"
  ]
]
