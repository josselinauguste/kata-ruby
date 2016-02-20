require "minitest/autorun"
require_relative "../source/fizz_buzz"

class FizzBuzzTest < Minitest::Test

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    fb = FizzBuzz.new
    @liste = fb.liste
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_liste_complete
    assert_equal 100, @liste.length
  end

  def test_premier_element
    assert_equal "1", @liste[0]
  end

  def test_second_element
    assert_equal "2", @liste[1]
  end

  def test_fizz
    assert_equal "fizz", @liste[2]
  end

  def test_buzz
    assert_equal "buzz", @liste[4]
  end

  def test_fizz_buzz
    assert_equal "fizzbuzz", @liste[14]
  end
end
