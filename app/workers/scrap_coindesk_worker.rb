class ScrapCoindeskWorker
  include Sidekiq::Worker

  def perform(*args)
    

    require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(open("https://www.coindesk.com/category/news/"))

    # Getting for post in current page
    posts = doc.css("#content .article.post")

    posts.each do |post|

      image_url = post.at_css(".picture img.wp-post-image") ? post.css(".picture img.wp-post-image").attr("src") : nil
      title = post.at_css(".post-info a.fade") ? post.css(".post-info a.fade").text : nil
      url = post.at_css(".post-info a.fade") ? post.css(".post-info a.fade").attr("href") : nil
      description = post.at_css(".post-info p.desc") ? post.css(".post-info p.desc").text : nil
      source = 'coindesk'

      notice = BlogArticle.new(
        title: title,
        url: url,
        image_url: image_url,
        content: description,
        source: source
      )

      notice.save unless BlogArticle.where(url: notice.url).present?

    end

  end
end
