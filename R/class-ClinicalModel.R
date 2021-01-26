#'
#'
#' @inherit .SurvivalModel
#'
#' @md
#' @include class-SurvivalModel.R
#' @export
.ClinicalModel <- setClass('ClinicalModel', contains='SurvivalModel')
#'
#'
#' @param trainData A `SurvivalExperiment` or `CohortList` object to construct
#'   a clinical model using
#' @param formula A `formula` object or a `character` vector coercibel to one.
#'   All columns specified in the formula must be in the colData slot of the
#'   all `SurvivalExperiment`s in trainData.
#' @param minDaysSurvived An `integer` specifying the minimum number of days
#'   required to be 'good' prognosis. Default is 365.
#' @param ... Force all subsequent parameters to be named. Not used.
#' @param randomSeed An `integer` randomSeed to use when sampling with this
#'   model object. If missing defaults to 1234.
#'
#' @return A `ClinicalModel` object.
#'
#' @md
#' @export
ClinicalModel <- function(trainData, formula, minDaysSurvived=365, ...,
    randomSeed)
{
    survModel <-
        SurvivalModel(trainData, minDaysSurived=minDaysSurvived,
            randomSeed=randomSeed)

    # ensure the formula is formatted correctly and all columns are in the data
    if (!(is.formula(formula) || is.character(formula)))
        stop(.errorMsg(.context(), "The formula for a clinical model must ",
            "either be a formula object or a character vector coercible to ",
            "a formula object"))

    # add the formula to the metadata
    metadata(survModel)$modelParams <-
        c(metadata(survModel)$modelParams, list(formula=formula))

    # make the clinical model
    clinicalModel <- .ClinicalModel(survModel)
    return(clinicalModel)
}

#'
#'
#'
#'
setValidity('ClinicalModel', function(object) {

    formula <- as.formula(metadata(object)$modelParams$formula)
    formulaCols <- as.character(formula[seq(2, 3)])
    formulaCols <- unlist(strsplit(formulaCols,
        split='[\\s]*[\\+\\-\\~\\=\\*][\\s]*', perl=TRUE))
    hasFormulaCols <- formulaCols %in% colnames(colData(object))
    if (!all(hasFormulaCols)) {
        warning(.warnMsg(.context(), 'The columns ', formulaCols[!hasFormulaCols],
            ' are missing from the colData slot of the training data',
            'Please only specify valid column names in colData to the formula!'))
        FALSE
    } else {
        TRUE
    }
})