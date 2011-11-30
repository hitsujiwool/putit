class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(params[:entry])
    if @entry.save
      redirect_to entry_url(@entry)
    else
      render :action => :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
  end
  
  def update
    @entry = Entry.find(params[:id])
    logger.debug(params[:entry].to_yaml)
    if @entry.update_attributes(params[:entry])
      redirect_to entry_url(@entry)
    else
      logger.debug(@entry.errors.to_yaml)
      render :action => :edit
    end
  end
end
