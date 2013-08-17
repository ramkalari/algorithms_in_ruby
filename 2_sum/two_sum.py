f = open('/Users/sriram/projects/algorithms_in_ruby/2_sum/2_sum.txt')
ht_input = dict()
number_list = []
for line in f:
	number = int(line.strip('\n'))
	number_list.append(number)

for num in number_list:
	ht_input[num] = num


def two_sum(t):
	for num in number_list:
		if  (t - num) in ht_input:
			print num,t,t-num
			return 1
	return 0

def check_two_sums(sums):
	result = 0
	for sum in sums:
		result += two_sum(sum)
	return result

sums = [7265, -9500, 9965, 9966, 10000, 0]
print check_two_sums(sums)

