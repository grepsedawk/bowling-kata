# frozen_string_literal: true
require 'pry'

class Bowling
  attr_reader :score, :current_frame
  def initialize
    @score = 0
    @frames = Array.new(10).map { [] }
    @current_frame = 0
    @frame = []
  end

  def roll(score)
    @frames[current_frame] << score
    apply_strike_bonus!
    @current_frame += 1 if last_roll_for_frame?


    account_for_spare_bonus score

    @frame << score
    if @frame.size == 2
      frame_score = @frame.sum
      @score += frame_score

      we_have_a_spare?
      @frame.clear
    end
  end

  def apply_strike_bonus!
    return unless apply_strike_bonus?

    @score += current_frame_score
  end

  def current_frame_score
    @frames[current_frame].sum
  end

  def apply_strike_bonus?
    @frames[current_frame - 1].first == 10 || @frames[current_frame - 2].first == 10
  end

  def last_roll_for_frame?
    @frames[current_frame].count >= 2 || current_frame_score == 10
  end

  def we_have_a_spare?
    @spare = true if @frame.sum == 10
  end

  def account_for_spare_bonus(score)
    if @spare
      @spare = false
      @score += score
    end
  end
end
