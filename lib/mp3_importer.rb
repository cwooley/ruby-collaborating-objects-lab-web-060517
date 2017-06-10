require 'pry'
require_relative 'song.rb'
class MP3Importer
  attr_accessor :filename


  def initialize(filename)
    @filename = filename
  end

  def files
    @files = Dir[@filename + "/**/*.mp3"]
    @files = @files.map do |file|
      file = file.split('/').last
    end
  end

  def import
    self.files
    @files.each do |file|
       Song.new_by_filename(file)
    end
  end

  def path
    @filename
  end

end

importer = MP3Importer.new('./db/mp3s').files
