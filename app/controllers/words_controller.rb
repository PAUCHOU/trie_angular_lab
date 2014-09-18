class WordsController < ApplicationController
  before_action :render_layout_if_html

  def index
    render json: Word.all
  end

  def create
    render json: Word.create(word_params)
  end

  private
    def word_params
      params.require(:word).permit(:name, :description)
    end

    def render_layout_if_html
      if request.format.symbol == :html
        render "layouts/application"
      end
    end
end
