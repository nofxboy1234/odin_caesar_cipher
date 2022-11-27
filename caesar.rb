def caesar_cipher(text, key)
  new_text = ''
  text.each_char do |char|
    a_ord = 'a'.ord
    z_ord = 'z'.ord
    char_ord = char.downcase.ord

    was_downcased = (char != char.downcase)

    target_ord = char_ord + key

    puts "a_ord: #{a_ord}"
    puts "z_ord: #{z_ord}"
    puts "char_ord: #{char_ord}"
    puts "target_ord: #{target_ord}"

    puts "was_downcased: #{was_downcased}"
    puts "char: #{char}"

    if char.match(/^[[:alpha:]]$/)
      puts 'char is alphanumeric'
      # if target_ord > z_ord
      #   puts 'alphanumeric: wraps from z to a'
      #   wrap_offset = (char.ord + key) - 'z'.ord
      #   ('a'.ord + wrap_offset).chr
      # else
      #   puts 'alphanumeric: normal shift'
      #   char = (char.ord + key).chr
      #   return char
      # end
    else
      puts 'not alphanumeric'
      char
    end
  end

  # new_text << if char.match(/^[[:alpha:]]$/)
  #               puts 'char is alphanumeric'
  # if target_ord > z_ord
  #   puts 'alphanumeric: wraps from z to a'
  #   wrap_offset = (char.ord + key) - 'z'.ord
  #   ('a'.ord + wrap_offset).chr
  # else
  #   puts 'alphanumeric: normal shift'
  #   char = (char.ord + key).chr
  #   return char
  # end
  # else
  #   puts 'not alphanumeric'
  #   char
  # end
  # end
  # new_text
end

# encrypted_text = caesar_cipher('What a string!', 5)
encrypted_text = caesar_cipher('W', 5)
puts encrypted_text

# => "Bmfy f xywnsl!"

# Iterate through each character
# Convert string into a number.
# Add key number
# Wrap from z to a.
# Keep the same case.
# return new string
