module ApplicationHelper

  # Helper method for views to convert external urls to a full path if http:// is missing
  def full_url(url)
    url.include?("http://") ? url : "http://#{url}"
  end

end
