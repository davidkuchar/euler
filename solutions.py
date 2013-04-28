


# mulitples of 3 and 5
#  	If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#  	we get 3, 5, 6 and 9. The sum of these multiples is 23.
#  	Find the sum of all the multiples of 3 or 5 below 1000.
def p1():
	return sum([x for x in range(1,1000) if not x % 3 or not x % 5])

# even fibonacci numbers
#  	Each new term in the Fibonacci sequence is generated by adding the previous two terms. 
#	By starting with 1 and 2, the first 10 terms will be:
#	1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#	By considering the terms in the Fibonacci sequence whose values do not exceed four 
#	million, find the sum of the even-valued terms.
def fiblist(upto):
	fib = [0,1]
	while fib[-1] <= upto:
		fib.append(fib[-1] + fib[-2])
	return fib

def p2():
	return sum([x for x in fiblist(4000000) if not x % 2])

# Largest prime factor
# 	The prime factors of 13195 are 5, 7, 13 and 29.
# 	What is the largest prime factor of the number 600851475143?

#	notes:
#	The Fundamental Theorem of Arithmetic states that any natural number 
#	besides 1 can either be written as the product of prime numbers, or is itself prime.
def is_prime(value):
	for x in xrange(2,int(value ** 0.5 + 1)):
		if not value % x:
			return False
	return True

def next_prime(last=2):
	next = last + 1
	while not is_prime(next):
		next += 1
	return next

# value = 13195
def p3(value = 600851475143):
	prime_factors = []
	primes = [2]
	while not is_prime(value):
		while value % primes[-1] == 0:
			value /= primes[-1]
			prime_factors.append(primes[-1])
		primes.append(next_prime(primes[-1]))
	prime_factors.append(value)
	return prime_factors[-1]









