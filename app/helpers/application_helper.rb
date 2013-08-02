module ApplicationHelper
  def full_title(page_title) #Returns the full title on a per-page basis.
    base_title = "Backpacking Talk"
    if page_title.empty?
      base_title
    elsif page_title == "home"
      "#{base_title} | One backpacker encounters another backpacker in the woods. He says, \"So there's this site called Backpacking Talk.\" The other backpacker replies, \" ..."
    else
      "#{page_title} | #{base_title}"
    end
  end

  def meta_desc(desc) #Returns the full title on a per-page basis.
    if desc.empty?
      "One day I will transform my sleeping bag into a backpack and be the first sleeping bagger. We will go lighter and faster than our backpacker cousins"
    else
      desc
    end
  end

  def pretty_date(date)
    date = date.to_date
    new_date = date.strftime("%b #{date.day.ordinalize}, %Y")
  end

  def flash_class(level) #change rails alerts in to bootstrap alerts (associated partial and application.html code)
   case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  def fix_image_pathway(text) #adds the random hash into the image pathway for heroku
    if Rails.env.production?
      text.scan(/src="(\/assets\/[^.]+.jpg)"/).each do |src|
        src.first.match(/\/([^.\/]+.jpg)/)
        text = text.gsub(src.first, image_path($1))
      end
    end
    return text
  end
end
