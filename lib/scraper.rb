require 'pry'

require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  attr_accessor :doc, :html

    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
     html = open('http://learn-co-curriculum.github.io/site-for-scraping/courses')
     doc = Nokogiri::HTML(html)
  end

  def get_courses
    binding.pry
    doc.css(".post").css("h2")
  end

end
