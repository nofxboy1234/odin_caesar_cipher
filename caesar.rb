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
      if target_ord > z_ord
        puts 'alphanumeric: wraps from z to a'
        wrap_offset = target_ord - z_ord
        new_char = (a_ord + wrap_offset - 1).chr

        new_char.upcase! if was_downcased

        new_text << new_char
      else
        puts 'alphanumeric: normal shift'
        char = target_ord.chr
        new_text << char
      end
    else
      puts 'not alphanumeric'
      new_text << char
    end
  end

  new_text
end

encrypted_text = caesar_cipher('What a string!', 5)
# encrypted_text = caesar_cipher('F', -5)

puts "encrypted_text: #{encrypted_text}"

# => "Bmfy f xywnsl!"

# Iterate through each character
# Convert string into a number.
# Add key number
# Wrap from z to a.
# Keep the same case.
# return new string
