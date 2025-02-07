# Rule to generate the connections_report.html
connections_report.html: codes/connections_report.Rmd codes/render_report_nyt.R figures/con_summary.rds figures/interactive_treemap.html
	Rscript codes/render_report_nyt.R

# Rule to generate figures/con_summary.rds
figures/con_summary.rds: codes/nyt_table.R
	Rscript codes/nyt_table.R

# Rule to generate figures/interactive_treemap.html
figures/interactive_treemap.html: codes/nyt_tree.R
	Rscript codes/nyt_tree.R

# Phony targets for clean and install
.PHONY: clean install

# Clean up generated files
clean:
	rm -f connections_report.html
	rm -f figures/*.html
	rm -f figures/*.rds

# Install dependencies using renv
install:
	Rscript -e "renv::restore(prompt=FALSE)"