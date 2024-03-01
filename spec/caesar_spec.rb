require './lib/caesar_exercise'

describe "#caesar_cipher" do
  it "Shifts a string 5 correctly" do
    expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
  end

  it "Shifts a string with numbers in it" do
    expect(caesar_cipher('Hi 2 I am a number 3',3)).to eql('Kl 2 L dp d qxpehu 3')
  end

  it "Shifts a string backwards" do
    expect(caesar_cipher("Lets try to do it backwards",-9)).to eql('Buji jho je te yj rqsamqhti')
  end

  it "Shifts a string by over 26 shift" do
    expect(caesar_cipher("A massive shift",300)).to eql('O aoggwjs gvwth')
  end
end
