# specify path to drivers if needed for connection
Sys.setenv(DATABASECONNECTOR_JAR_FOLDER = "myPathToJar")
Sys.setenv(PATH_TO_AUTH_DLL = "MyPathToDDL")

# install the package
remotes::install_github("https://github.com/aostropolets/KEEPER")

library(KEEPER)


# specify your connection details
cdmDatabaseSchema <- "myCdmSchema"
cohortDatabaseSchema <- "myResultsSchema"
cohortTable = "cohort"
databaseId = "myDatabase"


# create connection details (add necessary parameters for your connection)
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "myDbms",
                                                                server = "myServer")

connection = connect(connectionDetails)


# read sql files for cohorts and create three cohorts (T, C and O)
renderTranslateExecuteSql(connection,
                          sql = SqlRender::readSql("inst/glp1ra_201100000.sql"),
                          results_database_schema = cohortDatabaseSchema,
                          target_database_schema = cohortDatabaseSchema,
                          target_cohort_table  = cohortTable,
                          target_cohort_id = 201100000,
                          vocabulary_database_schema  = cdmDatabaseSchema,
                          cdm_database_schema = cdmDatabaseSchema
                          )

renderTranslateExecuteSql(connection,
                          sql = SqlRender::readSql("inst/sglt2i_301100000.sql"),
                          results_database_schema = cohortDatabaseSchema,
                          target_database_schema = cohortDatabaseSchema,
                          target_cohort_table  = cohortTable,
                          target_cohort_id = 301100000,
                          vocabulary_database_schema  = cdmDatabaseSchema,
                          cdm_database_schema = cdmDatabaseSchema
                          )

renderTranslateExecuteSql(connection,
                          sql = SqlRender::readSql("inst/hf_6.sql"),
                          results_database_schema = cohortDatabaseSchema,
                          target_database_schema = cohortDatabaseSchema,
                          target_cohort_table  = cohortTable,
                          target_cohort_id = 6,
                          vocabulary_database_schema  = cdmDatabaseSchema,
                          cdm_database_schema = cdmDatabaseSchema
                          )

# create an intersection of T and O and C and O and write them to cohort table
renderTranslateExecuteSql(connection,
                          sql = SqlRender::readSql("inst/outcomes.sql"),
                          target_database_schema = cohortDatabaseSchema,
                          target_cohort_table  = cohortTable,
                          vocabulary_database_schema  = cdmDatabaseSchema,
                          cdm_database_schema = cdmDatabaseSchema
                          )


# run code that creates data frames to examine and writes them to your work dir (naming KEEPER_xxx)
createKEEPER(
  connectionDetails = connectionDetails,
  cohortDefinitionId = 201100006,
  cohortName = "HF GLP1RA",
  cdmDatabaseSchema = cdmDatabaseSchema,
  cohortDatabaseSchema = cohortDatabaseSchema,
  databaseId = databaseId,
  exportFolder = getwd(),
  useAncestor = TRUE,
  sampleSize = 100,
  assignNewId = TRUE,
  doi = c(316139),
  symptoms = c(4271505, 77670, 4309070),
  comorbidities = c(34057, 201826,321052,432867),
  alternativeDiagnosis = c(4329847, 258449,261880,312337,312343,313217,319049,320739,436996,440417,4094683, 4329847),
  drugs = c(902427,904542,904639,905273,905531,942350,948787,950370,956874,970250,974166,975125,978555,991382,992590,1110410,1135766,1183554,1307046,1307863,1308216,1308368,1308842,1309799,1309944,1313200,1314002,1314577,1316354,1317640,1318137,1318853,1319133,1319880,1319998,1321341,1322081,1326012,1326303,1327978,1328165,1331235,1332418,1334456,1335301,1337107,1337720,1337860,1340128,1341927,1342001,1342439,1345858,1346686,1346823,
                 1347384,1350489,1351447,1351461,1351557,1353256,1353766,1353776,1354860,1361711,1363053,1363749,1367500,1367571,1368671,1370109,1373225,1373928,1379525,1381504,1383815,1383925,1386957,1395058,1398937,1510813,1523280,1526475,1539403,1545958,1549686,1551803,1551860,1592085,1592180,19005658,19010927,19017805,19020994,19026180,19051463,19063575,19082886,40226742),
  measurements = c(1003839,4021291,4108582,4197113,4307029,37040477,37045968,37053961,37057624,37063873,37066693,37066831,37071238,37072384,37075202,37076644,40652643,40653873,40653874,40653875,40654390),
  diagnosticProcedures = c(2106828,2211517,2314150,2725825,2787299,2832891,4029714,4032254,4057804,4090698,4093436,4099175,4120837,4163951,4205560,4223020,40481382,42734807,42739616,45888788,45888876,45888944,45889587),
  treatmentProcedures = c(2100826,2813707,4012185,4040722,4051938,4060257,4289454,45887730,45889691),
  complications =  c(201965,254061,313217,314658,314665,316139,321042,321319,438168,4103295,4317150)
)

createKEEPER(
  connectionDetails = connectionDetails,
  cohortDefinitionId = 301100006,
  cohortName = "HF SGLT2",
  cdmDatabaseSchema = cdmDatabaseSchema,
  cohortDatabaseSchema = cohortDatabaseSchema,
  databaseId = databaseId,
  exportFolder = getwd(),
  useAncestor = TRUE,
  sampleSize = 100,
  assignNewId = TRUE,
  doi = c(316139),
  symptoms = c(4271505, 77670, 4309070),
  comorbidities = c(34057, 201826,321052,432867),
  alternativeDiagnosis = c(4329847, 258449,261880,312337,312343,313217,319049,320739,436996,440417,4094683, 4329847),
  drugs = c(902427,904542,904639,905273,905531,942350,948787,950370,956874,970250,974166,975125,978555,991382,992590,1110410,1135766,1183554,1307046,1307863,1308216,1308368,1308842,1309799,1309944,1313200,1314002,1314577,1316354,1317640,1318137,1318853,1319133,1319880,1319998,1321341,1322081,1326012,1326303,1327978,1328165,1331235,1332418,1334456,1335301,1337107,1337720,1337860,1340128,1341927,1342001,1342439,1345858,1346686,1346823,
            1347384,1350489,1351447,1351461,1351557,1353256,1353766,1353776,1354860,1361711,1363053,1363749,1367500,1367571,1368671,1370109,1373225,1373928,1379525,1381504,1383815,1383925,1386957,1395058,1398937,1510813,1523280,1526475,1539403,1545958,1549686,1551803,1551860,1592085,1592180,19005658,19010927,19017805,19020994,19026180,19051463,19063575,19082886,40226742),
  measurements = c(1003839,4021291,4108582,4197113,4307029,37040477,37045968,37053961,37057624,37063873,37066693,37066831,37071238,37072384,37075202,37076644,40652643,40653873,40653874,40653875,40654390),
  diagnosticProcedures = c(2106828,2211517,2314150,2725825,2787299,2832891,4029714,4032254,4057804,4090698,4093436,4099175,4120837,4163951,4205560,4223020,40481382,42734807,42739616,45888788,45888876,45888944,45889587),
  treatmentProcedures = c(2100826,2813707,4012185,4040722,4051938,4060257,4289454,45887730,45889691),
  complications =  c(201965,254061,313217,314658,314665,316139,321042,321319,438168,4103295,4317150)
)



