from math import sin, cos, pi
def show_graph(graph):
    g = Graphics()
    step = 2*pi / graph.order()
    V = []
    for i in xrange(graph.order()):
        V += [(cos(i*step)*graph.order(), sin(i*step)*graph.order())]
    for v in V:
        g += circle(v, 1, fill=True)
    for e in graph.edges():
        v1, v2 = e[0], e[1]
        g += line([V[v1], V[v2]], rgbcolor=(0,0,0))
    g.axes(False)
    return g

show_graph (graphs.CompleteGraph(10))
