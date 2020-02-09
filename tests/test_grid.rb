require_relative "../grid"
require "test/unit"
 
class TestGrid < Test::Unit::TestCase
 
  def test_get_at
    grid = Grid.new(5,5)
    grid.reset('*')
    assert_equal('*', grid.get_at(1,1))
  end

  def test_set_at
    grid = Grid.new(5,5)
    grid.reset('*')
    assert_equal('*', grid.get_at(1,1))
    grid.set_at(3,3, '@')
    assert_equal('@', grid.get_at(3,3))
  end  

  def test_reset
    grid = Grid.new(5,5)
    0.upto(4) do |r|
      0.upto(4) do |c|
        assert_equal(nil, grid.get_at(r,c))
      end 
    end
    grid.reset('*')
    0.upto(4) do |r|
      0.upto(4) do |c|
        assert_equal('*', grid.get_at(r,c))
      end 
    end   
  end
 
end