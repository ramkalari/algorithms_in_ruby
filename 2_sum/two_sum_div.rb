file = File.open('2_sum.txt')
hash_one = Hash.new { |hash, key| hash[key] = [] }


while(line = file.gets)
	num = line.to_i
	hash_one[num.abs / 10000].push(num)	
end

p hash_one.length

target_values = -10000..10000
result = {}

hash_one.each{|k, v|

  k_plus_one = []
  k_minus_one = []

  if(hash_one.has_key?(k + 1))
  	k_plus_one = hash_one[k + 1]
  end
  
  if(hash_one.has_key?(k - 1))
    k_minus_one = hash_one[k - 1]
  end
    
  # elements in the same hash are candidates
  v.each{|num1|

  	v.each{|num2|
  		if (num1 + num2).abs <= 10000 && num1 != num2
  			result[(num1 + num2)] = 1
  		end
  	}


    	k_plus_one.each {|num3|
    		if (num1 + num3).abs <= 10000 && num1 != num3
  				result[(num1 + num3)] = 1
  			end 
  			
    	}
    

    	k_minus_one.each {|num4|
    		if (num1 + num4).abs <= 10000 && num1 != num4
  				result[(num1 + num4)] = 1
  			end 
  			
    	}
    

    
  }

  # elements that have key as k + 1 or k - 1 are also candidates


}

p result.length

p Hash[result.sort] 