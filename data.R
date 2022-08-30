dataGen <- R6Class("dataGen",
                   public = list(
                     initialize = function() {
                       # tryCatch({
                       aw <- private$ape_wisdom() %>% bind_rows()
                       cw <- private$cryptowatch()

                       private$supply <- list(ape_wisdom=aw, cryptowatch=cw)
                       # },
                       #   warning = function(warn) {
                       #     print(paste("Something went not as expected: ", warn))
                       #   },
                       #   error = function(err) {
                       #     print(err)
                       #     stop()
                       #   })
                     },
                     fresh_data = function() {
                       aw <- private$ape_wisdom() %>% bind_rows()
                       cw <- private$cryptowatch()

                       private$supply <- list(ape_wisdom=aw, cryptowatch=cw)
                     },
                     get_supply = function() {
                       return(private$supply)
                     }
                   ),
                   private = list(
                     supply = NULL,
                     ape_wisdom = function() {
                       get_req <- GET(paste0("https://apewisdom.io/api/v1.0/filter/all-crypto"))
                       page_num <- fromJSON(rawToChar(get_req$content), flatten = TRUE) %>% .[2:3]

                       get_data <- function(page) {
                         get_req <- GET(paste0("https://apewisdom.io/api/v1.0/filter/all-crypto/page/", page)) # %>% fromJSON(rawToChar(.$content), flatten = TRUE)
                         all_data <- fromJSON(rawToChar(get_req$content), flatten = TRUE)
                         all_data$results$ticker <- gsub(".{2}$", "", as.character(all_data$results$ticker))
                         return(all_data[4])
                       }

                       return <- lapply(page_num$current_page:page_num$pages, get_data) %>%
                         do.call(rbind, .) %>%
                         bind_rows()
                     },
                     cryptowatch = function() {
                       summaries <- cryptowatchR::get_summary()
                       exchange_list <- str_extract(rownames(summaries), "(.*):") %>%
                         gsub(":", "", .) %>%
                         unique()
                       return(list(summaries = summaries, exchange_list = exchange_list))
                     }
                   )
)

data_finder <- R6Class("data_finder",
                       public = list(
                         initialize = function() {
                           self$data <- dataGen$new()
                           private$base <- self$data$get_supply()
                         },
                         find_it = function(arg) {
                           crypt <- private$base$cryptowatch$summaries %>% filter(grepl(tolower(arg), tolower(rownames(.))))
                           ape <- private$base$ape_wisdom %>% filter(grepl(tolower(arg), tolower(ticker)))
                           google <- gtrendsR::gtrends(arg)
                           return(list(cryptowatch=crypt,ape_wisdom=ape,google_trends=google))
                         },
                         data=NULL
                       ),
                       private = list(
                         base=NULL
                       )
)
data <- data_finder$new()
