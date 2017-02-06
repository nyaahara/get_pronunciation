require 'thor'
require 'get_pronunciation'

class CLI < Thor
  desc 'uk', 'download pronunciation mp3 file from www.thefreedictionary.com'
  option :word, type: :string, required: true
  option :repeat, type: :numeric
  option :output_dir, type: :string
  option :prefix, type: :string
  option :suffix, type: :string

  def uk
    params = options.map { |k, v| [k.to_sym, v] }.to_h
    GetPronunciation.download(params)
  end
end

