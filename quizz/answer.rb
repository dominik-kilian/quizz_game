module Quizz
  class Answer
    attr_reader :content, :is_correct

    def initialize(content:, is_correct: false)
      @content = content
      @is_correct = is_correct
    end

    def correct?
      @is_correct
    end
  end

end