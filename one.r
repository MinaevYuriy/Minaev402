euclideanDistance <- function(u, v){
  return(sqrt(sum((u - v)^2)))
}
oneNN <- function(xl, z, metricFunction =euclideanDistance){
  ## Сортируем выборку согласно классифицируемого
  
  min_dist = 1e15
  min_dist_class = 'setosa'
  
  l <- dim(xl)[1]
  n <- dim(xl)[2] - 1
  
  for (i in 1:l){
    tmp_dist =metricFunction(xl[i, 1:n], z)
    
    if(tmp_dist < min_dist) {
      min_dist = tmp_dist
      min_dist_class = xl[i, n+1]
    }
  }
  
  return (min_dist_class)
}

colors <- c("setosa" = "red", "versicolor" = "green3",
            "virginica" = "blue")

iris30 = iris[sample(c(1:150), 30, replace=FALSE), 3:5]

plot(iris30[, 1:2], pch = 21, bg = colors[iris30$Species],
     col = colors[iris30$Species])
xl <- iris30[, 1:3]

points_array = c()

for (xtmp in seq(0, 7, by=0.1)){
  for (ytmp in seq(0, 3, by=0.1)){
    z <- c(xtmp,ytmp)
    class <- oneNN(xl, z)
    points_array = c(points_array, c(z))
    points(z[1], z[2], pch = 1, col = colors[class])
  }
}

