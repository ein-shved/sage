from math import sin, cos, pi
def show_graph(graph):
    g = Graphics()
    step = 2*pi / graph.order()
    V = []
    for i in xrange(graph.order()):
        rgbcolor=graph.get_vertex(i) if graph.get_vertex(i) else (0,0,0)
        V += [((cos(i*step)*graph.order(), sin(i*step)*graph.order()), rgbcolor)]
    for (v,c) in V:
        g += circle(v, 1, fill=True, rgbcolor=c)
    for e in graph.edges():
        v1, v2 = e[0], e[1]
        rgbcolor=graph.edge_label(v1, v2) if graph.edge_label(v1, v2) else (0,0,0)
        g += line([V[v1][0], V[v2][0]], rgbcolor=rgbcolor)
    g.axes(False)
    return g

g = graphs.CompleteGraph(10)
g.set_vertex(1, (1,0,0))
g.set_vertex(2, (1,0,0))
g.set_edge_label(1, 2, (1,0,0))
show_graph (g)
