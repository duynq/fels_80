class Admin::WordsController < ApplicationController

  before_action :logged_in_user
  before_action :load_word, only: [:edit, :destroy, :update]

  def index
    @words = Word.paginate(page: params[:page],per_page: Settings.page_per).order :name
  end

  def new
    @word = Word.new
    @categories = Category.all
    Settings.number_answers.times do
      @answer = @word.answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "words.create_success"
      redirect_to admin_words_path
    else
      flash[:error] = t "words.create_fails"
      redirect_to :back
    end
  end

  def destroy
    if @word.destroy
      flash[:success] = t "flash.delete"
      redirect_to admin_words_path
    else
      flash[:success] = t "words.delete_fails"
      redirect_to admin_words_path
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "flash.update"
      redirect_to admin_words_path
    else
      flash[:error] = t "words.update_fails"
      render :edit
    end
  end

  private

  def word_params
    params.require(:word).permit :name, :category_id, answers_attributes: [:id,
      :content, :is_correct, :_destroy]
  end

  def load_word
    @word = Word.find params[:id]
  end
end
