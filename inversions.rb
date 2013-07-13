numbers = []


file = File.open('IntegerArray.txt')
while(line = file.gets)
	numbers.push(line.to_i)
end

def sort_and_count_inversions(a)
		return [a,0] if a.length == 1
		middle = a.length / 2
		l_list = a[0..middle - 1]
		r_list = a[middle..a.length-1]
		l_result = sort_and_count_inversions(l_list)
		l_sorted = l_result[0]
		l_count = l_result[1]
		#puts l_sorted.inspect
		r_result = sort_and_count_inversions(r_list)
		r_sorted = r_result[0]
		r_count = r_result[1]
		#puts r_sorted.inspect
    	merge_result = merge_and_count_split_inversions(l_sorted, r_sorted)
    	output = merge_result[0]
    	split_count = merge_result[1]
    	[output, l_count + r_count + split_count]
end




def merge_and_count_split_inversions(l_sorted, r_sorted)
	output = []
	j = 0
	k = 0
	count = 0

	while j < l_sorted.length and k < r_sorted.length do
		if l_sorted[j] <= r_sorted[k]
			output << l_sorted[j]
			j = j + 1
		else
			output << r_sorted[k]
			k = k + 1
			count = count + l_sorted.length - j
		end
	end

	if(j < l_sorted.length)
		j_len = l_sorted.length - 1
		for i in (j..j_len) do
			output << l_sorted[i]
		end
	else
		k_len = r_sorted.length() - 1
		for i in (k..k_len) do
			output << r_sorted[i]
		end
	end
return [output, count]
end

puts sort_and_count_inversions(numbers)
