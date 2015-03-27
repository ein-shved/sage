from math import sqrt

def labyrinth_path(map, begin, end):
    map[begin] = 2;
    map[end] = 3;
    a = []
    N, M = max (i for (i,j) in map) + 1, max(j for (i,j) in map) + 1
    def neighbours ((x,y)):
        nvals = set([0,3])
        s = []
        if x + 1 < N and map[x+1, y] in nvals:
            s.append((x+1,y))
        if y + 1 < M and map[x, y+1] in nvals:
            s.append((x,y+1))
        if x - 1 >= 0 and map[x-1, y] in nvals:
            s.append((x-1,y))
        if y - 1 >= 0 and map[x, y-1] in nvals:
            s.append((x,y-1))
        return s;
    def process_cell(cell):
        if cell == end:
            return True
        n = neighbours(cell)
        map[cell] = 2;
        a.append(labyrinth(map));
        n.sort(key=lambda (x,y): sqrt((x - end[0])^2 + (y - end[1])^2))
        for c in n:
            if process_cell(c):
                return True
        map[cell] = 4;
        return False
    process_cell(begin)
