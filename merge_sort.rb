#lines = File.openreadlines('IntegerArray.txt')


#numbers = lines.map {|a| a.to_i}
numbers = []


file = File.open('IntegerArray.txt')
while(line = file.gets)
	numbers.push(line.to_i)
end

def inversions(list_of_numbers)
	sort(list_of_numbers)
end


def sort(list_of_numbers)

	#puts "In sort"
	length = list_of_numbers.length	
	#puts "after length"
    #list_of_numbers.sort
    merge_sort(list_of_numbers)
   
end

def merge_sort(a)

		return a if a.length == 1
		middle = a.length / 2
		l_list = a[0..middle - 1]
		r_list = a[middle..a.length-1]
		l_sorted = merge_sort(l_list)
		#puts l_sorted.inspect
		r_sorted = merge_sort(r_list)
		#puts r_sorted.inspect
    	output = merge(l_sorted, r_sorted)
end

def merge(l_sorted, r_sorted)
	output = []
	j = 0
	k = 0

	while j < l_sorted.length and k < r_sorted.length do
		if l_sorted[j] <= r_sorted[k]
			output << l_sorted[j]
			j = j + 1
		else
			output << r_sorted[k]
			k = k + 1
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
return output
end

puts merge_sort(numbers)

#puts merge([1, 5], [4, 7]).inspect

#puts merge_sort([3,7,5,1],0, 3).inspect
