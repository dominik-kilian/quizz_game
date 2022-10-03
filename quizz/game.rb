require_relative './question'
require_relative './answer'
require_relative '../infra/printer'

module Quizz
  class Game

    QUESTIONS = [
      Question.new(
        content: 'What is the capitol of France?',
        answers: [
          Answer.new(content: 'Marseille'),
          Answer.new(content: 'Rennes'),
          Answer.new(content: 'Paris', is_correct: true)
        ]
      ),
      Question.new(
        content: 'What is the capitol of Italy?',
        answers: [
          Answer.new(content: 'Rome', is_correct: true),
          Answer.new(content: 'Milano'),
          Answer.new(content: 'Venice')
        ]
      ),
    Question.new(
      content: 'What is the capitol of Poland',
      answers: [
        Answer.new(content: 'Warsaw', is_correct: true),
        Answer.new(content: 'Wroclaw'),
        Answer.new(content: 'Poznan')
      ]
    )
    ]

    def initialize
      @points = 0
    end

    def play
      QUESTIONS.each_with_index do |question, index|
        Infra::Printer.default question.content
        Infra::Printer.default "Options: "
        question.answers.each do |answer|
          Infra::Printer.options  "- #{answer.content}"
        end
        answer = gets.chomp

        if question.correct_answer?(answer)
          correct!
        else
          Infra::Printer.wrong "Wrong answer! Try again :)"
          answer = gets.chomp
          if question.correct_answer?(answer)
            correct!
          else
            last_question?(index) ? Infra::Printer.wrong("Wrong!") : Infra::Printer.wrong('Wrong! Next Question')
          end
        end
      end
      Infra::Printer.finish "Game finish, you have #{@points} points."
    end

    private
    def correct!
      Infra::Printer.correct "Correct"
      @points += 1
    end

    def last_question?(index)
      index == QUESTIONS.length - 1
    end
  end
end