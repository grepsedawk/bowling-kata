#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rspec/autorun'
require "./kata"

RSpec.describe Bowling do
  describe '#score' do
    specify 'initial score is zero' do
      expect(subject.score).to eq 0
    end

    it "modifies score after a frame" do
      subject.roll(5)
      subject.roll(0)

      expect(subject.score).to eq 5
    end

    it 'spare scores are counted as per bowling rules' do
      # subject gets a spare
      subject.roll(6)
      subject.roll(4)
      # subject gets 8 on next frame
      subject.roll(8)
      subject.roll(0)

      expect(subject.score).to eq 26
    end

    context "strike" do
      it "accounts the next two rolls after a strike" do
        subject.roll(10)
        subject.roll(1)
        subject.roll(1)

        expect(subject.score).to eq 14
      end

      xit "accounts for 3 strikes in a row" do
        subject.roll(10)
        subject.roll(10)
        subject.roll(10)

        expect(subject.score).to eq 60
      end
    end
  end
end
