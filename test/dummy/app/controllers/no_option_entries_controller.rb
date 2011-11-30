class NoOptionEntriesController < ApplicationController
  def index
  end

  def show
    @entry = NoOptionEntry.find(params[:id])
  end

  def new
    @entry = NoOptionEntry.new
  end

  def create
    @entry = NoOptionEntry.new(params[:no_option_entry])
    if @entry.save
      redirect_to no_option_entry_url(@entry)
    else
      render :action => :new
    end
  end

  def edit
    @entry = NoOptionEntry.find(params[:id])
  end
  
  def update
    @entry = NoOptionEntry.find(params[:id])
    if @entry.update_attributes(params[:no_option_entry])
      redirect_to no_option_entry_url(@entry)
    else
      render :action => :edit
    end
  end
end
