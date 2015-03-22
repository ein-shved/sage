import random
def labyrinth_txt (txt):
    i,j = 0,0
    map = {(0,0):0}
    for l in txt:
        if l == '\n':
            i+=1
            j = 0;
        elif l == '.':
            map[i,j] = 0
            j+=1
        elif l == '#':
            map[i,j] = 1
            j+=1
        else:
            return None
    return labyrinth(map)
def rect((x,y), rgb = (0,0,0)):
    return polygon([[x,y], [x+1,y], [x+1, y+1],[x, y+1]], rgbcolor=rgb)
def labyrinth(map):
    g = Graphics()
    for p, val in map.iteritems():
        if val:
            g += rect (p, rgb=(0,0,1))
    border = max(i for i in map)
    border = (border[0] + 1, border[1] + 1)
    g += line([(0,0), (0, border[1]), border, (border[0], 0), (0,0)])
    g.axes(False)
    return g
N = 15
M = 15
map = {(i,j):random.randrange(2) for i in xrange(N) for j in xrange(M)}
g = labyrinth(map)
g.show()
