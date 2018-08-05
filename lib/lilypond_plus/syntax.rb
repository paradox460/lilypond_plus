require 'pry'
class LilypondPlus::Syntax
  class << self
    def parse(file_list)
    end
  end

  def initialize(buffer)
    @buffer = buffer
    durations!
    prefix_beam_slur!
  end

  attr_reader :buffer

  private

  def durations!
    regexp = /(#{LilypondPlus::BaseRegexps::PITCH})([36]4?)/
    value = { '3' => '32', '6' => '16', '64' => '64' }
    @buffer.gsub!(regexp) { "#{$1}#{value[$2]}" }
  end

  def prefix_beam_slur!
    regexp = /\[(#{LilypondPlus::BaseRegexps::NOTE})\s/
    @buffer.gsub!(regexp) { "#{$1} [" }
  end
end
