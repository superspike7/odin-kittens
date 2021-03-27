class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

   respond_to do |format|

  format.html # show.html.erb
  format.json { render json: @kittens }

    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy 
    @kitten= Kitten.find(params[:id])
    @kitten.destroy

    flash[:notice] = "Kitten successfully deleted"
    redirect_to root_path
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
       flash[:notice] = "Kitten successfully edited"
       redirect_to @kitten
    else
        render 'edit', status: :unprocessable_entity
    end

  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
       flash[:notice] = "Kitten successfully created"
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
   respond_to do |format|

  format.html # show.html.erb
  format.json { render json: @kitten }

    end
  end

private 

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
