import delimited "df_vote.csv", clear

// Create the first scatter plot and save it
scatter inc_margin rdi_y, title("Vote Margin vs. Election Year Income Growth") ///
    mlabel(year)
graph save scatter1, replace

// Create the second scatter plot and save it
scatter inc_margin economy, title("Vote Margin vs. Economic Evaluations") ///
    mlabel(year)
graph save scatter2, replace

// Combine the saved scatter plots side by side
graph combine scatter1.gph scatter2.gph, cols(2) title("Scatter Plots")
