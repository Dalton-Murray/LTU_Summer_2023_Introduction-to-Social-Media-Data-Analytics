###############################################
# Dalton Murray                               #
# 06/18/2023                                  #
# Introduction to Social Media Data Analytics #
# Final Research Project                      #
###############################################

############################################# Note ##############################################
# Everything in this document is uncommented and has code to work with my environment.
# In order to successfully run it you may need to comment out lines of code, such as having multiple plots may not work in your environment all at once.
# You will also need to change my exact paths for `primaryComments` and `primaryPosts` to yours.

############################################# Setup ##############################################
# We need the library igraph
# install.packages("igraph") # Install `igraph` if not already installed
# install.packages("ggplot2") # Install `ggplot2` if not already installed
# install.packages("tm") # Install `tm` if not already installed
# install.packages("SnowballC") # Install `SnowballC` if not already installed
# install.packages("wordcloud") # Install `wordcloud` if not already installed
# install.packages("RColorBrewer") # Install `rColorBrewer` if not already installed
library("igraph") # Loads library `igraph`
library("ggplot2") # Loads library `ggplot2`
library("tm") # Loads library `tm`
library("SnowballC") # Loads library `SnowballC`
library("wordcloud") # Loads library `wordcloud`
library("RColorBrewer") # Loads library `RColorBrewer`

# Unfortunately I had to use exact paths instead of relative paths here because R was not liking using relative paths for this and would not find it if I used relative paths
primaryComments = read.csv("C:\\Users\\daltonPrimary\\Desktop\\LTU\\INT 6303 - Introduction to Social Media Data Analytics\\Final\\Project\\reddit\\Formatted_comments_combined.csv", header = T) # Importing `Formatted_comments_combined` data and telling it that it has headers, setting it to variable `primaryComments`
primaryPosts = read.csv("C:\\Users\\daltonPrimary\\Desktop\\LTU\\INT 6303 - Introduction to Social Media Data Analytics\\Final\\Project\\reddit\\Formatted_primaryposts_combined.csv", header = T) # Importing `Formatted_primaryposts_combined.csv` data and telling it that it has headers, setting it to variable `primaryPosts`

combinedGraph = graph_from_data_frame(primaryComments, directed = F, vertices = primaryPosts) # Setting variable `combinedGraph` to the data from the data frame from `primaryComments` while telling it to be not directed, and we set its vertices to be equal to `primaryPosts`

simplifiedGraph = simplify(combinedGraph) # Sets `simplifiedGraph` to simplify `combinedGraph` removing self-ties/loops or duplicate edges

############################################ Standard functions ##############################################
# LegOrder = data.frame(cbind(V(simplifiedGraph)$author)) # Creates the leg order of the `simplifiedGraph` and sets it to use `author`
# write.csv(LegOrder, file = "./legOrder.csv") # Writes to file `legOrder.csv` the leg order

# verticesSimplified = V(simplifiedGraph) # Sets the variable `verticesSimplified` to the vertices of `simplifiedGraph`
# cat("Vertices of simplifiedGraph: \n") # Outputs
# print(verticesSimplified) # Outputs variable

# edgesSimplified = E(simplifiedGraph) # Sets the variable `edgesSimplified` to the vertices of `simplifiedGraph`
# cat("Edges of simplifiedGraph: \n") # Outputs
# print(edgesSimplified) # Outputs variable

# gDensitysimplifiedGraph = graph.density(simplifiedGraph) # Sets the graph density of `simplifiedGraph` to `gDensitysimplifiedGraph`
# cat("Graph Density simplifiedGraph:", gDensitysimplifiedGraph, "\n") # Prints out for organization

# diametersimplifiedGraph = diameter(simplifiedGraph) # Sets the diameter/maximum geodesic distance of `simplifiedGraph` to `diametersimplifiedGraph`
# cat("Diameter simplifiedGraph: ", diametersimplifiedGraph, "\n") # Prints out for organization

# farthestNodesimplifiedGraph = farthest.nodes(simplifiedGraph) # Sets the farthest nodes/the diameter by nodes DE and PG and tells us geodesic distance between the nodes of `simplifiedGraph` to `farthestNodesimplifiedGraph`
# cat("Farthest node simplifiedGraph: \n") # Prints out for organization
# print(farthestNodesimplifiedGraph) # Prints out the information in `farthestNodesimplifiedGraph`

