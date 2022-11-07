STATE		:= California
SPACE		:= $() $()
STATE_NOSPACE	:= $(subst $(SPACE),_,$(STATE))
REPORT		:= analysis_$(STATE_NO_SPACE).html
OUTPUT		:= output
REPORT_PATH	:= $(OUTPUT)/$(REPORT)
R_FUNCTIONS	:= $(wildcard code/functions/*.R)
MOBILITY_DATA	:= data/raw_data/applemobilitytrends-2022-04-12.csv
SEQ_DATA	:= /blast-db/sars-cov-2-seq-data/2022-10-17_ncbi_sars-cov-2-sequences.fasta.gz
SEQ_SUMMARY	:= $(OUTPU)/sequence_summary.txt

all: $(REPORT_PATH)

$(REPORT_PATH): analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILITY_DATA) run_analyze_covid_pipeline.sh
	bash run_analyze_covid_pipeline.sh "$(STATE)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$(SEQ_SUMMARY): code/process_sequences.sh $(SEQ_DATA)
	bash code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"

clean:
	rm -fv output/*.html
	rm -fv analysis.html
	rm -fv output/*summary.txt
	rm -fv output/*/*.csv
	rm -fv output/*/*.png

.PHONY: all clean
