(function (window) {

var 
    // 画像
    Image,
    // 画像一覧
    Images,
    // 画像表示
    ImageView,
    // 画像一覧表示
    ImagesView,
    // Flickr画像
    FlickrPhoto,
    // Flickr画像一覧
    Flickr;

// 画像
Image = Backbone.Model.extend({});

// Flickr画像
FlickrPhoto = Backbone.Model.extend({});

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
FlickrPhotoView = Backbone.View.extend({
  template: _.template($("#image-template").text()),
  events: {
    'click a': 'onClick'
  },
  onClick: function (e) {
    e.preventDefault();
    $("#slide_content").val($('#slide_content').val() + '<img src="' + this.model.get('url') + '"></img>');
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

var flickr = new Flickr();
flickr.fetch({
  success: function () {
    flickr.each(function (photo) {
      var flickrPhotoView = new FlickrPhotoView({model: photo});
      imagesView.$el.append(flickrPhotoView.render().el);
    })
  }
});

})(this);
