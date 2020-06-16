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

    @answers = Answer.select('answers.id, answers.answer, questions.uid').
        joins(:question).
        where('questions.uid' => @uids, user_id: @user_id).
        order('answers.id DESC')

    @final_answers = {}
    # initialize questions to have a nil response. Will be overwritten if a student has answered.
    @uids.each { |uid| @final_answers[uid] = nil}

    # loop over each potential question there could be an answer for and collect most recent answer.
    @answers.each do |a|
      if @final_answers[a[:uid]].nil?
        @final_answers[a[:uid]] = a
      end
    end

    render json: {
        lesson: @lesson[:content],
        questions: @questions,
        answers: @final_answers,
    }

  rescue ActiveRecord::RecordNotFound
    render json: @@not_found
  end


  private

    def allow_params
      params.permit(:student, :id)
    end
end