(function (window) {

<<<<<<< HEAD
// Model
var 
    // スライド
    Slide,
    // スライドページ
    Section,
    // スライド画面
    SlideView;

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

Sections = Backbone.Collection.extend({

  model: Section

});

SectionView = Backbone.View.extend({

  tagName: 'section'

});


=======
var 
    // 画像
    Image,
    // 画像一覧
    Images,
    // 画像表示
    ImageView,
    // 画像一覧表示
    ImagesView;

// 画像
Image = Backbone.Model.extend({});

// 画像一覧
Images = Backbone.Collection.extend({
  model: Image,
  url: '/images'
});

// 
ImageView = Backbone.View.extend({
  template: _.template($("#image-template").text()),
  events: {
    'click a': 'onClick'
  },
  onClick: function (e) {
    e.preventDefault();
    $("#page_content").val($('#page_content').val() + '<img src="' + this.model.get('medium') + '"></img>');
    $("#modal-close").click();
  },
  render: function () {
    this.$el.html(this.template(this.model.attributes));
    return this;
  }
});

// 
ImagesView = Backbone.View.extend({
  el: "#images"
});

var images = new Images();
var imagesView = new ImagesView();
images.fetch({
  success: function () {
    images.each(function (image) {
      var imageView = new ImageView({model: image});
      imagesView.$el.append(imageView.render().el);
    });
  }
});

>>>>>>> issue19
})(this);
