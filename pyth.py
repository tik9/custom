import pdb

def fac(n):
    pdb.set_trace()
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)


def bi():
	n=3
	x=n
	k=[]
	pdb.set_trace()
	while (n>0):
		a=int(n%2)
		k.append(a)
		n=(n-a)/2
	k.append(0)
	string=""
	for j in k[::-1]:
		string+=str(j)
	print('The binary no. for %d is %s'%(x, string))
