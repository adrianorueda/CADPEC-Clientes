class HistoricosController < ApplicationController
def index
    @cliente = Cliente.find(params[:cliente_id])
    @historicos = @cliente.historicos
  end

  def show
    @cliente = Cliente.find(params[:cliente_id])
    @historico = @cliente.historicos.find(params[:id])
  end

  def new
    @cliente = Cliente.find(params[:cliente_id])
    @historico = @cliente.historicos.build
  end

  def create
    @cliente = Cliente.find(params[:cliente_id])
    @historico = @cliente.historicos.build(params[:historico])
    if @historico.save
      redirect_to cliente_historico_url(@cliente, @historico)
    else
      render :action => "new"
    end
  end

  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @historico = @cliente.historicos.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:cliente_id])
    @historico = Historico.find(params[:id])
    if @historico.update_attributes(params[:historico])
      redirect_to cliente_historico_url(@cliente, @historico)
    else
      render :action => "edit"
    end
  end

  def destroy
    @cliente = Cliente.find(params[:cliente_id])
    @historico = Historico.find(params[:id])
    @historico.destroy

    respond_to do |format|
      format.html { redirect_to cliente_historicos_path(@cliente) }
      format.xml  { head :ok }
    end
  end

end
