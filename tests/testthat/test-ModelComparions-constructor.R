library(testthat)
library(PDATK)
library(BiocParallel)

data(sampleICGCmicro)
data(sampleCohortList)

suppressWarnings({
    if (Sys.info()['sysname'] == 'Windows') {
        BiocParallel::register(BiocParallel::SerialParam())
    }
    PCOSPmodel <- PCOSP(sampleICGCmicro, randomSeed=1987)
    trainedPCOSPmodel <- trainModel(PCOSPmodel, numModels=5)
    PCOSPpredCohortList <- predictClasses(sampleCohortList[seq_len(2)],
        model=trainedPCOSPmodel)
    validatedPCOSPModel <- validateModel(trainedPCOSPmodel,
        valData=PCOSPpredCohortList)
})

test_that('ModelComparison constructor works with two SurvivalModel
    sub-classes',
{
    expect_s4_class(
        compareModels(validatedPCOSPModel, validatedPCOSPModel,
            modelNames=c('PCOSP1', 'PCOSP2')),
        'ModelComparison')
})

test_that('ModelComparison constructor works with one ModelComparison
    and one SurvivalModel sub-class',
{
    modComp <- compareModels(validatedPCOSPModel, validatedPCOSPModel)
    expect_s4_class(
        compareModels(modComp, validatedPCOSPModel, model2Name='PCOSP3'),
        'ModelComparison')
})

## TODO:: Implement this method
# test_that('ModelComparison constructor works with two ModelComparison
#     objects',
# {
#     modComp <- compareModels(validatedPCOSPModel, validatedPCOSPModel)
#     expect_s4_class(compareModels(modComp, modComp), 'ModelComparsion')
# })
