require 'test_helper'

class RoadwayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save Roadway empty" do
    roadway = Roadway.new
    assert_not roadway.save
  end

  test "should not save Roadway without tipo" do
    roadway = Roadway.new
    roadway.rodovia = 'BR-1'
    roadway.sentido = 'norte'
    roadway.conservacao = '5'
    assert_not roadway.save
  end

  test "should not save Roadway without rodovia" do
    roadway = Roadway.new
    roadway.tipo = 'acesso'
    roadway.sentido = 'norte'
    roadway.conservacao = '5'
    assert_not roadway.save
  end

  test "should not save Roadway without sentido" do
    roadway = Roadway.new
    roadway.tipo = 'acesso'
    roadway.rodovia = 'BR-1'
    roadway.conservacao = '5'
    assert_not roadway.save
  end

  test "should not save Roadway without conservacao" do
    roadway = Roadway.new
    roadway.tipo = 'acesso'
    roadway.rodovia = 'BR-1'
    roadway.sentido = 'norte'
    assert_not roadway.save
  end

  test "should not save Roadway with wrong sentido" do
    roadway = Roadway.new
    roadway.tipo = 'acesso'
    roadway.rodovia = 'BR-1'
    roadway.sentido = 'pra la' #
    roadway.conservacao = '5'
    assert_not roadway.save
  end

  test "should not save Roadway with wrong conservacao" do
    roadway = Roadway.new
    roadway.tipo = 'acesso'
    roadway.rodovia = 'BR-1'
    roadway.sentido = 'pra la' #
    roadway.conservacao = 'A'
    assert_not roadway.save
  end

end
