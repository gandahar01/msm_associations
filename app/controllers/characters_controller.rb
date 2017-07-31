class CharactersController < ApplicationController
  def index
    @characters = Character.all

    render("characters/index.html.erb")
  end

  def show
    @character = Character.find(params[:id])

    render("characters/show.html.erb")
  end

  def new
    @character = Character.new

    render("characters/new.html.erb")
  end

  def create
    @character = Character.new

    @character.movie_id = params[:movie_id]
    @character.actor_id = params[:actor_id]
    @character.name = params[:name]

    save_status = @character.save

    if save_status == true
      redirect_to("/characters/#{@character.id}", :notice => "Character created successfully.")
    else
      render("characters/new.html.erb")
    end
  end

  def edit
    @character = Character.find(params[:id])

    render("characters/edit.html.erb")
  end

  def update
    @character = Character.find(params[:id])

    @character.movie_id = params[:movie_id]
    @character.actor_id = params[:actor_id]
    @character.name = params[:name]

    save_status = @character.save

    if save_status == true
      redirect_to("/characters/#{@character.id}", :notice => "Character updated successfully.")
    else
      render("characters/edit.html.erb")
    end
  end

  def destroy
    @character = Character.find(params[:id])

    @character.destroy

    if URI(request.referer).path == "/characters/#{@character.id}"
      redirect_to("/", :notice => "Character deleted.")
    else
      redirect_to(:back, :notice => "Character deleted.")
    end
  end
end
