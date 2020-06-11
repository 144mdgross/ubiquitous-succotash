class LessonsController < ApplicationController
  @@not_found = { error: 'Not Found', status: '404' }

  def show
    @lesson = Lesson.find(allow_params[:id])
    @version_user = VersionUser.where(user_id: allow_params[:user])

    # ensure the user has been assigned to the lesson
    if !@version_user.any? {|h| h[:version] == @lesson[:version]}
      render json: { error: 'Not Found', status: '404' }
      return @@not_found
    end

    @user_id = @version_user[0][:user_id]
    @questions = Question.where(lesson_id: @lesson[:id])

    # now get the uids of each question to properly track answers.
    @uids = []
    @questions.each do |q|
      @uids.push(q[:uid])
    end

    @all_questions = Question.where(:uid => @uids)
    @answers = Answer.where(:question_id => @all_questions.pluck(:id)).where(:user_id => @user_id).order('id ASC')

    @final_answers = {}

    # loop over each potential question there could be an answer for and collect most recent answer.
    @all_questions.each do |q|
      # initialize questions to have a nil response. Will be overwritten if a student has answered.
      if @final_answers[q[:uid]].nil?
        @final_answers[q[:uid]] = {answer: nil, question_id: q[:id], user_id: @user_id}
        puts @final_answers[q[:uid]]
      end

      @answers.each do |a|
        if  a[:question_id].equal? q[:id]
          # NOTE. Answers are sorted by ID, so the most recent answer will be the one to display
          @final_answers[q[:uid]] = a
        end
      end
    end

    render json: {
        lesson: @lesson[:content],
        questions: @questions.to_json(:except => [:correct_answer]),
        answers: @final_answers,
    }

  rescue ActiveRecord::RecordNotFound
    render json: @@not_found
  end


  private

    def allow_params
      params.permit(:user, :id)
    end
end