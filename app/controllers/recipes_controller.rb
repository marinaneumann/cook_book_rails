class RecipesController <ApplicationController
  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      flash[:notice]= "Your recipe was added to the Joy of Cooking!!"
      render('recipes/success.html.erb')
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render('recipes/destroy.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      render('recipes/success.html.erb')
    else
      render('recipes/edit.html.erb')
    end
  end
end
