require 'benchmark'

def run(&problem)
	result = ""
	time = Benchmark.measure do
		result = problem.call
	end
	"The answer is: #{result}, executed in #{time.real}."
end

# 1

# longest palindrome
# find the longest palindrome in an arbitrary string
# for instance: longest_palindrome('aabbaabab') == 'aabbaa'
# note: to simplify the problem, assume your alphabet has 2 letters
# (because, more than 2 letters is a stupid curveball)

def test_longest_palindrome(size)
	sample = gen_test_string(size)
	puts run { longest_palindrome(sample) }
	puts run { longest_palindrome2(sample) }
end

def gen_test_string(size=50)
	options = ("a".."b").to_a
	output = []
	(0..size).each do |i|
		output.push(options.sample)
	end
	output.join
end

def longest_palindrome(input=gen_test_string(100))
	puts input
	input.length.downto(2) do |window|
		(0..input.length - window).each do |i|
			partial = input[i..i+window]
			return partial if partial == partial.reverse
		end
	end
end

def longest_palindrome2(input=gen_test_string(100))
	puts input
	output = ""
	i = 0
	offset = 0
	while 2 * (input.length - i) > output.length do
		# get largest palindrome from this index
		(0..input.length).each do |window|
			view = input[i-window..i+offset+window]
			break if view.empty? or view[0] != view[-1]
			if view.length > output.length
				output = view
			end
		end
		if offset.zero? 
			offset = 1
		else
			offset = 0
			i += 1 
		end
	end
	return output
end

# O(n)
def palindrome?(x)
	x == x.reverse
end

# O(n)
def palindrome_noreverse?(x)
	(0..((x.length/2)+1)).each do |i| #/
		return false if x[i] == x[-1-i]
	end
	return true
end

# 2

def gen_rand_array_of_integers(count=50)
	output = []
	rand = (-100..100).to_a
	(0..count).each do
		output << rand.sample
	end
	output
end

# find unique pairs that sum to 0 in an array in linear time
def zero_sum_pairs(count=50)
	input = gen_rand_array_of_integers(count)
	pairs, orphans = [], {}
	(0...input.length).each do |i|
		if orphans[-input[i]].nil?
			orphans[input[i]] = true
		else
			pairs << [input[i],-input[i]]
		end
	end
	puts pairs
	pairs.length
end

# find triplets that sum to 0 in an array in quadratic time
def zero_sum_triplets(count=50)
	input = gen_rand_array_of_integers(count)
	triplets, sums = [], {}
	(0...input.length).each do |i|
		(0...i).each do |ii|
			sum = input[i] + input[ii]
			if sums[sum].nil?
				sums[sum] = [input[i], input[ii]]
			else
				sums[sum] << [input[i], input[ii]]
			end
		end
		if !sums[-input[i]].nil?
			iii = 0
			while iii < 
				triplets << [input[i],sums[iii],sums[iii+1]]
				iii += 2
			end
		end
	end
	puts triplets
	triplets.length
end

# find common ancestor in a tree in linear time



# find common ancestro in a tree in linear spatial complexity



