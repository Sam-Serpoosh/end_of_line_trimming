class LineTrimmer

  END_OF_LINE = "\n"

  def trim text
    if multiline? text 
      return trim_all_lines text
    end

    trim_line text 
  end

  def multiline?(text)
    text.include?(END_OF_LINE)
  end

  def trim_all_lines text
    lines = text.split(/\n/)
    trimmed_text = ""
    lines.each do |line|
      trimmed_text += trim_line(line) + END_OF_LINE
    end
    return trimmed_text
  end

  def trim_line line
    ending_white_space_index = line.index_of_first_ending_white_space
    return line if ending_white_space_index.nil?

    line[0..ending_white_space_index - 1]
  end

end

class String

  WHITE_SPACE = " "
  TAB = "\t"

  def index_of_first_ending_white_space 
    last_white_index = nil
    first_white_at_end = nil

    for char_index in 0..self.length - 1
      if self[char_index] == WHITE_SPACE || self[char_index] == TAB
        last_white_index = char_index
        first_white_at_end ||= char_index
      else
        last_white_index = nil
        first_white_at_end = nil
      end
    end

    last_white_index.nil? ? nil : first_white_at_end
  end

end
