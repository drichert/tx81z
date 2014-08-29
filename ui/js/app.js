var Alg = Backbone.View.extend({
  el: $("#alg"),

  events: {
    "click input[type=radio]": "switchAlgImg"
  },

  algSelect: function() {
    var html = "";

    _(8).times(function(n) {
      n = n + 1;
      html += '<input type="radio" name="alg" value="' + n + '">' + n + "</input>";
    });

    return html;
  },

  switchAlgImg: function(ev) {
    var classes = [1, 2, 3, 4, 5, 6, 7, 8].map(function(n) {
      return "alg" + n;
    });

    this.$el.find(".refcard").removeClass(classes.join(" "))
                             .addClass("alg" + ev.target.value);
  },

  render: function() {
    this.$el.find(".picker").html(this.algSelect());

    return this;
  }
});

var Adsr = Backbone.View.extend({
  el: $("#adsr"),

  render: function() {
    this.$el.find("span").each(function() {
      $(this).empty().slider({
        value:       1,
        range:       "min",
        orientation: "vertical",
        animate:     true
      });
    });

    return this;
  }
});
