# frozen_string_literal: true

require './spec/spec_helper'
require './lib/log_parser'

describe 'LogParser' do
  describe '#initialize' do
    it 'should have empty log array' do
      expect(LogParser.new.log).to eq([])
    end
  end

  describe '.file_read' do
    context 'given existing filename' do
      it 'should return non-empty LogParser object' do
        out = ['/help_page/1 126.318.035.038', '/contact 184.123.665.067']
        allow(File).to receive(:open).with('test.log').and_return out
        l = LogParser.new.file_read('test.log')

        expect(l).to be_a LogParser
        expect(l.log.length).to eq(2)
      end
    end
  end
end
