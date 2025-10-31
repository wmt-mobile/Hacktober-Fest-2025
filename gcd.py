a,b,c,d = map(int,input().split())
e = find_gcd(a, b)
f = find_gcd(a, c)
g = find_gcd(a, d)
h = find_gcd(b, c)
i = find_gcd(b, d)
j = find_gcd(c, d)

def GCD(e,f,g,h,i,j) :
    if e<=f and e<=g and e<=h and e<=i and e<=h and e<=j:
        return(e)
    elif f<=e and f<=g and f<=f and f<=i and f<=h and f<=j:
        return(f)
    elif g<=e and g<=f and g<=g and g<=i and g<=h and g<=j:
        return(g)
    elif h<=e and h<=f and h<=g and h<=h and h<=i and e<=j:
        return(h)   
    elif i<=e and i<=f and i<=g and i<=h and i<=i and i<=j:
        return(i)
    else:
        return(j)       

print(GCD(e,f,g,h,i,j))
