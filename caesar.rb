# frozen_string_literal: true

def wrap_z_to_a(target_ord)
  wrap_offset = target_ord - 'z'.ord
  ('a'.ord + wrap_offset - 1).chr
end

def wrap_a_to_z(target_ord)
  wrap_offset = 'a'.ord - target_ord
  ('z'.ord - wrap_offset + 1).chr
end

def calculate_wrap(target_ord)
  if target_ord > 'z'.ord
    wrap_z_to_a(target_ord)
  elsif target_ord < 'a'.ord
    wrap_a_to_z(target_ord)
  else
    target_ord.chr
  end
end

def get_alphanum_char(char, key)
  was_downcased = (char != char.downcase)
  target_ord = char.downcase.ord + key

  new_char = calculate_wrap(target_ord)

  new_char.upcase! if was_downcased
  new_char
end

def alphanum?(char)
  char.match(/^[[:alpha:]]$/)
end

def caesar_cipher(text, key)
  new_text = ''
  text.each_char do |char|
    new_text += if alphanum?(char)
                  get_alphanum_char(char, key)
                else
                  char
                end
  end
  new_text
end

encrypted_text = caesar_cipher('What a string!', 5)
puts "encrypted_text: #{encrypted_text}"
# => "Bmfy f xywnsl!"

encrypted_text = caesar_cipher('z', 5)
puts "encrypted_text: #{encrypted_text}"

encrypted_text = caesar_cipher('a', -1)
puts "encrypted_text: #{encrypted_text}"

encrypted_text = caesar_cipher('A', -1)
puts "encrypted_text: #{encrypted_text}"

encrypted_text = caesar_cipher('A', -3)
puts "encrypted_text: #{encrypted_text}"

encrypted_text = caesar_cipher('Zz', 5)
puts "encrypted_text: #{encrypted_text}"

encrypted_text = caesar_cipher('Ee', -5)
puts "encrypted_text: #{encrypted_text}"

# encrypted_text = caesar_cipher('Zz', 83)
# puts "encrypted_text: #{encrypted_text}"

# encrypted_text = caesar_cipher('Ee', -83)
# puts "encrypted_text: #{encrypted_text}"

# encrypted_text = caesar_cipher('Hello, World!', 75)
# puts "encrypted_text: #{encrypted_text}"

# encrypted_text = caesar_cipher('Hello, World!', -55)
# puts "encrypted_text: #{encrypted_text}"
