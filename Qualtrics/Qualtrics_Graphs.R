rm(list=ls())
library(httr)
library(jsonlite)
library(dplyr)
library(ggplot2)

# Make GET request to the API
odata <- read.csv("https://www.dropbox.com/s/r5qsxerj04jgu7y/RDI_40_09.csv?dl=1")

# Dict of Presidents_o with only the last year of each term
presidents_o <- jsonlite::fromJSON('{
  "1944": "Franklin D. Roosevelt - 1st term",
  "1948": "Franklin D. Roosevelt - 2nd term",
  "1952": "Harry S. Truman",
  "1956": "Dwight D. Eisenhower - 1st term",
  "1960": "Dwight D. Eisenhower - 2nd term",
  "1964": "John F. Kennedy",
  "1968": "Lyndon B. Johnson",
  "1972": "Richard Nixon - 1st term",
  "1976": "Richard Nixon - 2nd term",
  "1980": "Jimmy Carter",
  "1984": "Ronald Reagan - 1st term",
  "1988": "Ronald Reagan - 2nd term",
  "1992": "George H.W. Bush",
  "1996": "Bill Clinton - 1st term",
  "2000": "Bill Clinton - 2nd term",
  "2004": "George W. Bush - 1st term",
  "2008": "George W. Bush - 2nd term"
}')

# Original Data
df <- odata %>%
  as.data.frame() %>%
  mutate(date = seq(1940, length.out = nrow(.)),
         value = as.numeric(usvalue),
         usvalue = value,
         value = log(value / lag(value)) * 100) %>%
  filter(date >= 1940) %>%
  select(date, usvalue, value)

