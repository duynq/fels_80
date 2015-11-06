class LessonsController < ApplicationController
  before_action :logged_in_user

  def create
    @lesson = current_user.lessons.create lesson_params
    if @lesson.save
      flash[:success] = t "lessons.index.success"
      redirect_to @lesson
    else
      flash[:danger] = t "lessons.index.fails"
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.lesson(current_user.id)
    @time_remaining = @lesson.time_remaining
    @is_time_over = @time_remaining < 0
  end

  def update
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = t "lessons.update.success"
    else
      flash[:danger] = t "lessons.update.fail"
    end
    redirect_to @lesson
  end

  private
  def lesson_params
    params.require(:lesson).permit :category_id, :learned, lesson_words_attributes: [:category_id, :id,
      :answer_id]
  end
end
