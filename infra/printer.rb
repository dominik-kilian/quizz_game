module Infra
  class Printer
    class << self

      def default(message)
        puts message.light_cyan.on_light_black
      end

      def options(message)
        puts message.black.on_light_yellow
      end

      def wrong(message)
        puts message.black.on_light_red
      end

      def correct(message)
        puts message.black.on_green
      end

      def finish(message)
        puts message.black.on_blue
      end

      def welcome(message)
        puts message.black.on_magenta
      end
    end
  end
end