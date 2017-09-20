module QuestionHelper
  def question_small(q, &block)
    cls = ['question-small']
    cls << 'question-pinned' if q.pin?
    cls = cls.join(' ')
    content_tag :div, 'class' => cls, 'data-id' => q.id do
      capture(&block)
    end
  end
end
