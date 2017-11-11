class QuestionsController < ApplicationController

	def new
  		@question = Question.new()
	end

	def index
		@questions = Question.all.order("created_at DESC").paginate(page: params[:page], per_page: 7)
	end

	def show
		@question = Question.find(params[:id])
	end

	def create
		#render plain: params[:post].inspect
		if(current_user)
			@question = Question.new(question_params.merge(user_id: current_user.id, name: current_user.name))
		else
			@question = Question.new(question_params.merge(user_id: 1, name: session[:omniauth]['info']['name']))
		end
		if(@question.save)
			redirect_to @question
		else
			render "new"
		end
	end


	def edit
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		if(@question.update(question_params))
			redirect_to @question
		else
			render 'edit'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to questions_path
	end


	private def question_params
		params.require(:question).permit(:qtext, :description)
	end

end
