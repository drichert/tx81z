var Alg = Backbone.View.extend({
  el: $("#alg"),

  algSelect: function() {
    var html = "";

    _(8).times(function(n) {
      n = n + 1;
      html += '<input type="radio" name="alg" value="' + n + '">' + n + "</input>";
    });

    return html;
  },

  render: function() {
    this.$el.html(this.algSelect());

    return this;
  }
});
