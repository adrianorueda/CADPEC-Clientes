class AgendasController < ApplicationController
def index
    @cliente = Cliente.find(params[:cliente_id])
    @agendas = @cliente.agendas
  end

  def show
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = @cliente.agendas.find(params[:id])
  end

  def new
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = @cliente.agendas.build
  end

  def create
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = @cliente.agendas.build(params[:agenda])
    if @agenda.save
      redirect_to cliente_agenda_url(@cliente, @agenda)
    else
      render :action => "new"
    end
  end

  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = @cliente.agendas.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = Agenda.find(params[:id])
    if @agenda.update_attributes(params[:agenda])
      redirect_to cliente_agenda_url(@cliente, @agenda)
    else
      render :action => "edit"
    end
  end

  def destroy
    @cliente = Cliente.find(params[:cliente_id])
    @agenda = Agenda.find(params[:id])
    @agenda.destroy

    respond_to do |format|
      format.html { redirect_to cliente_agendas_path(@cliente) }
      format.xml  { head :ok }
    end
  end

end
