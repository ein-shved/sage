@interact
def l(X=slider([10..30], default = 15, label="Widh"),
      Y=slider([10..30], default = 15, label="Height"),
      seed=input_box("1suw823d", width=20, label="Seed")):
          labyrinth_path(labyrinth_gen(X,Y,seed)).show()
