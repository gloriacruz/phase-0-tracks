def encrypt(str)
  new_str = ""
  i = 0
  while i < str.length
    if str[i] == " "
      new_str += " "
    elsif str[i] == "z"
      new_str += "a"
    else
      new_str += str[i].next
    end
    i += 1
  end
  new_str
end

def decrypt(str)
  alph = "abcdefghijklmnopqrstuvwxyz"
  new_str = ""
  i = 0
  while i < str.length
    if str[i] == " "
      new_str += " "
    else
      n = alph.index(str[i]) - 1
      new_str += alph[n]
    end
    i += 1
  end
  new_str
end

puts  "Would you like to encrypt or decrypt a password? (type encrypt/decrypt)"
input = gets.chomp
puts "Please enter your password (lowercase/no numbers)"
password = gets.chomp
if input == "encrypt"
  puts encrypt(password)
elsif input == "decrypt"
  puts decrypt(password)
else
  puts "We don't understand the input"
end

# puts encrypt("abc")
# puts encrypt("zed")
# puts decrypt("bcd")
# puts decrypt("afe")
# puts decrypt(encrypt("swordfish"))

# RELEASE 4:  The nested methods worked fine. The first method encrypted the word but then the second one decrypted it back.