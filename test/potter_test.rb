require "minitest/autorun"
require "minitest/pride"
require_relative "../source/potter"

class PotterTest < Minitest::Test
  def test_price_first_book
    b = Basket.new
    b << :first
    
    assert_equal 8, b.get_price()
  end
  
  def test_price_second_book
    b = Basket.new
    b << :second
    
    assert_equal 8, b.get_price()
  end
  
  def test_price_2_different_books
    b = Basket.new
    b << :first
    b << :second
    
    assert_equal 15.2, b.get_price()
  end
  
  def test_price_3_different_books
    b = Basket.new
    b << :first
    b << :second
    b << :third
    
    assert_equal 21.6, b.get_price()
  end
  
  def test_price_4_different_books
    b = Basket.new
    b << :first
    b << :second
    b << :third
    b << :fourth
    
    assert_equal 25.6, b.get_price()
  end
  
  def test_price_5_different_books
    b = Basket.new
    b << :first
    b << :second
    b << :third
    b << :fourth
    b << :fifth
    
    assert_equal 30, b.get_price()
  end
  
  def test_price_2_different_books_plus_one
    b = Basket.new
    b << :first
    b << :second
    b << :first
    
    assert_equal 23.2, b.get_price()
  end
  
  def test_optimize_lots
    b = Basket.new
    b << :first
    b << :first
    b << :second
    b << :second
    
    assert_equal 30.4, b.get_price()
  end
  
  def test_master
    b = Basket.new
    b << :first
    b << :first
    b << :second
    b << :second
    b << :third
    b << :third
    b << :fourth
    b << :fifth
  
    assert_equal 51.2, b.get_price()
  end
  
end