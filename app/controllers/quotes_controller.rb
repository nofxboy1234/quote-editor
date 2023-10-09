class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    # @quotes = Quote.ordered
    @quotes = current_company.quotes.ordered
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    # @quote = Quote.new(quote_params)
    @quote = current_company.quotes.build(quote_params)

    if @quote.save
      respond_to do |format|
        format.html do
          puts '**** format.html ****'
          redirect_to quotes_path, notice: 'Quote was successfully created.'
        end
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: 'Quote was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: 'Quote was successfully destroyed.' }
      format.turbo_stream
    end
  end

  private

  def set_quote
    # @quote = Quote.find(params[:id])
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
