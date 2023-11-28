library(DiagrammeR)
library(networkD3)
library(webshot)
webshot::install_phantomjs()  # Uncomment and run this line if PhantomJS is not installed

setwd("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/GIT")

# Theme variables for LaTeX-style theme
theme_variables_latex <- "
  'theme': 'base',
  'themeVariables': {
    'fontSize': 20,
    'fontFamily': 'serif',
    'fontWeight': 'bold',
    'textColor': '#fff',
    'primaryColor': '#4E79A7',
    'primaryTextColor': '#fff',
    'primaryBorderColor': '#7C0000',
    'lineColor': '#F28E2B',
    'secondaryColor': '#E15759',
    'tertiaryColor': '#fff'
  }
"

# Adjust the height, width, ranksep, and nodesep of the diagram
expdesign2 <- mermaid(sprintf("
  graph TD;
  style A fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style B fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style C fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style D fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style E fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style F fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  style G fill:%s,stroke:%s,stroke-width:2px,font-weight:%s,color:%s;
  subgraph Affective Manipulation
    D
    E
    F
    G
  end
  A{Attention Screener<br>Sentiment Thermometer} -->|Framing <br>Control| B(Yearly)
  A ==>|Framing <br>Treatment| C[Yearly + Cumulative]
  B -->|Control| D(Blind)
  B ==>|Treatment| E{Identified}
  C -->|Control| F[Blind]
  C ==>|Treatment| G{Identified}
", 
                              sprintf('#%s', 'D1D1D1'), sprintf('#%s', 'D1D1D1'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', '4E79A7'), sprintf('#%s', '4E79A7'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', 'E15759'), sprintf('#%s', 'E15759'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', 'D1D1D1'), sprintf('#%s', '848484'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', 'F28E2B'), sprintf('#%s', 'F28E2B'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', 'D1D1D1'), sprintf('#%s', '848484'), 'bold', sprintf('#%s', 'fff'),
                              sprintf('#%s', 'F28E2B'), sprintf('#%s', 'F28E2B'), 'bold', sprintf('#%s', 'fff')
), height = 600, width = 1600, ranksep = 100, nodesep = 100, fontsize = 20, theme = theme_variables_latex)  # Adjust the parameters as needed

# Save the diagram as HTML
saveNetwork(expdesign2, "expdesign2.html")

# Adjust the vwidth and vheight of the PNG to match the diagram size
webshot("expdesign2.html", "expdesign2.png", vwidth = 600, vheight = 600, cliprect = "viewport")







library(DiagrammeR)
library(networkD3)
library(webshot)
webshot::install_phantomjs()  # Uncomment and run this line if PhantomJS is not installed

setwd("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/GIT")

# Adjust the height, width, ranksep, and nodesep of the diagram
expdesign2 <- mermaid("
  graph TD;
  style A fill:#1F4E79,stroke:#1F4E79,stroke-width:2px,font-weight:bold,color:#fff;
  style B fill:#2C5F99,stroke:#1F4E79,stroke-width:2px,font-weight:bold,color:#fff;
  style C fill:#2C5F99,stroke:#1F4E79,stroke-width:2px,font-weight:bold,color:#fff;
  style D fill:#D1D1D1,stroke:#848484,stroke-width:2px,font-weight:bold,color:#fff;
  style E fill:#FF4040,stroke:#FF8000,stroke-width:2px,font-weight:bold,color:#fff;
  style F fill:#D1D1D1,stroke:#848484,stroke-width:2px,font-weight:bold,color:#fff;
  style G fill:#FF4040,stroke:#FF8000,stroke-width:2px,font-weight:bold,color:#fff;
  A{Survey and Attention Screener} -->|Control| B[Yearly]
  A -->|Treatment| C[Yearly + Cumulative]
  B -->|Control| D[Blind]
  B -->|Treatment| E[Identified]
  C -->|Control| F[Blind]
  C -->|Treatment| G[Identified]
", height = 600, width = 1600, ranksep = 100, nodesep = 100, fontsize = 18)  # Adjust the parameters as needed

# Save the diagram as HTML
saveNetwork(expdesign2, "expdesign2.html")

# Adjust the vwidth and vheight of the PNG to match the diagram size
webshot("expdesign2.html", "expdesign2.png", vwidth = 600, vheight = 600, cliprect = "viewport")


library(DiagrammeR)
library(networkD3)
library(webshot)
webshot::install_phantomjs()  # Uncomment and run this line if PhantomJS is not installed

setwd("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/GIT")

# Adjust the height, width, ranksep, and nodesep of the diagram
expdesign2 <- mermaid("
  graph TD;
  A{Survey and Attention Screener} -->|Control| B[Yearly]
  A -->|Treatment| C[Yearly + Cumulative]
  B -->|Control| D[Blind]
  B -->|Treatment| E[Identified]
  C -->|Control| F[Blind]
  C -->|Treatment| G[Identified]
", height = 600, width = 1600, ranksep = 100, nodesep = 100, fontsize = 18)  # Adjust the parameters as needed

# Save the diagram as HTML
saveNetwork(expdesign2, "expdesign2.html")

# Adjust the vwidth and vheight of the PNG to match the diagram size
webshot("expdesign2.html", "expdesign2.png", vwidth = 600, vheight = 600, cliprect = "viewport")



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
    B -->|Treatment| E[Identified]
    C -->|Control| F[Blind]
    C -->|Treatment| G[Identified]
    ", height = 'auto', width = 'auto')

saveNetwork(expdesign2, "expdesign2.html")
webshot("expdesign2.html", "expdesign2.png", vwidth = 1600, vheight = 800)



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