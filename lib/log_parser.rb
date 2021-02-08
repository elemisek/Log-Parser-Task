# frozen_string_literal: true

class LogParser

  attr_accessor :log

  def initialize
    @log = []
  end

  def file_read(filename)
    lp = LogParser.new
    File.open(filename).each do |line|
      lp.log << line
    end
    lp
  rescue Errno::ENOENT
    puts 'File doesn\'t exists'
    exit 1
  rescue Errno::EACCES
    puts 'Insufficient permission'
    exit 1
  end

end

