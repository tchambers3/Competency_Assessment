module ApplicationHelper

  def full_url(url)
    url.include?("http://") ? url : "http://#{url}"
  end

end
