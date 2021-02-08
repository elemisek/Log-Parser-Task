# frozen_string_literal: true

require './lib/log_parser'
require './lib/view_counter'

lp = LogParser.new
entries = lp.file_read(ARGV[0])

vc = ViewCounter.new
unique_views = vc.count_unique_views(entries)
views = vc.count_views(entries)

unique_views.print_views
views.print_views

