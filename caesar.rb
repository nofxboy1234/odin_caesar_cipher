# frozen_string_literal: true

def get_alphanum_char(target_ord, a_ord, z_ord, was_downcased, _new_text)
  if target_ord > z_ord
    wrap_offset = target_ord - z_ord
    new_char = (a_ord + wrap_offset - 1).chr
  else
    new_char = target_ord.chr
  end
  new_char.upcase! if was_downcased
  new_char
end

def caesar_cipher(text, key)
  new_text = ''
  a_ord = 'a'.ord
  z_ord = 'z'.ord
  text.each_char do |char|
    char_ord = char.downcase.ord
    was_downcased = (char != char.downcase)
    target_ord = char_ord + key

    if char.match(/^[[:alpha:]]$/)
      new_char = get_alphanum_char target_ord, a_ord, z_ord, was_downcased, new_text
      new_text += new_char
    else
      new_text += char
    end
  end
  new_text
end

encrypted_text = caesar_cipher('What a string!', 5)
# encrypted_text = caesar_cipher('F', -5)
# encrypted_text = caesar_cipher('a', -1)

puts "encrypted_text: #{encrypted_text}"

# => "Bmfy f xywnsl!"

# Iterate through each character
# Convert string into a number.
# Add key number
# Wrap from z to a.
# Keep the same case.
# return new string
