require "minitest/autorun"
require_relative "../source/convertisseur_roman_numerals"

class RomanNumeralsTest < Minitest::Test

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup

  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

  def test_un
    rn = ConvertisseurRomanNumerals.new 1
    r = rn.conversion
    assert_equal "I", r
  end

  def test_deux
    rn = ConvertisseurRomanNumerals.new 2
    r = rn.conversion
    assert_equal "II", r
  end

  def test_quatre
    rn = ConvertisseurRomanNumerals.new 4
    r = rn.conversion
    assert_equal "IV", r
  end

  def test_cinq
    rn = ConvertisseurRomanNumerals.new 5
    r = rn.conversion
    assert_equal "V", r
  end

  def test_six
    rn = ConvertisseurRomanNumerals.new 6
    r = rn.conversion
    assert_equal "VI", r
  end

  def test_neuf
    rn = ConvertisseurRomanNumerals.new 9
    r = rn.conversion
    assert_equal "IX", r
  end

  def test_dix
    rn = ConvertisseurRomanNumerals.new 10
    r = rn.conversion
    assert_equal "X", r
  end

  def test_treize
    rn = ConvertisseurRomanNumerals.new 13
    r = rn.conversion
    assert_equal "XIII", r
  end

  def test_quatorze
    rn = ConvertisseurRomanNumerals.new 14
    r = rn.conversion
    assert_equal "XIV", r
  end

  def test_quinze
    rn = ConvertisseurRomanNumerals.new 15
    r = rn.conversion
    assert_equal "XV", r
  end

  def test_seize
    rn = ConvertisseurRomanNumerals.new 16
    r = rn.conversion
    assert_equal "XVI", r
  end

  def test_dix_neuf
    rn = ConvertisseurRomanNumerals.new 19
    r = rn.conversion
    assert_equal "XIX", r
  end

  def test_vingt
    rn = ConvertisseurRomanNumerals.new 20
    r = rn.conversion
    assert_equal "XX", r
  end

  def test_vingt_neuf
    rn = ConvertisseurRomanNumerals.new 29
    r = rn.conversion
    assert_equal "XXIX", r
  end

  def test_cinquante
    rn = ConvertisseurRomanNumerals.new 50
    r = rn.conversion
    assert_equal "L", r
  end

  def test_cent
    rn = ConvertisseurRomanNumerals.new 100
    r = rn.conversion
    assert_equal "C", r
  end

  def test_cinq_cent
    rn = ConvertisseurRomanNumerals.new 500
    r = rn.conversion
    assert_equal "D", r
  end

  def test_mille
    rn = ConvertisseurRomanNumerals.new 1000
    r = rn.conversion
    assert_equal "M", r
  end

  def test_mille_neuf_cent_quatre_vingt_dix
    rn = ConvertisseurRomanNumerals.new 1990
    r = rn.conversion
    assert_equal "MCMXC", r
  end

  def test_neuf_cent_quatre_vingt_dix_neuf
    rn = ConvertisseurRomanNumerals.new 999
    r = rn.conversion
    assert_equal "CMXCIX", r
  end
end