# reciprocitysimplifiedGraph = reciprocity(simplifiedGraph) # Sets the reciprocity of `simplifiedGraph` to `recriprocitysimplifiedGraph`
# cat("Recriprocity simplifiedGraph: ", reciprocitysimplifiedGraph, "\n") # Prints out for organization

# transitivitysimplifiedGraph = transitivity(simplifiedGraph) # Sets the transitivity of `simplifiedGraph` to `transitivitysimplifiedGraph`
# cat("Transitivity simplifiedGraph: ", transitivitysimplifiedGraph, "\n") # Prints out for organization

# degreesimplifiedGraph = degree(simplifiedGraph) # Sets the degree of `simplifiedGraph` to `degreesimplifiedGraph`
# cat("Degree simplifiedGraph: \n") # Prints out for organization
# print(degreesimplifiedGraph) # Prints data in `degreesimplifiedGraph`

# degreeInsimplifiedGraph = degree(simplifiedGraph, mode = "in") # Sets the degree of `simplifiedGraph` with mode `in` to `degreeInsimplifiedGraph`
# cat("Degree In simplifiedGraph: \n") # Prints out for organization
# print(degreeInsimplifiedGraph) # Prints data in `degreeInsimplifiedGraph`

# degreeOutsimplifiedGraph = degree(simplifiedGraph, mode = "out") # Sets the degree of `simplifiedGraph` with mode `out` to `degreeOutsimplifiedGraph`
# cat("Degree Out simplifiedGraph: \n") # Prints out for organization
# print(degreeOutsimplifiedGraph) # Prints data in `degreeOutsimplifiedGraph`

# evcentsimplifiedGraph = evcent(simplifiedGraph) # Sets the evcent of `simplifiedGraph` to `evcentsimplifiedGraph`
# cat("Evcent simplifiedGraph: \n") # Prints out for organization
# print(evcentsimplifiedGraph) # Prints data in `evcentsimplifiedGraph`

# evcentVectorsimplifiedGraph = evcent(simplifiedGraph)$vector # Sets the evcent to be filtered for `vector` and sets it to `evcentVectorsimplifiedGraph`
# cat("Evcent Vector simplifiedGraph: \n") # Prints out for organization
# print(evcentVectorsimplifiedGraph) # Prints data in `evcentVectorsimplifiedGraph`

# constraintsimplifiedGraph = constraint(simplifiedGraph) # Sets the constraints of `simplifiedGraph` to `constraintsimplifiedGraph`
# cat("Constraint simplifiedGraph: \n") # Prints out for organization
# print(constraintsimplifiedGraph) # Prints the data in `constraintsimplifiedGraph`

# shortestPathssimplifiedGraph = shortest.paths(simplifiedGraph) # Sets the shortest paths of `simplifiedGraph` to `shortestPathssimplifiedGraph`
# cat("Shortest paths simplifiedGraph: \n") # Prints out for organization
# print(shortestPathssimplifiedGraph) # Prints the data in `shortestPathssimplifiedGraph`

# # Analyzing ego metrics better, collating different metrics and binding columns to vector outputs
# simplifiedGraphMetrics = data.frame(cbind(degree(simplifiedGraph))) # Gets degree
# simplifiedGraphMetrics = cbind(simplifiedGraphMetrics, data.frame(cbind(betweenness(simplifiedGraph)))) # Gets betweenness and collates
# simplifiedGraphMetrics = cbind(simplifiedGraphMetrics, data.frame(cbind(evcent(simplifiedGraph)$vector))) # Gets evcent and collates
# simplifiedGraphMetrics = cbind(simplifiedGraphMetrics, data.frame(cbind(constraint(simplifiedGraph)))) # Gets constraints and collates
# colnames(simplifiedGraphMetrics) = c("Degree", "Betweenness", "Eigenvecto", "Constraint") # Sets the columnn names
# write.csv(simplifiedGraphMetrics, "./EgoMetrics.csv") # Writes the collated data to `EgoMetrics.csv`

