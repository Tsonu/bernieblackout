require 'whenever'
require 'open-uri'

class Source < ActiveRecord::Base
    has_many :responses, dependent: :destroy
    
    def retrieve_source
        Log.create(timestamp: DateTime.now, code: "Info", message: "Beginning retrival for #{url}.")
        responseHtml = open(url).read
        responseHtml = responseHtml.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_')
        response = Response.create(raw_html: responseHtml, response_time: DateTime.now, source: self)
        response.parse self
        Log.create(timestamp: DateTime.now, code: "Info", message: "Ending retrival for #{url}.")
    end
    
    def self.retrieve_source_all
        #reset
        Rails.logger.info("Running Retrieve All")
        Source.all.each do |source|
            source.retrieve_source
        end
        #return
    end
    
    def self.reset
        Log.all.each do |log|
            log.destroy
        end
        Response.all.each do |log|
            log.destroy
        end
        Headline.all.each do |log|
            log.destroy
        end
    end
end
