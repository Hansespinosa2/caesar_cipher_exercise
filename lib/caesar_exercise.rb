def get_shift(number)
  ((number.to_f/25.to_f - number/25)*25).round
end

def upper?(string)
  string.upcase == string
end


def caesar_cipher(string = "No input", number = 0)
  alphabet_list = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'.split('')
  arr_indices = []
  new_arr = []
  string.split('').each {|char| arr_indices.append(alphabet_list.find_index(char.downcase))}
  arr_indices.map! do |index|
    index.nil? ? index:index+get_shift(number)
  end
  arr_indices.each_with_index {|alpha_index, index| alpha_index.nil? ? new_arr.append(string[index]) : new_arr.append(upper?(string[index]) ? alphabet_list[alpha_index].upcase : alphabet_list[alpha_index] )}
  puts new_arr.join()
end
