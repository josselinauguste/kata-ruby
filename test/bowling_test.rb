require "minitest/autorun"
require_relative "../source/bowling"

class BowlingTest < Minitest::Test

  def setup
    @bowling = Bowling.new
  end

  def test_1_hit_on_one_roll
    roll [1]
    assert_equal 1, @bowling.score
  end

  def test_2_hits_on_1_roll
    roll [2]
    assert_equal 2, @bowling.score
  end

  def test_1_hits_for_2_rolls
    roll [1, 1]
    assert_equal 2, @bowling.score
  end

  def test_multiples_hits_per_roll
    roll [2, 4]
    assert_equal 6, @bowling.score
  end

  def test_spare_and_roll
    roll [5, 5, 2]
    assert_equal 14, @bowling.score
  end

  def test_spare_and_two_rolls
    roll [5, 5, 2, 7]
    assert_equal 21, @bowling.score
  end

  def test_last_spare
    roll [5, 5]
    assert_equal 10, @bowling.score
  end

  def test_last_strike
    roll [10]
    assert_equal 10, @bowling.score
  end

  def test_strike_and_two_roll
    roll [10, 2, 3]
    assert_equal 20, @bowling.score
  end

  def test_two_strikes
  	roll [10, 10, 5, 3]
  	assert_equal 51, @bowling.score
  end

  def test_three_strikes
    	roll [10, 10, 10]
    	assert_equal 60, @bowling.score
    end

  def test_all_strikes
    roll [10] * 12
    assert_equal 300, @bowling.score
  end

  def test_nine_and_zero
    roll [9, 0] * 10
    assert_equal 90, @bowling.score
  end

  def test_all_five
    roll [5] * 21
    assert_equal 150, @bowling.score
  end

  private
  def roll(hits)
    hits.each do |h|
      @bowling.roll h
    end
  end
end
