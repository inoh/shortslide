(function (window) {

var 
    // Model
    // 画像
    Image,
    // Flickr画像
    FlickrPhoto,
    // スライド
    SLide,
    // Collection
    // 画像一覧
    Images,
    // Flickr画像一覧
    Flickr,
    // View
    // 画像表示
    ImageView,
    // 画像一覧表示
    ImagesView,
    // スライド画面
    SlideView;

// 画像
Image = Backbone.Model.extend({});

// Flickr画像
FlickrPhoto = Backbone.Model.extend({});

// スライド
Slide = Backbone.Model.extend({
  urlRoot: '/slides',
  idAttribute: 'id',
  defaults: {
    slide: {
      id: null,
      title: "",
      content: ""
    }
  }
});

// 画像一覧
Images = Backbone.Collection.extend({
  model: Image,
  url: '/images'
});

// FLickr画像一覧
Flickr = Backbone.Collection.extend({
  model: FlickrPhoto,
  url: '/flickr'
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

//
SlideView = Backbone.View.extend({
  el: "#slide-form",
  events: {
    'submit': 'submit',
    'click a.btn': 'preview'
  },
  submit: function (e) {
    e.preventDefault();
    this.saveSlideObject(function () {
      alert ("保存が完了しました。");
    });
  },
  preview: function (e) {
    this.saveSlideObject();
  },
  saveSlideObject: function (success) {
    var slide = new Slide();
    slide.set('id', $("#slide_id").val());
    slide.get('slide')['id'] = $("#slide_id").val();
    slide.get('slide')['title'] = $("#slide_title").val();
    slide.get('slide')['content'] = $("#slide_content").val();
    slide.save(null, {
      validate: false,
      success: function () {
        if (success) {
          success();
        }
      },
      error: function (model, resp) {
        console.log(model);
        console.log(resp);
        alert ("エラーが発生しました。")
      }
    });
  }
});
var slideView = new SlideView();

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

var flickr = new Flickr();
flickr.fetch({
  success: function () {
    flickr.each(function (photo) {
      var imageView = new ImageView({model: photo});
      imagesView.$el.append(imageView.render().el);
    })
  }
});

})(this);
