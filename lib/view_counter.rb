class ViewCounter

  attr_accessor :entries

  def initialize
    @entries = []
  end

  def count_unique_views(lp)
    temp = []
    lp.log.uniq.each do |line|
      temp << line.split(' ')[0]
    end

    vp = ViewCounter.new
    temp.tally.sort_by { |s| [-s[1], s[0]] }.each do |elem|
      vp.entries << "#{elem[0]} #{elem[1]} unique views"
    end
    vp
  end

  def count_views(lp)
    temp = []
    lp.log.each do |line|
      temp << line.split(' ')[0]
    end
    vp = ViewCounter.new
    temp.tally.sort_by { |s| [-s[1], s[0]] }.each do |elem|
      vp.entries << "#{elem[0]} #{elem[1]} visits"
    end
    vp
  end

  def print_views
    puts entries
    puts
  end

end
