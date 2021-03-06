require 'get_pronunciation/base'

module GetPronunciation
  class Us < GetPronunciation::Base

    def self.download(word:, repeat: 1, output_dir: './', prefix: '', suffix: '')
      super(word: word, repeat: repeat, output_dir: output_dir, prefix: prefix, suffix: "_us#{suffix}")
    end

    def self.mp3_path
      mp3_document.css(mp3_xpath)[0]['data-snd']
    end
  end
end
