module GetFlickr
  require 'flickraw'

  FlickRaw.api_key=ENV['FLICKR_KEY']
  FlickRaw.shared_secret=ENV['FLICKR_SECRET']

  def update_flickr_urls
    /(\d*)\D*\z/.match(self.flickr_url)
    sizes = flickr.photos.getSizes photo_id: $1

    thumbnail = get_thumbnail(sizes)
    square = get_large_square(sizes)
    large = get_large(sizes)
    medium = get_medium(sizes)

    unless self.pic_thumbnail_url == thumbnail && self.pic_large_url == large && self.pic_large_square_url == square  && self.pic_medium_url == medium
      self.update_attributes(pic_thumbnail_url: thumbnail,
                             pic_large_url: large,
                             pic_large_square_url: square,
                             pic_medium_url: medium)
    end
  end

  def get_thumbnail(sizes)
    if sizes.find {|s| s.label == 'Square' }.present?
      return sizes.find {|s| s.label == 'Square' }.source
    elsif sizes.find {|s| s.label == 'Large Square' }.present?
      return sizes.find {|s| s.label == 'Large Square' }.source
    else
      ''
    end
  end

  def get_large_square(sizes)
    if sizes.find {|s| s.label == 'Large Square' }.present?
      return sizes.find {|s| s.label == 'Large Square' }.source
    elsif sizes.find {|s| s.label == 'Square' }.present?
      return sizes.find {|s| s.label == 'Square' }.source
    else
      ''
    end
  end

  def get_large(sizes)
    if sizes.find {|s| s.label == 'Medium 640' }.present?
      return sizes.find {|s| s.label == 'Medium 640' }.source
    elsif sizes.find {|s| s.label == 'Medium 800' }.present?
      return sizes.find {|s| s.label == 'Medium 800' }.source
    elsif sizes.find {|s| s.label == 'Large' }.present?
      return sizes.find {|s| s.label == 'Large' }.source
    else
      ''
    end
  end

  def get_medium(sizes)
    if sizes.find {|s| s.label == 'Small 320' }.present?
      return sizes.find {|s| s.label == 'Small 320' }.source
    elsif sizes.find {|s| s.label == 'Medium' }.present?
      return sizes.find {|s| s.label == 'Medium' }.source
    elsif sizes.find {|s| s.label == 'Small' }.present?
      return sizes.find {|s| s.label == 'Small' }.source
    else
      ''
    end
  end
end
