module VotingHelper
	def vote_button_suffix(o, type)
		case type
		when :up then
			current_user.voted_up_on?(o) ? 'green' : 'default'
		when :down then
			current_user.voted_down_on?(o) ? 'red' : 'default'
		end
	end

	def vote_button(o, type)
		return unless user_signed_in? && o.user != current_user
		id = "#{o.class.to_s.downcase}-vote-#{type}"
		suffix = vote_button_suffix(o, type)
		icon = fa_icon "arrow-#{type}", class: "btn-#{suffix}"
		link_to icon, o.vote_path(type), id: id, method: :put, remote: true
	end

	def question_vote_score(q)
		content_tag :div, q.score, class: 'score'
	end

	def question_vote_button(q, type)
		vote_button(q, type)
	end

	def answer_vote_score(a)
		content_tag :div, a.score, class: 'score'
	end

	def answer_vote_button(a, type)
		vote_button(a, type)
	end
end
