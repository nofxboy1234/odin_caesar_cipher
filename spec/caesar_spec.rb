require './lib/caesar'

RSpec.describe '#caesar_cipher' do
  it 'encrypts a string with a single lowercase letter' do
    expect(caesar_cipher('a', 5)).to eq('f')
  end

  it 'encrypts a string with a single uppercase letter' do
    expect(caesar_cipher('D', 6)).to eq('J')
  end

  it 'encrypts a string with multiple lowercase letters' do
    expect(caesar_cipher('abc', 1)).to eq('bcd')
  end

  it 'encrypts a string with multiple uppercase letters' do
    expect(caesar_cipher('FGHI', 1)).to eq('GHIJ')
  end

  it 'encrypts a string with a mix of lowercase and uppercase letters' do
    expect(caesar_cipher('abGik', 3)).to eq('deJln')
  end

  it 'encrypts a string with a mix of letters and other characters' do
    expect(caesar_cipher('What a string!', 5)).to eq('Bmfy f xywnsl!')
  end

  context 'when the key is negative and breaks lower limit of alphabet' do
    it 'encrypts a string by wrapping back around' do
      expect(caesar_cipher('Ee', -5)).to eq('Zz')
    end
  end

  context 'when the key is positive and breaks upper limit of alphabet' do
    it 'encrypts a string by wrapping back around' do
      expect(caesar_cipher('XyZ', 4)).to eq('BcD')
    end
  end

  it 'decrypts a string' do
    expect(caesar_cipher('Bmfy f xywnsl!', 5, decrypt: true))
      .to eq('What a string!')
  end
end