# subcomponent1simplifiedGraph = subcomponent(simplifiedGraph, 1) # Sets the reachability of id `1` in `simplifiedGraph` to `subComponent1simplifiedGraph`
# cat("Subcomponent 1 simplifiedGraph: \n") # Prints for organization
# print(subcomponent1simplifiedGraph) # Prints the data in `subComponent1simplifiedGraph`

# subcomponent8simplifiedGraph = subcomponent(simplifiedGraph, 8) # Sets the reachability of id `8` in `simplifiedGraph` to `subComponent1simplifiedGraph`
# cat("Subcomponent 8 simplifiedGraph: \n") # Prints for organization
# print(subcomponent8simplifiedGraph) # Prints the data in `subComponent8simplifiedGraph`

# cliquessimplifiedGraph = cliques(simplifiedGraph, min = 2, max = 5) # Sets variable `cliquessimplifiedGraph` to the cliques of `simplifiedGraph` with min and max of 5
# write.csv(cliquessimplifiedGraph, "./cliquesSimplified.csv") # Writes the collated data to `cliquesSimplified.csv`

# cliquesNumsimplifiedGraph = clique.number(simplifiedGraph) # Sets variable `cliquesNumsimplifiedGraph` to the largest clique in the graph
# cat("Cliques Number:", cliquesNumsimplifiedGraph, "\n") # Prints out with formatting

# largestCliquessimplifiedGraph = largest.cliques(simplifiedGraph) # Sets variable `largestCliquessimplifiedGraph` to the largest collection of connected vertices
# cat("Largest Cliques: \n") # Prints out for organization
# print(largestCliquessimplifiedGraph) # Prints out variable `largestCliquessimplifiedGraph`

# assortativitysimplifiedGraph = assortativity(simplifiedGraph, primaryPosts$score, directed = F) # Sets variable `assortativitysimplifiedGraph` to the value of the assortativity coefficient, calculating whether tenure in Congress is a basis for homophily
# cat("Assortativity:", assortativitysimplifiedGraph, "\n") # Prints out variable `assortativitysimplifiedGraph`

# assortativityDegreesimplifiedGraph = assortativity_degree(simplifiedGraph, directed = F) # Sets variable `assortativityDegreesimplifiedGraph` to the value of the assortativity degree
# cat("Assortativity Degree:", assortativityDegreesimplifiedGraph, "\n")

# clusterWalkTrapsimplifiedGraph = cluster_walktrap(simplifiedGraph) # Sets variable `clusterWalkTrapsimplifiedGraph` to the value of the cluster walk trap
# cat("Cluster Walktrap: \n")
# print(clusterWalkTrapsimplifiedGraph)

# clusterWalkTrap4simplifiedGraph = cluster_walktrap(simplifiedGraph) # Sets variable `clusterWalkTrap4simplifiedGraph` to the value of the cluster walk trap
# cat("Cluster Walktrap 4: \n")
# print(clusterWalkTrap4simplifiedGraph[4]) # Outptus specifically the 4th group of walktrap

# clusterWalkTrapStepssimplifiedGraph = cluster_walktrap(simplifiedGraph, steps = 200) # Sets variable `clusterWalkTrapStepssimplifiedGraph` to the value of the cluster walk trap with 200 steps
# cat("Cluster Walktrap Steps: \n")
# print(clusterWalkTrapStepssimplifiedGraph)

# clusterOptimalsimplifiedGraph = cluster_optimal(simplifiedGraph) # Sets variable `clusterOptimalsimplifiedGraph` to the cluster oiptimal of `simplifiedGraph`

# partitionssimplifiedGraph = data.frame(cbind(clusterOptimalsimplifiedGraph$author, clusterOptimalsimplifiedGraph$score)) # Sets variable `partitionsimplifiedGraph` to the data frame of cluster optimal author and score
# columnsimplifiedGraph = colnames(partitionssimplifiedGraph) = c("Comment", "Group") # Sets `columnsimplifiedGraph` to the column names specified
# cat("Partitions: \n")
# print(partitionssimplifiedGraph) # Outputs
# print(columnsimplifiedGraph) # Outputs


############################################# Plots & Graphs ##############################################

# set.seed(1) # Setting a seed to the value of 1 so that everytime I generate a plot or graph it stays the same rather than randomly generating a new one each time

