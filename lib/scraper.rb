require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
<<<<<<< HEAD

=======
>>>>>>> 113755a9ed43688622eb672aba2e348b325a3ffe
    learn_students = []

    doc.css("div.roster-cards-container .student-card a").each do |student|
      learn_students << {
        :name => student.css(".student-name").text,
        :location => student.css(".student-location").text,
        :profile_url => student.attr("href")
      }
    end

    learn_students
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
<<<<<<< HEAD

    student_profile = {}
    all_social_links = doc.css(".social-icon-container a").map{ |link| link.attr("href") }

    all_social_links.each do |social_link|
      if social_link.include?("twitter")
        student_profile[:twitter] = social_link
      elsif social_link.include?("linkedin")
        student_profile[:linkedin] = social_link
      elsif social_link.include?("github")
        student_profile[:github] = social_link
      else
        student_profile[:blog] = social_link
      end

      student_profile[:profile_quote] = doc.css('div.profile-quote').text
      student_profile[:bio] = doc.css('div.description-holder p').text
    end

    student_profile
  end
end
=======
    student_profiles = {}
    all_social_links = doc.css(".social-icon-container").map{|link| link.attr("href")}

    all_social_links.each do |social_link|
      if social_link.include?("twitter")
        student_profiles[:twitter] = social_link
      elsif social_link.include?("linkedin")
        student_profiles[:linkedin] = social_link
      elsif social_link.include?("github")
        student_profiles[:github] = social_link
      else
      # elsif social_link.include?("blog")
        student_profiles[:blog] = social_link
      end
    end

    student_profiles[:profile_quote] = doc.css(".profile-quote").text if profile_page.css(".profile-quote")
    student_profiles[:bio] = doc.css(".description-holder p").text if profile_page.css(".description-holder p").text

    student_profiles
  end
end

    # doc.css("div.social-icon-container a").each do |social_info|
    #   social_link = social_info.attr("href").value
    #   bio_info =
    #   if social_link.include?("twitter")
    #     student_profiles[:twitter] = social_link
    #   elsif social_link.include?("linkedin")
    #     student_profiles[:linkedin] = social_link
    #   elsif social_link.include?("github")
    #     student_profiles[:github] = social_link
    #   elsif social_link.include?("blog")
    #     student_profiles[:blog] = social_link
    #   end

    #
    # doc.css("div.vitals-container").each do |vital_info|
    #   social_link = vital_info.css(".social-icon-container a").attr("href").value
    #   quote = vital_info.css(".profile-quote").text
    #   profile_bio = vital_info.css(".description-holder p").text
    #   if social_link.include?("twitter")
    #     student_profiles[:twitter] = social_link
    #   elsif social_link.include?("linkedin")
    #     student_profiles[:linkedin] = social_link
    #   elsif social_link.include?("github")
    #     student_profiles[:github] = social_link
    #   elsif social_link.include?("blog")
    #     student_profiles[:blog] = social_link
    #   elsif quote != nil
    #     student_profiles[:profile_quote] = quote
    #   elsif profile_bio != nil
    #     student_profiles[:bio] = profile_bio
    #   elseif
    #     scrape_profile_page(profile_url)
    #   end
    # end
    # student_profiles
    # binding
>>>>>>> 113755a9ed43688622eb672aba2e348b325a3ffe
