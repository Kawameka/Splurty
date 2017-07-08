class QuotesController < ApplicationController
  def index
    # randomize the Quote database/model, then pull the first quote
    # using @ with a variable turns it into an instance variable
    # using @ is necessary when you want to load a variable into the "views" files
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
    
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

end
