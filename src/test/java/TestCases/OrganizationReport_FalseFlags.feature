Feature: fetching User Details
  Background:
    * callonce read('classpath:AccessToken/generateAccessToken_FalseFlags.feature')
    * def access_token = getToken
    * print('Access token is:', access_token)
    * configure headers = {'Authorization': #(access_token),'Content-Type': 'application/soap+xml; charset=utf-8'}
    * configure ssl = true
    * url baseUrlOrgReport

  Scenario: @OrganizationReport_Globals_False_Sanctions
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsFalse_Sanc.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/GSASanctions/GSASanction/SanctionId[1] == '#notpresent'

  Scenario: @OrganizationReport_Globals_False_POS
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsFalse_POS.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/PointOfServiceIds[1] == '#notpresent'

  Scenario: @OrganizationReport_Globals_False_NCPDP
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsFalse_NCPDP.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/PointOfServiceIds[1] == '#notpresent'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/NCPDPs[1] == '#notpresent'

  Scenario: @OrganizationReport_Globals_False_Taxonomies
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsFalse_Taxonomies.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Header/TransactionId == '#notnull'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/NPIRecords[1]/NPIRecord[1]/ProviderTaxonomies[1]/ProviderTaxonomies[2] == '#notpresent'

  Scenario: @OrganizationReport_Globals_False_CLIA
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_GlobalsFalse_CLIA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ2224R3U'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/OrganizationNames/OrganizationName/Name[1] == 'BROOKWOOD ENT. ASSOCIATES PC'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/FacilityType == 'PRACT'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/CLIARecords/CLIARecord/CLIANumber == '#notpresent'























































