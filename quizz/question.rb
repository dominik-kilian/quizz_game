module Quizz
  class Question
    attr_reader :content, :answers

    def initialize(content:, answers: [])
      @content = content
      @answers = answers
    end

    def correct_answer
      answers.find{|answer| answer.correct?}
    end

    def correct_answer?(answer)
      correct_answer.content == answer
    end

  end
end