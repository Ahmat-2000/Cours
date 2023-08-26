def perm(s):
    l = []
    res =[]
    def aux(tab):
        if len(tab) == 1:
            l.append(tab[0])
            res.append(l.copy())
            l.pop()
        else:
            for j in range(len(tab)):
                a = tab[j]
                l.append(a)
                tmp = tab.copy()
                tmp.remove(a)
                aux(tmp)
                l.pop()
    aux(s)
    return res

s = [1,2,3,4]
res = perm(s)
for i in range(len(res)):
    for j in range(len(res[i])):
        print(res[i][j],end=" ")
    print("\n")
