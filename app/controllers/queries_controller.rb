class QueriesController < ApplicationController
  # GET /queries
  # GET /queries.json
  def index
    #I'm not sure we should show all the queries that have been run... 
    #If we don't show them, though, how will people know which ones they've done?
    #Best idea is to add a login.
    @queries = Query.includes(:test).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @queries }
    end
  end

  # GET /queries/1
  # GET /queries/1.json
  def show
    @query = Query.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @query }
    end
  end

  # GET /queries/new
  # GET /queries/new.json
  def new
    @query = Query.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @query }
    end
  end

  # GET /queries/1/edit
  def edit
    @query = Query.find(params[:id])
  end

  # POST /queries
  # POST /queries.json
  def create
    #make this "run" instead of "create". Change all of the code to be how it takes 
    #the email and passes it into the right script for the test
    @query = Query.new(params[:query])
    respond_to do |format|
      if @query.save
        format.html { redirect_to @query, :notice => 'Certificate was successfully located. Test Passed.' }
        format.json { render :json => @query, :status => :created, :location => @query }
      else
        format.html { render :action => "new" }
        format.json { render :json => @query.errors, :status => :unprocessable_entity }
      end
    end
  end
   def destroy
    @query = Query.find(params[:id])
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url }
      format.json { head :no_content }
    end
  end
end
