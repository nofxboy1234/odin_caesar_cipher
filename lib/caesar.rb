# frozen_string_literal: true

require 'pry-byebug'

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

def simplify_wrapping_key(key)
  key.positive? ? key % 26 : -(key.abs % 26)
end

def get_alphanum_char(char, key)
  key = simplify_wrapping_key(key)

  was_downcased = (char != char.downcase)
  target_ord = char.downcase.ord + key

  new_char = calculate_wrap(target_ord)

  new_char.upcase! if was_downcased
  new_char
end

def alphanum?(char)
  char.match(/^[[:alpha:]]$/)
end

def caesar_cipher(text, key, decrypt: false)
  key = decrypt ? -key : key
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
