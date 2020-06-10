class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(allow_params[:id])
    @version_user = VersionUser.where(user_id: allow_params[:user])
    if !@version_user.any? {|h| h[:version] == @lesson[:version]}
      # TODO: could throw exception and let middleware catch once set up.
      render json: {error: "Not Found", status: '404'}
      return
    end

    @questions = Question.where(lesson_id: @lesson[:id])
    @question_ids = @questions.pluck(:id)
    @answers = Answer.where(:question_id =>@question_ids).where(:user_id => @version_user[0][:user_id]).order('id DESC')

    if @answers.empty?
      @answers = nil
    end

    render json: {
        lesson: @lesson[:content],
        questions: @questions.to_json(:except => [:correct_answer]),
        answers: @answers[0].to_json(:only => [:answer, :user_id, :question_id])
    }

  rescue ActiveRecord::RecordNotFound
    render json: {error: "Not Found", status: '404'}
  end


  private

    def allow_params
      params.permit(:user, :id)
    end
end