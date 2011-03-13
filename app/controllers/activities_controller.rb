class ActivitiesController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :activity, :through => :project

  # GET /activities
  # GET /activities.xml
  def index
    @project = Project.find(params[:project_id])
    @activities = @project.activities.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show   
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
    case @activity.actividad
      when 1
        @act = "Actividad"
      when 2
        @act = "Junta"
      when 3
        @act = "Taller"
      else
        @act = "Asueto"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @project = Project.find(params[:project_id])
    @activity = Activity.new
    t = Time.new
    @activity.hora = t
    @activity.duracion = t.change(:hour => 0)
    @activity.valor = 0
    @btn = "Crear Actividad"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
    @btn = "Guardar Cambios"
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])
    @activity.project_id = params[:project_id] 

    respond_to do |format|
      if @activity.save
        format.html { redirect_to(project_activities_path, :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to(project_activities_path, :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @project = Project.find(params[:project_id])
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(project_activities_path) }
      format.xml  { head :ok }
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
