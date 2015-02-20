class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to '/entries/index' }
    end
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to "/entries/show/#{@entry.id}", notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :comment)
  end
end
