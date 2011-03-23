class ProjectsController < ApplicationController
  load_resource

  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.order("fecha DESC").where(:fin => false)
    if can? :manage, Project
      if current_user.admin?
        @projects_fin = Project.order("fecha DESC").where(:fin => true)
      else
        @projects_fin = Project.order("fecha DESC").where(:fin => true, :coordinator_id => current_user.id)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    @btn = "Crear Proyecto"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @btn = "Guardar Cambios"
	
	respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
    @coordinator = User.find_all_by_id(params[:project])
    @project.coordinator = @coordinator

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])
    coordinator = User.find_by_id(params[:coordinator_id])
    @project.coordinator = coordinator

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def projend
    @project = Project.find(params[:project_id])
    @project.fin = true
    @project.save

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml { head :ok }
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:project_id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
	
	# GET /projects/1/add_user
	def add_user
		
		@project = Project.find(params[:project_id])
		@user = current_user
		
		@project_user = ProjectUser.new(:project_id => @project.id, :user_id => @user.id)
		
		
		
		respond_to do |format|
			if (@project_user.save)
				format.html { redirect_to(projects_url, :notice => "Inscrito exitosamente") }
				format.xml  { head :ok }
			else
				format.html { redirect_to(projects_url, :notice => "Error") }
				format.xml  { head :ok }
			end
		end
	end
	
  private
    def check_permissions
      @user = current_user
      if !(@user.coordinator? || @user.admin?)
        flash[:error] = "No se tienen los permisos necesarios para acceder"
        redirect_to :root
      end
    end
end
