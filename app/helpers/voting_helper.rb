module VotingHelper
	def question_vote_button(question, type, class_name)
		path = "/users/questions/#{question.id}/vote/#{type}"
		id = "question-vote-#{type}"
		icon = fa_icon "arrow-#{type}", class: class_name
		link_to icon, path, id: id, method: :post, remote: true
	end

	def answer_vote_button(answer, type, class_name)
		path = "/users/questions/answers/#{answer.id}/vote/#{type}"
		id = "answer-vote-#{type}"
		icon = fa_icon "arrow-#{type}", class: class_name
		link_to icon, path, id: id, method: :post, remote: true
	end
end
