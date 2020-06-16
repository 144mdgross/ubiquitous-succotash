class LessonsController < ApplicationController
  @@not_found = { error: 'Not Found', status: '404' }

  def show
    @lesson = Lesson.find(allow_params[:id])
    @version_user = VersionUser.where(user_id: allow_params[:student], version_id: @lesson.version_id)

    # ensure the user has been assigned to the lesson
    if @version_user.empty?
      render json:@@not_found and return
    end

    @user_id = @version_user.first.user_id
    @questions = Question.select('id, lesson_id, question, uid').where(lesson: @lesson)
    @uids = @questions.pluck(:uid)

    @answers = Answer.select('distinct on (questions.uid) questions.uid, answers.id, answers.answer, answers.user_id').
        joins(:question).
        where('questions.uid' => @uids, 'answers.user_id' => @user_id).
        group('questions.uid, answers.id').
        order('questions.uid, answers.id DESC')

    render json: {
        lesson: @lesson[:content],
        questions: @questions,
        answers: @answers,
    }

  rescue ActiveRecord::RecordNotFound
    render json: @@not_found
  end


  private

    def allow_params
      params.permit(:student, :id)
    end
end