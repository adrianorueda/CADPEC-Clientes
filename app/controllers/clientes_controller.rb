class ClientesController < ApplicationController
  # GET /clientes
  # GET /clientes.xml
  def index
    @clientes = Cliente.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clientes }
    end
  end
  
  def reports
    @clientes = Cliente.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clientes }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.xml
  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cliente }
    end
  end

  # GET /clientes/new
  # GET /clientes/new.xml
  def new
    @cliente = Cliente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cliente }
    end
  end

  # GET /clientes/1/edit
  def edit
    @cliente = Cliente.find(params[:id])
  end

  # POST /clientes
  # POST /clientes.xml
  def create
    @cliente = Cliente.new(params[:cliente])

    respond_to do |format|
      if @cliente.save
        flash[:notice] = 'Cliente criado com sucesso.'
        format.html { redirect_to(@cliente) }
        format.xml  { render :xml => @cliente, :status => :created, :location => @cliente }
      else
        flash[:notice] = 'O formulário contém erros. Verifique os campos digitados e tente novamente.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clientes/1
  # PUT /clientes/1.xml
  def update
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      if @cliente.update_attributes(params[:cliente])
        flash[:notice] = 'Cliente atualizado com sucesso.'
        format.html { redirect_to(@cliente) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'O formulário contém erros. Verifique os campos digitados e tente novamente.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cliente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.xml
  def destroy
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    flash[:notice] = 'Cliente excluído com sucesso.'

    respond_to do |format|
      format.html { redirect_to(clientes_url) }
      format.xml  { head :ok }
    end
  end
end
