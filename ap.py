a,b,c = map(int,input().split())
def absolute_common_d(x,y):
    if x-y>0:
        return(x-y)
    else:
        return(-(x-y))

d = absolute_common_d(a,b)
e = absolute_common_d(b,c)
f = absolute_common_d(a,c)

def common_d():
    if d==e :
        return(d)
    elif d==f :
        return(d)   
    elif e==f :
        return(e)
    else:
        return(0)       

d = common_d()
if b==a+d and c==a+2*d or b==a+2*d and c==a+d or a==b+d and c==b+2*d or a==b+2*d and c==b+d or a==c+d and b==c+2*d or a==c+2*d and b==c+d      :
    print("YES")
else:
    print("NO")
