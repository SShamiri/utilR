#' Calculates the level change
#'
#' @description
#' `calc_change()` calculates the level change of a column in a data-frame over a specified amount of time.
#' `calc_change_per()`  Calculates the percentage change of a column in a data-frame over a specified amount of time.
#'
#' @param column The column to use for calculating the change.
#' @param len The number of lags to use.
#' @param dt The date column to order the column values by.
#'
#' @return A vector containing the change values.
#' @export
#'
#' @examples
#' library(dplyr)
#'
#' # calculating quarterly and annualy change on monthly data
#' lfs_sa4 %>%
#' mutate(emp = employed_full_time_000 + employed_part_time_000) %>%
#' group_by(sa4_code, measurement_date) %>%
#' summarise(emp = sum(emp), .groups = 'drop') %>%
#' mutate(
#'  # quater change
#' qtr_change = calc_change(emp, 3, measurement_date),
#'  # Annual change
#'  annl_change = calc_change(emp, 12, measurement_date)
#'  )
#'
#'#' # calculating quarterly and annualy percentage change on monthly data
#' lfs_sa4 %>%
#' mutate(emp = employed_full_time_000 + employed_part_time_000) %>%
#' group_by(sa4_code, measurement_date) %>%
#' summarise(emp = sum(emp), .groups = 'drop') %>%
#' mutate(
#'  # quater change
#' qtr_change_per = calc_change_per(emp, 3, measurement_date),
#'  # Annual change
#'  annl_change_per = calc_change_per(emp, 12, measurement_date)
#'  )
#'
calc_change <- function(column, len, dt) {

  prev_val <- dplyr::lag(column, n = len, order_by = dt)
  change <- column - prev_val

  return(change)
}
#' @rdname calc_change
calc_change_per <- function(column, len, dt) {

  prev_val <- lag(column, n = len, order_by = dt)
  change <- ((column - prev_val)/prev_val)

  # Special case when current and previous value are both 0
  change[is.nan(change)] <- 0

  return(change)
}
