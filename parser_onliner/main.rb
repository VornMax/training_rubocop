# frozen_string_literal: true

require 'open-uri'
require 'byebug'
require 'nokogiri'

url = 'https://www.onliner.by'
content = open(url).read

document = Nokogiri::HTML(content)
array = []
document.css('a.b-teasers-2__teaser-i').each do |link|
  url = link['href']
  next if url.include? 'forum'

  article = open(url).read
  news_doc = Nokogiri::HTML(article)

  news_hash = {
    title: news_doc.css('div.news-header__title').text.strip,
    image_link: news_doc.css('div.news-header__image')[0]['style'].sub('background-image: url(', '').sub(/\)\;/, ''),
    text: news_doc.css('div.news-text p').text.slice(0..200)
  }
  array << news_hash
end
puts array
