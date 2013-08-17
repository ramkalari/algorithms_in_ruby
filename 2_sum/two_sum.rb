numbers = {}
file = File.open('2_sum.txt')

hash_one = {}
hash_two = {}
hash_three = {}
hash_four = {}
numbers = []

while(line = file.gets)
	num = line.to_i
	if num < -10000
		hash_one[num] = 1
	elsif num >= -10000 and num < 0
		hash_two[num] = 1
	elsif num >=0 and num < 10000
		hash_three[num] = 1
	else
		hash_four[num] = 1
	end	
	numbers << num
end

p hash_one.length
p hash_two.length
p hash_three.length
p hash_four.length

target_values = -10000..10000
result = 0
target_values.each{|target|

 	found = false
 

}

p result 
#p hash_one.has_key? -57815931346
#p hash_four.has_key? 57815931438

# have 4 lists
# first list contains numbers less than -10000
# second list contains numbers between -10000 to 0
# numbers >= 0 and < 10000
# third list contains numbers > 10000

# for every number in the first list, the second number has to be in the  third or fourth list. if target is negative, it has to be in 3rd list, if target is positive, it has to be in 4th list
# for every number in the second bucket, the second number will be in second, third or fourth list
# for every number in the third bucket, the second number will be in first, second, third list
# for every number in the fourth list, the second number will be in the  first or second list
