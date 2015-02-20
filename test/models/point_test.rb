require 'test_helper'
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class PointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe Point do
	  it "should import the points from a cvs file" do
	    count = Point.count
	    Point.import_from_csv(File.dirname(__FILE__) + '/../fixtures/input_valido.csv')
	    Point.count.should == count + 100
	  end

	  it "should create a new point from a row of a csv file" do
	    row = ['placa', 'br-153', 'norte', 2]
	    Point.create_from_csv_row(row)
	    Point.find_by_tipo_and_rodovia_and_sentido_and_conservacao("placa", "br-153", "norte", 2).should_not be_nil
	  end

	  it "should not import the points from a cvs file with invalid params" do
	    count = Point.count
	    Point.import_from_csv(File.dirname(__FILE__) + '/../fixtures/input_invalido.csv')
	    Point.count.should be(count)
	  end

	   it "should not create a new point from a row of a csv file with invalid params" do
	    row = [2, 'br-153', 'norte', 'raios']
	    Point.create_from_csv_row(row)
	    Point.find_by_tipo_and_rodovia_and_sentido_and_conservacao("placa", "br-153", "norte", 2).should_not be_nil
	  end


	end

end
