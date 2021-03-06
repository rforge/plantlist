CTPL <- function(taxa = NULL, print_as_list = TRUE){
    
    syst <- Sys.info()[['sysname']]
    if(syst == "Windows"){
        # Ensure that Chinese Characters could be displayed properly.
        suppressMessages(Sys.setlocale(category = "LC_ALL", locale = "Chinese"))
    }

    options(stringsAsFactors = FALSE)
    taxa <- enc2utf8(taxa)
    taxa <- data.frame(taxa)
    colnames(taxa) <- "TAXA_NAME"

    cnplants_dat = plantlist::cnplants_dat
    res <- merge(x = taxa, y = cnplants_dat, by.x = "TAXA_NAME", by.y = "SPECIES_CN", sort = FALSE, all.x = TRUE)

    if(print_as_list){
        if(nrow(res) > 6){
            cat("Note: too many rows to show, only the first few rows were printed")
        }
        print.listof(head(res)) # Only the first few species will be printed
        return(invisible(res))
    } else {
        return(res)
    }
}
