def substrings(string = "Howdy partner, sit down! How's it going?", dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]  )
  the_hash = {}
  dictionary.reduce(Hash.new(0)) do |hash,word|
  breakable_string = string.clone.downcase
  while breakable_string.include?(word) do
    hash[word] += 1
    breakable_string[breakable_string.index(word)] = '_'
  end
  the_hash = hash
 end
pp the_hash
end
