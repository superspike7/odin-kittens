class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def delete

  end

  def update
  end

  def create
  end

end
