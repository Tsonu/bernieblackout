require 'hpricot'

class Response < ActiveRecord::Base
  belongs_to :source
  has_many :headlines, dependent: :destroy
  
  def parse (source)
    count = 0;
    doc = Hpricot(raw_html)
    [source.main_header_id, source.sub_header_id].each do |p|
      if not p.to_s.empty?
        (doc/"#{p}").each do |ele|
          html = ele.inner_text
          Headline.create(response: self, headline_text: html, is_repeat: false, is_primary: p == source.main_header_id, has_moved: false)
          count = count + 1
        end
      end
    end
    
    Log.create(timestamp: DateTime.now, code: "Info", message: "Found #{count} headlines.")
  end
end
