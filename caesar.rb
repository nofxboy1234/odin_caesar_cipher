# frozen_string_literal: true

def get_alphanum_char(char, key)
  was_downcased = (char != char.downcase)
  target_ord = char.downcase.ord + key

  if target_ord > 'z'.ord
    wrap_offset = target_ord - 'z'.ord
    new_char = ('a'.ord + wrap_offset - 1).chr
  else
    new_char = target_ord.chr
  end
  new_char.upcase! if was_downcased
  new_char
end

def caesar_cipher(text, key)
  new_text = ''
  text.each_char do |char|
    new_text += if char.match(/^[[:alpha:]]$/)
                  get_alphanum_char(char, key)
                else
                  char
                end
  end
  new_text
end

encrypted_text = caesar_cipher('What a string!', 5)
# encrypted_text = caesar_cipher('F', -5)
# encrypted_text = caesar_cipher('a', -1)

puts "encrypted_text: #{encrypted_text}"

# => "Bmfy f xywnsl!"
