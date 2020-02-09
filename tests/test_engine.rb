require_relative "../engine"
require "test/unit"
 
class TestEngine < Test::Unit::TestCase
  
  def test_live
    seed = "__**_*____|__***_____|__________|__________|__________|__________|__________|__________|__________|__________"
    engine = Engine.new
    engine.seed seed
    assert_equal(true, engine.live?(0, 2))
    assert_equal(false, engine.live?(0, 5))
    assert_equal(false, engine.live?(0, 4))
  end  


  def test_produce
    seed = "__**_*____|__***_____|__________|__________|__________|__________|__________|__________|__________|__________"
    engine = Engine.new
    engine.seed seed
    assert_equal(false, engine.produce?(0, 4))
    assert_equal(false, engine.produce?(0, 2))
    assert_equal(true, engine.produce?(2, 3))
    assert_equal(false, engine.produce?(1, 5))
  end

  def test_die
    seed = "__**_*____|__***_____|__________|__________|__________|__________|__________|__________|__________|__________"
    engine = Engine.new
    engine.seed seed
    assert_equal(true, engine.die?(0, 0))
    assert_equal(true, engine.die?(0, 5))
    assert_equal(false, engine.die?(0, 2))
    # This is dead but going to come alove
    assert_equal(true, engine.die?(2, 3))
  end  

end
