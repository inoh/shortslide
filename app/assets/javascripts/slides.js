(function (window) {

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
    $("#slide_content").val($('#slide_content').val() + '<img src="' + this.model.get('medium') + '"></img>');
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

})(this);