### Yearly
generateYearlyPlot <- function(yearSelect, showPresident = FALSE) {
  # Filter the data based on the selected year
  filteredData <- df[df$date >= as.character(as.integer(yearSelect) - 3) & df$date <= yearSelect, ]
  
  # Retrieve the start year and end year
  start_year <- as.integer(yearSelect) - 3
  end_year <- as.integer(yearSelect)
  
  # Generate the plot
  plot <- ggplot(filteredData, aes(x = date, y = value, group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(value, 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Yearly Personal Income Growth for ", start_year, "-", end_year)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Save the plot as JPG
  file_name <- paste0("Y_", yearSelect, ".jpg")
  file_path <- file.path("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/Qualtrics/0.Yearly", file_name)
  ggsave(file_path, plot, dpi = 300, width = 8, height = 3, units = "in", device = "jpeg")
  
  # Print the plot
  print(plot)
}

# Generate and print yearly plots
years <- seq(1944, 2008, by = 4)
for (year in years) {
  generateYearlyPlot(year)
}

### Yearly Identified
generateYearlyIdentifiedPlot <- function(yearSelect, showPresident = TRUE) {
  # Filter the data based on the selected year
  filteredData <- df[df$date >= as.character(as.integer(yearSelect) - 3) & df$date <= yearSelect, ]
  
  # Retrieve the start year and end year
  start_year <- as.integer(yearSelect) - 3
  end_year <- as.integer(yearSelect)
  
  # Retrieve the president's name if showPresident is TRUE
  president_label <- ""
  if (showPresident) {
    president <- presidents_o[as.character(end_year)]
    president_label <- paste0(" (", president, ")")
  }
  
  # Generate the plot
  plot <- ggplot(filteredData, aes(x = date, y = value, group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(value, 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Yearly Personal Income Growth for ", start_year, "-", end_year, president_label)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Save the plot as JPG
  file_name <- paste0("YI_", yearSelect, ".jpg")
  file_path <- file.path("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/Qualtrics/1.Yearly_Identified", file_name)
  ggsave(file_path, plot, dpi = 300, width = 8, height = 3, units = "in", device = "jpeg")
  
  # Print the plot
  print(plot)
}

# Generate and print yearly identified plots
years <- seq(1944, 2008, by = 4)
for (year in years) {
  generateYearlyIdentifiedPlot(year)
}


### Yearly and Cumulative
library(patchwork)

generateYearlyAndCumulativePlots <- function(yearSelect, showPresident = FALSE) {
  # Filter the data based on the selected year
  filteredData <- df[df$date >= as.character(as.integer(yearSelect) - 3) & df$date <= yearSelect, ]
  
  # Retrieve the start year and end year
  start_year <- as.integer(yearSelect) - 3
  end_year <- as.integer(yearSelect)
  
  # Generate the yearly plot
  yearlyPlot <- ggplot(filteredData, aes(x = date, y = value, group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(value, 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Yearly Personal Income Growth for ", start_year, "-", end_year)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Generate the cumulative plot
  cumulativePlot <- ggplot(filteredData, aes(x = date, y = cumsum(value), group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(cumsum(value), 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Cumulative Personal Income Growth for ", start_year, "-", end_year),
         subtitle = "Each year adds the growth of all previous years, so the 4th Year shows the total growth from the 1st-4th year") +
    theme(plot.subtitle = element_text(size = 8)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Combine the yearly and cumulative plots
  combinedPlot <- yearlyPlot + cumulativePlot +
    plot_layout(ncol = 1, heights = c(1, 1))
  
  # Save the combined plot as JPG
  file_name <- paste0("YC_", yearSelect, ".jpg")
  file_path <- file.path("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/Qualtrics/2.Yearly_Cumulative", file_name)
  ggsave(file_path, combinedPlot, dpi = 300, width = 8, height = 6, units = "in", device = "jpeg")
  
  # Print the combined plot
  print(combinedPlot)
}

# Generate and save yearly plots
years <- seq(1944, 2008, by = 4)
for (year in years) {
  generateYearlyAndCumulativePlots(year)
}


### Yearly and Cumulative with President's name

IDYearlyAndCumulativePlots <- function(yearSelect, showPresident = TRUE) {
  # Filter the data based on the selected year
  filteredData <- df[df$date >= as.character(as.integer(yearSelect) - 3) & df$date <= yearSelect, ]
  
  # Retrieve the start year and end year
  start_year <- as.integer(yearSelect) - 3
  end_year <- as.integer(yearSelect)
  
  # Retrieve the president's name if showPresident is TRUE
  president_label <- ""
  if (showPresident) {
    president <- presidents[as.character(end_year)]
    president_label <- paste0(" (", president, ")")
  }
  
  # Generate the yearly plot
  yearlyPlot <- ggplot(filteredData, aes(x = date, y = value, group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(value, 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Yearly Personal Income Growth for ", start_year, "-", end_year, president_label)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Generate the cumulative plot
  cumulativePlot <- ggplot(filteredData, aes(x = date, y = cumsum(value), group = 1)) +
    geom_line(color = "steelblue", size = 1.5) +
    geom_point(color = "steelblue", size = 3) +
    geom_text(aes(label = round(cumsum(value), 2), vjust = -0.5), size = 4, nudge_y = 0.5) +
    labs(x = "Year", y = "% Change in Personal Income", title = paste0("Cumulative Personal Income Growth for ", start_year, "-", end_year, president_label),
         subtitle = "Each year adds the growth of all previous years, so the 4th Year shows the total growth from the 1st-4th year") +
    theme(plot.subtitle = element_text(size = 8)) +
    scale_y_continuous(expand = c(0.2, 0.2), labels = scales::label_number(accuracy = 0.1))
  
  # Combine the yearly and cumulative plots
  combinedPlot <- yearlyPlot + cumulativePlot +
    plot_layout(ncol = 1, heights = c(1, 1))
  
  # Save the combined plot as JPG
  file_name <- paste0("YCI_", yearSelect, ".jpg")
  file_path <- file.path("C:/Users/danbo/OneDrive - Fundacao Getulio Vargas - FGV/FGV/Q3.23/GIT/Qualtrics/3.Yearly_Cumulative_Identified", file_name)
  ggsave(file_path, combinedPlot, dpi = 300, width = 8, height = 6, units = "in", device = "jpeg")
  
  # Print the combined plot
  print(combinedPlot)
}

# Generate and save yearly plots
years <- seq(1944, 2008, by = 4)
for (year in years) {
  IDYearlyAndCumulativePlots(year)
}