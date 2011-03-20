class AccountsController < ApplicationController
  load_and_authorize_resource

  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = User.search(params[:username],params[:nombre],params[:apellido_paterno],params[:apellido_materno])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = User.find(params[:user_id])

    if @account.admin?
      @tipoCuenta = "Administrador"
    elsif @account.coordinator?
      @tipoCuenta = "Coordinador"
    else
      @tipoCuenta = "Estudiante"
    end

    if @account.celular.blank?
      @celular = "No fue proporcionado"
    else
      @celular = @account.celular
    end

    if @account.tec?
      @universidad = "ITESM"
    else
      @universidad = "UDEM"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  #GET /accounts/1/edit
  def edit
    @account = User.find(params[:user_id])
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
#    @account = User.find(params[:user_id])
    user_id = params[:user_id]
    user = params[:user]
    nombre = user[:nombre]
    appat = user[:apellido_paterno]
    apmat = user[:apellido_materno]
    email = user[:email]
    tel = user[:telefono]
    cel = user[:celular]
    direccion = user[:direccion]

    case params["tipoCuenta"]
      when "2"
        sql = "UPDATE users SET coordinator = '', admin = 't' WHERE id = '#{user_id}'"
      when "1"
        sql = "UPDATE users SET coordinator = 't', admin = '' WHERE id = '#{user_id}'"
      else
        sql = "UPDATE users SET coordinator = '', admin = '' WHERE id = '#{user_id}'"
    end
    ActiveRecord::Base.connection.execute(sql)

    sql = "UPDATE users SET nombre = '#{nombre}', apellido_paterno = '#{appat}', apellido_materno = '#{apmat}', email = '#{email}', telefono = '#{tel}', celular = '#{cel}', direccion = '#{direccion}' WHERE id = #{user_id}"

    respond_to do |format|
      if ActiveRecord::Base.connection.execute(sql)
        format.html { redirect_to account_path(:user_id => user_id), :notice => 'La cuenta de ha sido actualizada.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = User.find(params[:user_id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
end
