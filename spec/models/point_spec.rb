require "rails_helper"
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

RSpec.describe Point, :type => :model do
	  it "should import the points from a cvs file" do
	    count = Point.count
	    file = File.open(Rails.root + 'spec/fixtures/input_valido.csv')
	    Point.import(file)
	    expect(Point.count).to be(6)
	  end

	  it "should create a new point from a row of a csv file" do
	    row = { "tipo" => 'placa', "rodovia" => 'br-153', "sentido" => 'norte', "conservacao" => 2 }
	    Point.create_from_csv_row(row)
	    expect(Point.find_by_tipo_and_rodovia_and_sentido_and_conservacao("placa", "br-153", "norte", 2)).to_not be_nil
	  end

	  it "should not import the points from a cvs file with invalid params" do
	    count = Point.count
	    file = File.open(Rails.root + 'spec/fixtures/input_invalido.csv')
	    expect { Point.import(file) }.to raise_error(ActiveRecord::RecordInvalid)
	  end

	   it "should require a rodovia" do
	    point = Point.create(tipo:"Walking down the streeeet", rodovia: nil, sentido: 'norte', conservacao: 2)
	    expect(point.errors.full_messages[0]).to eq("Rodovia can't be blank")
	  end

	   it "should require a tipo" do
	    point = Point.create(tipo: nil , rodovia: 'br', sentido: 'norte', conservacao: 2)
	    expect(point.errors.full_messages[0]).to eq("Tipo can't be blank")
	  end

	   it "should require a sentido" do
	    point = Point.create(tipo:"Walking down the streeeet", rodovia: 'br', sentido: nil, conservacao: 2)
	    expect(point.errors.full_messages[0]).to eq("Sentido can't be blank")
	  end

	  it "should require a sentido value to be in [norte,sul,leste,oeste]" do
	  	sentido = 'nordeste'
	    point = Point.create(tipo:"Walking down the streeeet", rodovia: 'br', sentido: sentido, conservacao: 2)
	    expect(point.errors.full_messages[0]).to eq("Sentido #{sentido} is not included in permitted list")
	  end

	   it "should require a conservacao" do
	    point = Point.create(tipo:"Walking down the streeeet", rodovia: 'br', sentido: 'norte', conservacao: nil)
	    expect(point.errors.full_messages[0]).to eq("Conservacao can't be blank")
	  end

end