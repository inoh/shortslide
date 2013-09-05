(function (window) {

// Model
var 
    // スライド
    Slide,
    // スライドページ
    Section;

Slide = Backbone.Model.extend({
  urlRoot: '/slides',
  idAttribute: 'id',
  defaults: {
    title: ""
  },
  validate: function (attrs, options) {
    if (_.isEmpty(attrs.title)) {
      return "タイトルが設定されていません";
    }
  }
});

Section = Backbone.Model.extend({
  urlRoot: '/sections',
  idAttribute: 'id',
  defaults: {
    template_id: null,
    slide_id: null,
    params: ""
  },
  validate: function (attrs, options) {
    if (_.isEmpty(attrs.template_id)) {
      return "テンプレートが設定されていません";
    }
    if (_.isEmpty(attrs.slide_id)) {
      return "スライドが設定されていません";
    }
    if (_.isEmpty(attrs.params)) {
      return "パラメタが設定されていません";
    }
  }
});

})(this);
