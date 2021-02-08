# frozen_string_literal: true

require 'rspec'
require './lib/log_parser'
require './lib/view_counter'

describe 'ViewCounter' do
  before(:example) do
    @lp = LogParser.new
    @lp.log = ['/help_page/1 126.318.035.038', '/contact 184.123.665.067', '/contact 184.123.665.067','/help_page/1 127.318.035.038']
  end

  describe '.count_unique_views' do
    context 'when given LogParser object' do
      it 'should return counted unique views' do
        vc = ViewCounter.new
        vp = vc.count_unique_views(@lp)
        expect(vp.entries[0]).to eq('/help_page/1 2 unique views')
        expect(vp.entries[1]).to eq('/contact 1 unique views')
      end
    end
  end

  describe '.count_views' do
    context 'when given LogParser object' do
      it 'should return counted views' do
        vc = ViewCounter.new
        vp = vc.count_views(@lp)
        expect(vp.entries[0]).to eq('/contact 2 visits')
        expect(vp.entries[1]).to eq('/help_page/1 2 visits')
      end
    end
  end

  describe '.print_views' do
    it 'should print content of ViewCounter entries' do
      vc = ViewCounter.new
      vp = vc.count_views(@lp)
      expect { vp.print_views}.to output("/contact 2 visits\n/help_page/1 2 visits\n\n").to_stdout
    end
  end

end