# plot(simplifiedGraph, vertex.label = V(simplifiedGraph)$author, vertex.label.cex = 0.7) # Generates a plot for `simplifiedGraph`, setting vertex/node labels to authors and the size of labels to 0.7

# plot(simplifiedGraph, layout = layout_as_tree(simplifiedGraph),
#     vertex.size = evcent(simplifiedGraph)$vector * 5^1.5,
#     vertex.label = V(simplifiedGraph)$author) # Plots `simplifiedGraph` with a tree layout and sets vertex/nodes to label author with vector resizing

# plot(simplifiedGraph, layout = layout_with_gem(simplifiedGraph),
#     vertex.size = evcent(simplifiedGraph)$vector * 5^1.5,
#     vertex.label = V(simplifiedGraph)$author) # Plots `simplifiedGraph` with a gem layout and sets vertex/nodes to label author with vector resizing

# walkTrapPlot = plot(clusterWalkTrapStepssimplifiedGraph, simplifiedGraph) # Sets variable `walkTrapPlot` to the plot of the variable `clusterWalkTrapStepssimplifiedGraph` with `simplifiedGraph`
# cat("Walk trap plot:")
# print(walkTrapPlot) # Prints out the plot

# tkplot(clusterOptimalsimplifiedGraph, simplifiedGraph, margin = -0.05,
#     edge.color = "darkred", vertex.label = V(simplifiedGraph)$primaryPosts,
#     vertex.size = evcent(simplifiedGraph)$vector * 5,
#     vertex.shape = "sphere",
#     vertex.label.family = "sans", vertex.label.font = 2,
#     vertex.label.cex = 0.7, vertex.label.dist = 0.25) # Creates and configures a plot

# V(simplifiedGraph)$color = ifelse(V(simplifiedGraph)$score > 0,
#     "green", "red") # Sets the color of the colors depending on the score of the comment, if it's green they have a score higher than 0 otherwise it's red
# plot(simplifiedGraph, vertex.label = V(simplifiedGraph)$author,
#     vertex.label.cex = 0.7) # Generates a plot for `simplifiedGraph`, setting vertex/node labels to authors and the size of labels to 0.7
# title(sub = "A: Score \n(>0=Green;
#     <=0=Red)") # Sets the title of the plot

# tkplot(simplifiedGraph, vertex.label = V(simplifiedGraph)$author, vertex.label.cex = 0.7) # Generates a tkplot for `simplifiedGraph`, setting vertex/node labels to authors and the size of labels to 0.7

# V(simplifiedGraph)$vertex_degree <-  degree(simplifiedGraph)
# tkplot(simplifiedGraph, vertex.label = V(simplifiedGraph)$author,
#     edge.width = E(simplifiedGraph)$weight,
#     vertex.size = V(simplifiedGraph)$vertex_degree,
#     vertex.label.cex = 0.7) # Generates a tkplot for `simplifiedGraph`, setting vertex/node labels to authors and the size of labels to 0.7, and bases edge width and size based on degrees


############################################# Wordmap ##############################################
rawComments = readLines("./reddit/wordmap_comments.txt") # Loads the raw comments from the file `wordmap_comments.txt`
docs = Corpus(VectorSource(rawComments)) # Sets the Corpus VectorSource of `rawComments` to `docs`
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x)) # -
docs = tm_map(docs, toSpace, "/")
docs = tm_map(docs, toSpace, "@")
docs = tm_map(docs, toSpace, "\\|") # Removes `/``, `@``, and `|`` characters

docs = tm_map(docs, content_transformer(tolower)) # Sets all of the words to lowecase
docs = tm_map(docs, removePunctuation) # Removes all punctuation
docs = tm_map(docs, stripWhitespace) # Removes all extra whitespaces
docs = tm_map(docs, removeWords, stopwords("english")) # Filters out common english stopwords

dtm = TermDocumentMatrix(docs) # -
m = as.matrix(dtm)
v = sort(rowSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq = v)
head(d, 50) # Creates a term-document matrix

set.seed(1) # Sets our seed to 1 so that we can re-generate the wordcloud
wordcloud(words = d$word, freq = d$freq, min.freq = 10,
        max.words = 10000, random.order = FALSE, rot.per = 0.35,
        colors = brewer.pal(8, "Dark2")) # Creates and configures the wordcloud