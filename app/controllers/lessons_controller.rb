class LessonsController < ApplicationController
  def index
    @sources = Lesson.all
    render json: @sources
  end

  def show
    @user = User.find(allow_params[:user])
    @version_user = VersionUser.where(user_id: @user[:id])
    @lesson = Lesson.find(allow_params[:lesson])
    #TODO: determine if user has been assigned to lesson. if not: 404
    # # If not 404, then send send the contents, questions: [{uid, question, user_latest_answer: answer or nil}}],

    # TODO: determine correect questions based on UID
    @questions = Question.where(lesson_id: @lesson[:id])

    #TODO: only show contents of lesson, questions: [uid, question, users answer || nil]
    render json: {lesson: @lesson,
                  questions: @questions,
                  version_user: @version_user,
                  user: @user }
  end


  private

    def allow_params
      params.permit(:user, :lesson)
    end
end