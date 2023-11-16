# hmdb_proteins.R

library(xslt)
library(hgnc)

# HMDB 5.0 'All Metabolites' dataset downloaded 2024-11-14
url <- "https://hmdb.ca/system/downloads/current/hmdb_metabolites.zip"
zip_file <- "data-raw/hmdb_metabolites.zip"
download.file(url, zip_file)
unzip(zip_file, exdir = "data-raw")
unlink(zip_file)

# doc_path <- "data-raw/test.xml"
doc_path <- "data-raw/hmdb_metabolites.xml"
# style_path <- "data-raw/test.xsl"
style_path <- "data-raw/hmdb_proteins.xsl"
out_path <- "data-raw/hmdb_proteins_parsed.xml"

doc1 <- read_xml(doc_path)
style <- read_xml(style_path)
parsed <- xml_xslt(doc1, style)
status <- write_xml(parsed, file = out_path)
unlink(doc_path)

doc2 <- read_xml(out_path)
metab <- xml_find_all(doc2, ".//metabolite")
hmdb <- xml_text(xml_find_all(doc2, "//accession"))
name <- xml_text(xml_find_all(doc2, "//name"))
protein <-
  xml_find_all(metab, ".//protein", flatten = FALSE) |>
  lapply(xml_text)
unlink(out_path)

genes <- import_hgnc_dataset()

hmdb_proteins <-
  tibble::tibble(
    hmdb = hmdb,
    name = name,
    protein = protein
  ) |>
  tidyr::unnest_longer(protein) |>
  dplyr::filter(protein %in% genes$symbol)

usethis::use_data(hmdb_proteins, overwrite = TRUE)
