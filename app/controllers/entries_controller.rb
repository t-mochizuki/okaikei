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
  end
end
