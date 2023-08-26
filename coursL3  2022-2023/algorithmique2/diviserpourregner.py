import matplotlib.pyplot as plt

def cherche_etoile(tab):
    pass # toudoux

def exp(x,n):
    pass

def speedexp(x,n):
    pass

def skyline_naif(immeubles):
    pass

def fusion_skylines(skyline1,skyline2):
    pass

def skyuline_dpr(immeubles):
    pass


def show(immeubles,skyline):
    # Une fonction permettant d'afficher les immeubles en bleu et une
    # skyline en rouge par dessus.
    for (x0,H,x1) in immeubles:
        X = [x0,x0,x1,x1]
        Y = [0,H,H,0]
        plt.fill(X,Y,color='c',edgecolor="b")
    X = []
    Y = [0]
    lastx = 0
    for (x,h) in skyline :
        X.append(x)
        X.append(x)
        Y.append(h)
        Y.append(h)
        lastx = x
    X.append(lastx)
    plt.plot(X,Y,color='r',linestyle="--")
    
    plt.show()
    

immeubles= [(3,13,9),(1,11,5),(12,7,16),(14,3,25),(19,18,22),(2,6,7),(23,13,29),(23,4,28)]
skyline = [(1,11),(3,13),(9,0),(12,7),(16,3),(19,18),(22,3),(23,13),(29,0)]

show(immeubles,skyline)
