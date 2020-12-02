# frozen_string_literal: true

require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'

url = 'https://www.onliner.by'
content = open(url).read

document = Nokogiri::HTML(content)
csv_headers = %w[title image_link text]
CSV.open('news.csv', 'wb') do |csv|
  csv << csv_headers
  document.css('a.b-teasers-2__teaser-i').each do |link|
    url = link['href']
    next if url.include? 'forum'

    article = open(url).read
    doc = Nokogiri::HTML(article)
    title = doc.css('div.news-header__title').text.strip
    img = doc.css('div.news-header__image')[0]['style'].sub('background-image: url(', '').sub(/\)\;/, '')
    text = doc.css('div.news-text p').text.slice(0..200)
    csv << [title, img, text]
  end
end
