# hmdb_proteins.R

#' HMDB metabolite-protein interactions
#'
#' A list of metabolite-protein interactions extracted from the Human Metabolome
#' Database. Only proteins with HUGO Gene Nomenclature Committee symbols were
#' included in the output. Preparation details may be found in the `data-raw`
#' directory of the package source.
#'
#' @format
#' A data frame with 839,671 rows and 3 columns:
#' \describe{
#'   \item{hmdb}{HMDB accession number}
#'   \item{name}{metabolite name}
#'   \item{protein}{protein gene symbol}
#' }
#'
#' @source <https://hmdb.ca/system/downloads/current/hmdb_metabolites.zip>
#'
"hmdb_proteins"
