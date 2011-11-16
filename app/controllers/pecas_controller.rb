require 'CSV'
class PecasController < ApplicationController
  
  def index2
    @produto = Produto.find(params[:produto_id])
    @pecas = @produto.pecas
  end

  def show2
    @produto = Produto.find(params[:produto_id])
    @peca = @produto.pecas.find(params[:id])
  end

  def new2
    @produto = Produto.find(params[:produto_id])
    @peca = @produto.pecas.build
  end

  def create2
    @produto = Produto.find(params[:produto_id])
    @peca = @produto.pecas.build(params[:peca])
    if @peca.save
      redirect_to produto_component_url(@produto, @peca)
    else
      render :action => "new"
    end
  end

  def edit2
    @produto = Produto.find(params[:produto_id])
    @peca = @produto.pecas.find(params[:id])
  end

  def update2
    @produto = Produto.find(params[:produto_id])
    @peca = Peca.find(params[:id])
    if @peca.update_attributes(params[:peca])
      redirect_to produto_component_url(@produto, @peca)
    else
      render :action => "edit"
    end
  end

  def destroy2
    @produto = Produto.find(params[:produto_id])
    @peca = Peca.find(params[:id])
    @peca.destroy

    respond_to do |format|
      format.html { redirect_to produto_components_path(@produto) }
      format.xml  { head :ok }
    end
  end
  
  # GET /pecas
  # GET /pecas.xml
  def index
    @pecas = Peca.find :all, :order => :produto_id

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pecas }
    end
  end
  
  # Importar dados de CSV
    def csv_import
      @parsed_file=CSV::Reader.parse(params[:dump][:file], ";")
      n=0
      @parsed_file.each do |row|
      c=Peca.new
      c.produto_id=row[0]
      c.codigo=row[1]
      c.descr=row[2]
      c.acab=row[3]
      c.larg=row[4]
      c.alt=row[5]
      c.prof=row[6]
      c.qtde=row[7]
      c.total=row[8]
      c.custo=row[9]
      c.fita=row[10]
      c.pino=row[11]
      c.embal=row[12]
      c.mdf=row[13]
      c.mdf2=row[14]
      c.ferr=row[15]
      c.ferr2=row[16]
      if c.save
        n=n+1
        GC.start if n%50==0
      end
      flash.now[:message]="Arquivo de peças importado com sucesso, #{n} registros adicionados à tabela."
      end
    end
    
  def reports
  @pecas = Peca.find :all, :order => :produto_id

  respond_to do |format|
    format.html # reports.html.erb
    format.xml  { render :xml => @pecas }
  end
end

  # GET /pecas/1
  # GET /pecas/1.xml
  def show
    @peca = Peca.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @peca }
    end
  end

  # GET /pecas/new
  # GET /pecas/new.xml
  def new
    @peca = Peca.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @peca }
    end
  end

  # GET /pecas/1/edit
  def edit
    @peca = Peca.find(params[:id])
  end

  # POST /pecas
  # POST /pecas.xml
  def create
    @peca = Peca.new(params[:peca])

    respond_to do |format|
      if @peca.save
        flash[:notice] = 'Peça criada com sucesso.'
        format.html { redirect_to(@peca) }
        format.xml  { render :xml => @peca, :status => :created, :location => @peca }
      else
        flash[:notice] = 'O formulário contém erros. Verifique os campos digitados e tente novamente.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @peca.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pecas/1
  # PUT /pecas/1.xml
  def update
    @peca = Peca.find(params[:id])

    respond_to do |format|
      if @peca.update_attributes(params[:peca])
        flash[:notice] = 'Peça atualizada com sucesso.'
        format.html { redirect_to(@peca) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'O formulário contém erros. Verifique os campos digitados e tente novamente.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @peca.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pecas/1
  # DELETE /pecas/1.xml
  def destroy
    @peca = Peca.find(params[:id])
    @peca.destroy
    flash[:notice] = 'Peça excluída com sucesso.'

    respond_to do |format|
      format.html { redirect_to(pecas_url) }
      format.xml  { head :ok }
    end
  end
end
