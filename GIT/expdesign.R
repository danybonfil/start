library(DiagrammeR)
library(networkD3)
library(webshot)
#webshot::install_phantomjs()

setwd("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/GIT")
expdesign  <- mermaid("
  graph TD;
    A[Survey and Attention Screener] --> |Control| B[Yearly]
    A --> |Framing Treatment| C[Yearly + Cumulative]
    A --> |Affective Treatment| D[Yearly + Cumulative + Presidential Identification]
    ", height = 'auto', width = 'auto')

saveNetwork(expdesign, "expdesign.html")
webshot("expdesign.html", "expdesign.png", vwidth = 800, vheight = 200)

expdesign2  <- mermaid("
  graph TD;
    A{Survey and Attention Screener} -->|Control| B[Yearly]
    A -->|Treatment| C[Yearly + Cumulative]
    B -->|Control| D[Blind]
    B -->|Treatment| E[Presidential Identification]
    C -->|Control| F[Blind]
    C -->|Treatment| G[Presidential Identification]
    ", height = 'auto', width = 'auto')

saveNetwork(expdesign2, "expdesign2.html")
webshot("expdesign2.html", "expdesign2.png", vwidth = 800, vheight = 400)



# 
# ```{r}
# library(DiagrammeR)
# mermaid("
#   graph TD;
#     A[Survey and Attention Screener] --> |Control| B[Yearly]
#     A --> |Framing Treatment| C[Yearly + Cumulative]
#     A --> |Affective Treatment| D[Yearly + Cumulative + Presidential Identification]
# ")
# ```



# 
# 
# The study employs a 2x2 between-subjects factorial design to investigate the impact of framing and identification on retrospective voting.
# ```{r}
# library(DiagrammeR)
# mermaid('
#   graph TD;
#     A{Survey and Attention Screener} --> |Control| B[Yearly]
#     A --> |Framing Treatment| C[Yearly + Cumulative]
#     A --> |Affective Treatment| D[Yearly + Cumulative + Presidential Identification]
# ')
# 
# ```
# 
# ```{r}
# library(DiagrammeR)
# mermaid("
#   graph TD;
#     A{Survey and Attention Screener} -->|Control| B[Yearly]
#     A -->|Treatment| C[Yearly + Cumulative]
#     B -->|Control| D[Blind]
#     B -->|Treatment| E[Presidential Identification]
#     C -->|Control| F[Blind]
#     C -->|Treatment| G[Presidential Identification]
# ")
# 
# ```
# 
# 
# | Table 1: Experimental Design                | Control (Yearly)        | Treatment (Cumulative)   |
#   |-----------------|--------------------------|---------------------------|
#   | Control (Blind) | <font color="#505050">Group A</font> | <font color="#505050">Group B</font> |
#   | Treatment (Presidential Identification) | <font color="#505050">Group C</font> | <font color="#505050">Group D</font> |
#   