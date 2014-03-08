# coding: utf-8
class Flickr
  class << self
    # Flickrから写真一覧を取得します
    # _user_id_ :: FlickrのユーザID
    def find_by_user_id(user_id)
      search(user_id: user_id)
    end

    private
      def search(params)
        flickr.photos.search(params).map{|photo| Photo.new(photo)}
      end
  end

  class Photo
    def initialize(photo)
      @photo = photo
    end

    def as_json options = {}
      {url: url("m"), medium: url("b")}
    end

    # _size_ :: m,s,t,z,bのいづれか
    def url(size = "b")
      "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}_#{size}.jpg"
    end

    private
      def id
        @photo["id"]
      end

      def farm_id
        @photo["farm"]
      end

      def server_id
        @photo["server"]
      end

      def secret
        @photo["secret"]
      end
  end
end
