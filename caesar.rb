def caesar_cipher(text, _key)
  text.each_char do |char|
    puts char
  end
end

caesar_cipher('What a string!', 5)

# => "Bmfy f xywnsl!"

# Iterate through each character
# Convert string into a number.
# Add key number
# Wrap from z to a.
# Keep the same case.
# return new string
