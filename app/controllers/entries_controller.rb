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

  def edit
    @entry = Entry.find(params[:id])

    render template: '/entries/update'
  end

  # The update method needs id of entry object to find the updated object.
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to "/entries/show/#{@entry.id}", notice: 'Entry was successfully updated.' }
      else
        format.html { render template: "/entries/edit/#{@entry.id}" }
      end
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:date, :comment)
  end
end
