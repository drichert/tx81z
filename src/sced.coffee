# Voice Bulk Data Format (SCED)
define ["param"], (Param) ->
  # n - Character number
  voiceNameChar = -> (n)
    new Param
      name:   "voiceName#{n}"
      desc:   "Voice Name (Char #{n})"
      addr:   57 + (n - 1)
      offset: 1
      size:   7
      values: [32..127] # ASCII

  # Mysterious PR parameters
  pr = -> (n)
    desc = switch n
      when 1 then "PEG (DX21 ONLY)"
      when 2 then "Set 99"
      when 3 then ""

    new Param
      name:   "pr#{n}"
      desc:   "PR#{n} :#{desc}:"
      addr:   67 + (n - 1)
      offest: 1
      size:   7
      values: [0..99]

  # Also mysterious PL parameters
  pl = -> (n)
    desc = switch n
      when 1 then "Set 50"
      when 2, 3 then ""

    new Param
      name:   "pl#{n}"
      desc:   "PL#{n} :#{desc}:"
      addr:   70 + (n - 1)
      offset: 1
      size:   7
      values: [0..99]

  # n - Operator number (1-4)
  operator = (n) ->
    addrOffset = switch n
      when 4 then 0
      when 2 then 10
      when 3 then 20
      when 1 then 30

    [
      new Param
        name:   "ar#{n}"
        desc:   "Attack Rate OP#{n}"
        addr:   0 + addrOffset
        offset: 3
        size:   5

      new Param
        name:   "d1r#{n}"
        desc:   "Decay 1 Rate OP#{n}"
        addr:   1 + addrOffset
        offset: 3
        size:   5

      new Param
        name:   "d2r#{n}"
        desc:   "Decay 2 Rate OP#{n}"
        addr:   2 + addrOffset
        offset: 3
        size:   5

      new Param
        name:   "rr#{n}"
        desc:   "Release Rate OP#{n}"
        addr:   3 + addrOffset
        offset: 4
        size:   4

      new Param
        name:   "d1l#{n}"
        desc:   "Decay 1 Level OP#{n}"
        addr:   4 + addrOffset
        offset: 4
        size:   4

      new Param
        name:   "ls#{n}"
        desc:   "Level Scaling OP#{n}"
        addr:   5 + addrOffset
        offset: 1
        size:   7
        values: [0..99]

      new Param
        name:   "ame#{n}"
        desc:   "Amplitude Modulation Enable OP#{n}"
        addr:   6 + addrOffset
        offset: 1
        size:   1

      new Param
        name:   "ebs#{n}"
        desc:   "EG Bias Sensitivity OP#{n}"
        addr:   6 + addrOffset
        offset: 2
        size:   3

      new Param
        name:   "kvs#{n}"
        desc:   "Key Velocity Sensitivity OP#{n}"
        addr:   6 + addrOffset
        offset: 5
        size:   3

      new Param
        name:   "out#{n}"
        desc:   "Output Level OP#{n}"
        addr:   7 + addrOffset
        offset: 1
        size:   7
        values: [0..99]

      new Param
        name:   "f#{n}"
        desc:   "Frequency (CRS) OP#{n}"
        addr:   8 + addrOffset
        offset: 2
        size:   6

      new Param
        name:   "rs#{n}"
        desc:   "Rate Scaling OP#{n}"
        addr:   9 + addrOffset
        offset: 3
        size:   2

      new Param
        name:   "det#{n}"
        desc:   "Detune OP#{n}"
        addr:   9 + addrOffset
        offset: 5
        size:   3
        values: [0..6]
    ]

  params = [
    operator(n) for n in [1..4]

    new Param
      name:   "sy"
      desc:   "LFO Sync"
      addr:   40
      offest: 1
      size:   1

    new Param
      name:   "fbl"
      desc:   "Feedback Level"
      addr:   40
      offset: 2
      size:   3

    new Param
      name:   "alg"
      desc:   "Algorithm"
      addr:   40
      offset: 5
      size:   3

    new Param
      name:   "lfs"
      desc:   "LFO Speed"
      addr:   41
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name: "lfd"
      desc: "LFO Delay"
      addr: 42
      offset: 1
      size: 7
      values: [0.99]

    new Param
      name:   "pmd"
      desc:   "Pitch Modulation Depth"
      addr:   43
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "amd"
      desc:   "Amplitude Modulation Depth"
      addr:   44
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "pms"
      desc:   "Pitch Modulation Sensitivity"
      addr:   45
      offset: 1
      size:   3

    new Param
      name:   "ams"
      desc:   "Amplitude Modulation Sensitivity"
      addr:   45
      offset: 4
      size:   2

    new Param
      name:   "lfw"
      desc:   "LFO Waveform"
      addr:   45
      offset: 6
      size:   2

    new Param
      name:   "trps"
      desc:   "Transpose"
      addr:   46
      offset: 2
      size:   6
      values: [0..48]

    new Param
      name: "pbr"
      desc: "Pitch Bend Range"
      addr: 47
      offset: 4
      size: 4
      values: [0..12]

    new Param
      name:   "ch"
      desc:   "Chorus"
      addr:   48
      offset: 3
      size:   1

    new Param
      name:   "mo"
      desc:   "Portamento Mode"
      addr:   48
      offset: 4
      size:   1

    new Param
      name:   "su"
      desc:   "Sustain"
      addr:   48
      offset: 5
      size:   1

    new Param
      name:   "po"
      desc:   "Portamento"
      addr:   48
      offset: 6
      size:   1

    new Param
      name:   "pm"
      desc:   "Poly Mode"
      addr:   48
      offset: 7
      size:   1

    new Param
      name:   "port"
      desc:   "Portamento Time"
      addr:   49
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "fcVol"
      desc:   "Foot Control Volume"
      addr:   50
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "mwPitch"
      desc:   "Modulation Wheel Pitch"
      addr:   51
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "mwAmpli"
      desc:   "Modulation Wheel Amplitude"
      addr:   52
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "bcPitch"
      desc:   "Breath Control Pitch"
      addr:   53
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "bcAmpli"
      desc:   "Breath Control Amplitude"
      addr:   54
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "bcPBias"
      desc:   "Breath Control Pitch Bias"
      addr:   55
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "bcEBias"
      desc:   "Breath Control EG Bias"
      addr:   56
      offset: 1
      size:   7
      values: [0..99]

    voiceNameChar(n) for n in [1..10]
    pr(n) for n in [1..3]
    pl(n) for n in [1..3]
  ]

  _.flatten(params) 
