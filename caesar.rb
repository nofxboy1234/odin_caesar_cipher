def caesar_cipher(text, key)
  new_text = ''
  text.each_char do |char|
    new_text << (char.ord + key).chr
  end
  new_text
end

encrypted_text = caesar_cipher('What a string!', 5)
puts encrypted_text
# => "Bmfy f xywnsl!"

# Iterate through each character
# Convert string into a number.
# Add key number
# Wrap from z to a.
# Keep the same case.
# return new string
