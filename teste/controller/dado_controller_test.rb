require 'test_helper'

class DadoControllerTest < ActionController::TestCase
  test "should get importa" do
    get :importa
    assert_response :success
  end

  test "should get relatorio" do
    get :relatorio
    assert_response :success
  end

  test "Nao deve salvar dado sem tipo" do
  	dado = Dado.new
  	dado.rodovia = "br-101"
  	dado.sentido = "sul"
  	dado.conservacao = "3"
  	assert_not dado.save
  end

  test "deleta dado" do
  	dado = Dado.new
  	dado.tipo = "placa"
  	dado.rodovia = "br-101"
  	dado.sentido = "sul"
  	dado.conservacao = "3"
  	dado.save
  	
  	assert Dado.delete(dado.id)
  end

  test "testa search" do
    @dados = Dado.search("placa")
    assert @dados.count > 0
  end
  
end
