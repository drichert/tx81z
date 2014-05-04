# Additional Voice Bulk Data Format (VCED)
define ["sced"], (sced) ->
  operator = (n) ->
    addrOffset = switch n
      when 4 then 0
      when 2 then 2
      when 3 then 4
      when 1 then 6

    [
      new Param
        name:   "egsft#{n}"
        desc:   "EG Shift OP#{n}"
        addr:   73 + addrOffset
        offset: 2
        size:   2

      new Param
        name:   "fix#{n}"
        desc:   "Fixed Frequency OP#{n}"
        addr:   73 + addrOffset
        offset: 4
        size:   1

      new Param
        name:   "fixrg#{n}"
        desc:   "Fix Frequency Range OP#{n}"
        addr:   73 + addrOffset
        offset: 5
        size:   3

      new Param
        name:   "opw#{n}"
        desc:   "Operator Waveform OP#{n}"
        addr:   74 + addrOffset
        offset: 1
        size:   3

      new Param
        name:   "fine#{n}"
        desc:   "Fine Frequency OP#{n}"
        addr:   74 + addrOffset
        offset: 4
        size:   4
    ]

  params = [
    sced # VCED extends SCED

    new Param
      name:   "pegpr1"
      desc:   "PEG PR1 (not used) :Set 99:"
      addr:   67
      offset: 1 # ?
      size:   7
      values: [0..99]

    new Param
      name: "pegpl3"
      desc: "PEG PL3 (???) :Set 50:"
      addr: 72
      offset: 1 # ?
      size: 7
      values: [0..99]

    operator(n) for n in [1..4]

    new Param
      name:   "rev"
      desc:   "Reverb Rate"
      addr:   81
      offset: 5
      size:   3

    new Param
      name:   "fcPitch"
      desc:   "Foot Controller Pitch"
      addr:   82
      offset: 1
      size:   7
      values: [0..99]

    new Param
      name:   "fcAmpli"
      desc:   "Foot Controller Ampli"
      adder:  83
      offset: 1
      size:   7
      values: [0..99]
  ]

  _.flatten(params)
