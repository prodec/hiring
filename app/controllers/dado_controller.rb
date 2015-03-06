class DadoController < ApplicationController
  	
  before_action :get_dado, only: [:delete] 
  
  def get_dado
  	
  	@dado = Dado.find(params[:id])
  		
  end
  
  def importa
  

  end

  def relatorio
  
  	#@dados = Dado.all
  	@dados = Dado.search(params[:search])

  end

  def delete 
 
   	@dado.delete
  	#Dado.destroy(params[:id])
  	redirect_to action: 'relatorio'
  	
  end

  def upload
  
    require 'csv'
    
    if params[:file] != nil
    
	  	arquivo = params[:file].read
	  	arquivo_csv = CSV.parse(arquivo)
	  	arquivo_csv.slice!(0)
	    
		arquivo_csv.each do |row|
		  		Dado.create(:tipo => row[0], :rodovia => row[1], :sentido => row[2], :conservacao => row[3])
		end

		redirect_to action: 'relatorio'
	
	else
	
		flash[:notice] = 'Selecione um arquivo!'
		redirect_to action: 'importa'
	
	end
	
  end
  
  def download
    send_file 'app/assets/input_valido.csv', :type=>"application/csv", :x_sendfile=>true
  end

end
