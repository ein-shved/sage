@interact
def g(vertecies=slider([2..50], default = 10, label="Vertecies"),
      dimension=slider([1..40], default = 2, label="Dimension"),
      seed=input_box("1suw823d", width=20, label="Seed"),
      begin=selector([0..49], default=0),
      end=selector([0..49], default=9)):
          if dimensin * vertecies % 2 != 0:
              vertecies += 1
          g = graphs.RandomRegular(dimension, vertecies, seed)
          dijkstra (g, begin, end).show(delay=40)
