Feature: fetching User Details
  Background:
    * callonce read('classpath:AccessToken/generateAccessToken_TrueFlags.feature')
    * def access_token = getToken
    * print('Access token is:', access_token)
    * configure headers = {'Authorization': #(access_token),'Content-Type': 'application/soap+xml; charset=utf-8'}
    * configure ssl = true
    * url baseUrlOrgReport

  Scenario: @OrganizationReport_LegacyID
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_legacyIdSearch.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/RecordCount == '1'

  Scenario: @OrganizationReport_OrgName
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_OrgName.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId[1] == '#notnull'
    * def RecCount = /Envelope/Body/OrganizationReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '200'
    * def OrgCount = /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name
    * assert OrgCount.length == 50

  Scenario: @OrganizationReport_POZ
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_POZ.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ223M22T'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Status == 'Active'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Locations/Location/Address[1] == <Address xmlns="urn:lnrisk:ws:wshealthcare:(internal)@ver=${#Project#ver}" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><StreetNumber>10460</StreetNumber><StreetName>AL HIGHWAY 168</StreetName><UnitDesignation>STE</UnitDesignation><UnitNumber>1</UnitNumber><StreetAddress1>10460 AL HIGHWAY 168</StreetAddress1><StreetAddress2>STE 1</StreetAddress2><City>BOAZ</City><State>AL</State><Zip5>35957</Zip5><Zip4>1930</Zip4><County>Marshall County</County><PostalCode>35957</PostalCode><StateCityZip>AL BOAZ                      35957</StateCityZip><Latitude>34.198603</Latitude><Longitude>-86.159412</Longitude><ErrorCode>S800</ErrorCode><FIPSCode>01095</FIPSCode><FIPSState>01</FIPSState><FIPSCounty>095</FIPSCounty><CBSACode>10700</CBSACode><CBSAType>Micro</CBSAType><LegacyLocationId>158191482</LegacyLocationId><LegacyAggregateId>158191481</LegacyAggregateId></Address>

  Scenario: @OrganizationReport_Specialties
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_Specialties.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 60000
    * match /Envelope/Body/OrganizationReportResponseEx/response/ReportOptions/BestRules contains 'HMS Build:'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Specialties[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Specialties/Specialty/Specialty[1] == ["Psychiatry","Psychiatry","Chiropractor","Dermatology","Optometrist","Chiropractor","Podiatrist","Chiropractor","Optometrist"]

  Scenario: @OrganizationReport_GSA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GSA.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 100000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GSASanctions/GSASanction/SanctionId[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GSASanctions/GSASanction/Agency[1] == 'OPM'

  Scenario: @OrganizationReport_OPM
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_OPM.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 100000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Sanctions/Sanction/SanctionId[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Sanctions/Sanction/BoardType[1] == ["STATE","STATE","STATE","STATE"]
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Sanctions/Sanction/OffenseCategory[1] == ["State","State","State","State"]

  Scenario: @OrganizationReport_CoveredRecipient
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_CoveredRecipient.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 20000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/CoveredRecipientIds/CoveredRecipientId[1] == '239061'

  Scenario: @OrganizationReport_HIN
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GLN.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 200000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/HealthIndustryNumbers[1]/HealthIndustryNumber[1] == '09L93LR00'

  Scenario: @OrganizationReport_GLN
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GLN.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 10000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222K54U'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GlobalLocationNumbers[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GlobalLocationNumbers[1]/GlobalLocationNumber[1]/Number == '1100003089060'

  Scenario: @OrganizationReport_Licenses
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_Licenses.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 600000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Licenses/License[1]/LicenseNumber[1] == 'PHY.006753-HOS'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Licenses/License[1]/LicenseState[1] == 'LA'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Licenses/License[1]/OriginalLicenseNumber[1] == 'PHY.006753-HOS'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Licenses/License[1]/FileCode[1] == 'LIC_LAF4'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Licenses/License[1]/ExpirationDate[1] == <ExpirationDate><Year>2018</Year><Month>03</Month><Day>07</Day></ExpirationDate>

  Scenario: @OrganizationReport_FEIN
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_FEIN.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/RecordCount == '1'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames[1] == <OrganizationNames xmlns="urn:lnrisk:ws:wshealthcare:(internal)@ver=${#Project#ver}" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><OrganizationName><Name>OCHSNER LAFAYETTE GENERAL SURGICAL HOSPITAL</Name></OrganizationName><OrganizationName><Name>LAFAYETTE GENERAL SURGICAL HOSPITAL</Name></OrganizationName></OrganizationNames>
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222DBEP'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FEINs[1] == <FEINs><FEIN>481300080</FEIN></FEINs>
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Locations/Location/Address == <Address><StreetNumber>1000</StreetNumber><StreetPreDirection>W</StreetPreDirection><StreetName>PINHOOK</StreetName><StreetSuffix>RD</StreetSuffix><UnitDesignation>STE</UnitDesignation><UnitNumber>100</UnitNumber><StreetAddress1>1000 W PINHOOK RD</StreetAddress1><StreetAddress2>STE 100</StreetAddress2><City>LAFAYETTE</City><State>LA</State><Zip5>70503</Zip5><Zip4>2460</Zip4><County>Lafayette Parish</County><PostalCode>70503</PostalCode><StateCityZip>LA LAFAYETTE                 70503</StateCityZip><Latitude>30.204060</Latitude><Longitude>-92.014350</Longitude><ErrorCode>S801</ErrorCode><FIPSCode>22055</FIPSCode><FIPSState>22</FIPSState><FIPSCounty>055</FIPSCounty><CBSACode>29180</CBSACode><CBSAType>Metro</CBSAType><LegacyLocationId>11230305</LegacyLocationId><LegacyAggregateId>10542448</LegacyAggregateId></Address>

  Scenario: @OrganizationReport_DEA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_DEA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames[1]/OrganizationName == <OrganizationName><Name>WALGREENS #7728</Name></OrganizationName>
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222EJ4S'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords/DEARecord/DEANumber == 'BW9355187'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords/DEARecord/DrugSchedule == '22N 33N 4 5'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords/DEARecord/Status == '1'

  Scenario: @OrganizationReport_NPI
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_NPI.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 300000
    * match /Envelope/Body/OrganizationReportResponseEx/response/RecordCount == '1'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/Status == 'Active'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ22228Z7'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/NPIRecords[1]/NPIRecord[1]/NPIInformation[1]/NPINumber[1] == '1033210166'

  Scenario: @OrganizationReport_CLIA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_NPI.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 300000
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/CLIARecords/CLIARecord[1] ==   <CLIARecord><CLIANumber>14D0417762</CLIANumber><ExpirationDate><Year>2023</Year><Month>02</Month><Day>27</Day></ExpirationDate><CertificateType>CERTIFICATE OF ACCREDITATION</CertificateType><LaboratoryType>Hospital</LaboratoryType><TerminationCode>00</TerminationCode><CompanyName>PRESENCE SAINT FRANCIS HOSPITAL EVANSTON</CompanyName><CLIAProviderAddress><StreetNumber>355</StreetNumber><StreetName>RIDGE</StreetName><StreetSuffix>AVE</StreetSuffix><StreetAddress1>355 RIDGE AVENUE</StreetAddress1><City>EVANSTON</City><State>IL</State><Zip5>60202</Zip5><Zip4>3328</Zip4><County>17031</County></CLIAProviderAddress><Phone10>8473166262</Phone10><RecordType>S</RecordType><DateFirstSeen><Year>2021</Year><Month>12</Month><Day>01</Day></DateFirstSeen><DateLastSeen><Year>2022</Year><Month>06</Month><Day>01</Day></DateLastSeen></CLIARecord>

  Scenario: @OrganizationReport_SearchByAddress_Address
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_SearchbyAddress.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/ReportBy/Address[1] == <Address><StreetAddress1>MONROE ST</StreetAddress1><City>SAN JOSE</City><State>CA</State></Address>

  Scenario: @OrganizationReport_SearchByAddress_NPI
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_SearchbyNPI.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222K54U'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BELLIN HEALTH PHARMACY'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType[1] == 'PHARM'

  Scenario: @OrganizationReport_SearchByAddress_CLIA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_SearchbyCLIA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ2224R3U'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BROOKWOOD ENT. ASSOCIATES PC'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType[1] == 'PRACT'

  Scenario: @OrganizationReport_SearchByAddress_NCPD
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_SearchbyNCPD.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ223M22T'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BOAZ DISCOUNT DRUGS INC'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType[1] == 'PHARM'
    * match /Envelope/Body/OrganizationReportResponseEx/response/RecordCount == '1'

  Scenario: @OrganizationReport_SearchByAddress_NCPD
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_SearchbyNCPD.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ223M22T'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BOAZ DISCOUNT DRUGS INC'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType[1] == 'PHARM'
    * match /Envelope/Body/OrganizationReportResponseEx/response/RecordCount == '1'

  Scenario: @OrganizationReport_1-50
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_1-50.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * def RecCount = /Envelope/Body/OrganizationReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '200'
    * def OrgCount = /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name
    * assert OrgCount.length == 100

  Scenario: @OrganizationReport_POS
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_POS.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/PointOfServiceIds[1] == <PointOfServiceIds><PointOfServiceId>240117</PointOfServiceId></PointOfServiceIds>

  Scenario: @OrganizationReport_DEA_PartialRestrict
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_DEA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222EJ4S'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords/ExpirationDate[1] == '#notpresent'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords/DEARecord/DEANumber[1] == '#notnull'

  Scenario: @OrganizationReport_Globals_True_Sanctions
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsTrue_Sanc.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GSASanctions/GSASanction/SanctionId[1] == '#notnull'

  Scenario: @OrganizationReport_Globals_True_POS
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsTrue_POS.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/PointOfServiceIds[1] == '#notnull'

  Scenario: @OrganizationReport_Globals_True_NCPDP
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsTrue_NCPDP.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/PointOfServiceIds[1] == '#notpresent'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/NCPDPs[1]/NCPDP[1]/ProviderInformation[1]/NCPDPProviderID[1] == '0111928'

  Scenario: @OrganizationReport_Globals_True_Taxonomies
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsTrue_Taxonomies.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/NPIRecords[1]/NPIRecord[1]/ProviderTaxonomies[1]/ProviderTaxonomies[2] == <ProviderTaxonomies><PrimaryTaxonomy>Y</PrimaryTaxonomy><SelectedTaxonomyCode>282N00000X</SelectedTaxonomyCode><Type>Hospitals</Type><Classification>General Acute Care Hospital</Classification><LicenseNumber>31255</LicenseNumber><State>PR</State></ProviderTaxonomies>

  Scenario: @OrganizationReport_Globals_True_CLIA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsTrue_CLIA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ2224R3U'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BROOKWOOD ENT. ASSOCIATES PC'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType == 'PRACT'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/CLIARecords/CLIARecord/CLIANumber == '01D0300904'

  Scenario: @OrganizationSearch_Name
    Given url baseUrlOrgSearch
    And request read('classpath:DataFiles/OrgSearch_Name.xml')
    When method POST
    Then status 200
    And print response
    * def RecCount = /Envelope/Body/OrganizationSearchResponseEx/response/RecordCount[1]
    * assert RecCount > '0'
    * match /Envelope/Body/OrganizationSearchResponseEx/response/Organizations/Organization[1]/LNFID[1] == 'POZ222DMR8'

  Scenario: @OrganizationSearch_NameZip
    Given url baseUrlOrgSearch
    And request read('classpath:DataFiles/OrgSearch_NameZip.xml')
    When method POST
    Then status 200
    And print response
    * def RecCount = /Envelope/Body/OrganizationSearchResponseEx/response/RecordCount[1]
    * assert RecCount >= '400'
    * def LNFIDRecCount = /Envelope/Body/OrganizationSearchResponseEx/response/Organizations/Organization/LNFID[1]
    * match karate.sizeOf(LNFIDRecCount) == 25
















































