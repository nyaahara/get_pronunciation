require 'thor'
require 'get_pronunciation/uk'
require 'get_pronunciation/us'

class CLI < Thor
  desc 'uk', 'download pronunciation mp3 file from www.thefreedictionary.com'
  option :word, type: :string, required: true
  option :repeat, type: :numeric
  option :output_dir, type: :string
  option :prefix, type: :string
  option :suffix, type: :string

  def uk
    params = options.map { |k, v| [k.to_sym, v] }.to_h
    GetPronunciation::Uk.download(params)
  end

  desc 'us', 'download pronunciation mp3 file from www.thefreedictionary.com'
  option :word, type: :string, required: true
  option :repeat, type: :numeric
  option :output_dir, type: :string
  option :prefix, type: :string
  option :suffix, type: :string

  def us
    params = options.map { |k, v| [k.to_sym, v] }.to_h
    GetPronunciation::Us.download(params)
  end
end

