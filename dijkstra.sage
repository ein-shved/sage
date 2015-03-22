def dijkstra(graph, begin=0, end=None):
    if end == None:
        end=graph.order() - 1
    a = [show_graph(graph)]
    toDo = set([begin])
    done = set([])
    graph.set_vertex(end, (1,0,0))
    while toDo:
        for v in toDo:
            graph.set_vertex(v, (0,1,0))
        for v in done:
            graph.set_vertex(v, (0,0,1))
        a.append(show_graph(graph))
        v = toDo.pop()
        done |= set([v]);
        neighbors = (set(graph.neighbors(v)) - toDo) - done
        toDo |= neighbors
        if end in neighbors:
            done |= set([end])
            break
    if not end in done:
        return animate(a)
    done -= set([end])
    path = [end]
    while done:
        for i in xrange(len(path)):
            v = path[i]
            graph.set_vertex(v, (1,0,0))
            if (i + 1 < len(path)):
                graph.set_edge_label(v, path[i+1], (1,0,0))
        a.append(show_graph(graph))
        v = path[len(path) - 1]
        neighbors = (set(graph.neighbors(v)) & done) - set(path)
        v = neighbors.pop()
        path.append(v)
        if v == begin:
            break
    for v in graph.vertices():
        graph.set_vertex(v, (0,0,0))
    for (u,v,l) in graph.edges():
        graph.set_edge_label(u, v, (0,0,0))
    for i in xrange(len(path)):
        v = path[i]
        graph.set_vertex(v, (1,0,0))
        if (i + 1 < len(path)):
            graph.set_edge_label(v, path[i+1], (1,0,0))
    g = show_graph(graph);
    for i in xrange(5):
        a.append(g);
    return animate(a)



g = graphs.RandomRegular(2,10)
dijkstra (g).show(delay=40)
