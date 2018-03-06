require 'sidekiq-scheduler'

class ScrapCriptotendenciaWorker
  include Sidekiq::Worker

  def perform(*args)
    require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(open("https://criptotendencia.com/category/noticias/"))

  # Getting for post in current page
    posts = doc.css("article.post")

    posts.each do |post|

      image_url = post.at_css("img.wp-post-image") ? post.css("img.wp-post-image").attr("src") : nil
      title = post.at_css(".entry-title a") ? post.css(".entry-title a").text : nil
      url = post.at_css(".entry-title a") ? post.css(".entry-title a").attr("href") : nil
      content = nil
      source = 'criptotendencia'
      notice = BlogArticle.new(
        title: title,
        url: url,
        image_url: image_url,
        content: content,
        source: source
      )

      notice.save unless BlogArticle.where(url: notice.url).present?
    end
  end
end
