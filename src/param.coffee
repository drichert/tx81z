define ->
  class Param
    # options
    #   name:
    #     Abbreviated parameter name (lowercase, bumpyCase), e.g., AR
    #     (Attack Rate) would be "ar"
    #   desc:
    #     Optional full name describing parameter, e.g., "Attack Rate"
    #   addr:
    #     Address where data is (byte number) in bulk data structure
    #     where value will be stored. More than one Parameter can potentially
    #     have the same address
    #   offset:
    #     Bit offset within byte where parameter value will be stored
    #   size:
    #     Number of bits to allocate for the parameter value
    #   values:
    #     Optional array of acceptable values for the parameter. Defaults to
    #     an array of integers ranging from 0 to the maximum value allowed
    #     by `size` option
    #   input:
    #     Optional input type. Defaults to "Slider"
    constructor: (options) ->
      _([
        "name"
        "description"
        "address"
        "offset"
        "size"
        "values"
        "input"
      ]).each (n) -> @[n] = options[n]

      @values = @values or @defaultValues()
      @input  = @input or @defaultInput()

    defaultValues: ->
      max = parseInt([0..(@size - 1)].map(-> "1").join(""), 2)
      [0..max]

    defaultInput: ->
      "Slider"
