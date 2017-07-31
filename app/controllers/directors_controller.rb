class DirectorsController < ApplicationController
  def index
    @directors = Director.all

    render("directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    
    @movie = Movie.find(params[:id])
    @movies = Movie.all
    
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    # @dis = Movie.distinct.count(:id => Movie.director_id )
    # @dis = @movies.group_by(&:director_id).count
    # @dis = @movies.find_by({ :id => Director.name }).count
    
    # @dis = Director.find_by({ :id => @movie.director_id })

    render("directors/show.html.erb")
  end

  def new
    @director = Director.new

    render("directors/new.html.erb")
  end

  def create
    @director = Director.new

    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    save_status = @director.save

    if save_status == true
      redirect_to("/directors/#{@director.id}", :notice => "Director created successfully.")
    else
      render("directors/new.html.erb")
    end
  end

  def edit
    @director = Director.find(params[:id])

    render("directors/edit.html.erb")
  end

  def update
    @director = Director.find(params[:id])

    @director.name = params[:name]
    @director.dob = params[:dob]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    save_status = @director.save

    if save_status == true
      redirect_to("/directors/#{@director.id}", :notice => "Director updated successfully.")
    else
      render("directors/edit.html.erb")
    end
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy

    if URI(request.referer).path == "/directors/#{@director.id}"
      redirect_to("/", :notice => "Director deleted.")
    else
      redirect_to(:back, :notice => "Director deleted.")
    end
  end
end
