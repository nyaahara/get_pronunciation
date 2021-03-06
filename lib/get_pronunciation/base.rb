require 'nokogiri'
require 'open-uri'
require 'net/http'

module GetPronunciation
  class Base
    def self.download(word:, repeat: 1, output_dir: './', prefix: '', suffix: '')
      @word = word

      output_file_name = File.basename("#{output_dir}/#{prefix}#{word}#{suffix}.mp3")
      open(output_file_name, 'wb') do |output|
        repeat.times do
          output.write(mp3_data)
        end
      end
    end

    def self.mp3_data
      @mp3_data ||= open(mp3_url) { |data| data.read }
    end

    def self.mp3_url
      "http://img2.tfd.com/pron/mp3/#{mp3_path}.mp3"
    end

    def self.mp3_path
      raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
    end

    def self.mp3_xpath
      '//*[@id="content"]/div/span'
    end

    def self.mp3_document
      @mp3_document ||= Nokogiri::HTML.parse(mp3_response_body, nil, charset)
    end

    def self.mp3_response_body
      @response ||= Net::HTTP.get_response(URI.parse("#{host}/#{word}"))
      @response.body
    end

    def self.host
      'http://www.thefreedictionary.com'
    end

    def self.word
      @word
    end

    def self.charset
      'utf-8'
    end
  end
end
