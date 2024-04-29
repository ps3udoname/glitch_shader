import math
#
zero = 0
nonzero = 0
f= 0
z = 1
for x in range(0,1000,1):
    x/1000
    #x = 0.5146
    y = round(math.tan(math.tan(x+1.5)) + math.tan(4.4),1)

    if z == y:
        f += 1
    z = y

    if y == 0:
        zero += 1
    else:
        nonzero += 1
    
print(str(zero) +" : "+ str(nonzero) + "\n freq: " +str(f))

#time matches x strip return x strip
#matching should happen for a sequence of continous outputs
#make it return a value that is below x or divisble by x for a small sequence of outputs