Feature: fetching User Details
  Background:
    * callonce read('classpath:AccessToken/generateAccessToken_FalseFlags.feature')
    * def access_token = getToken
    * print('Access token is:', access_token)
    * configure headers = {'Authorization': #(access_token),'Content-Type': 'application/soap+xml; charset=utf-8'}
    * configure ssl = true
    * url baseUrlOrgReport

  Scenario: @OrganizationReport_DEA_LimitedRestrict
    Given url baseUrlOrgReport
    And request read('classpath:DataFiles/OrgReport_DEA_LimitedRestrict.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/LNFID[1] == 'POZ222EJ4S'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords[1]/DEARecord[1]/DrugSchedule[1] == '22N 33N 4 5'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords[1]/DEARecord[1]/ExpirationDate[1] == '#notpresent'
    * match /Envelope/Body/OrganizationReportResponseEx/response/Organizations/Organization/DEARecords[1]/DEARecord[1]/DEANumber[1] == '#notpresent'

  Scenario: @ProviderReport_DEA_LimitedRestrict
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_DEA_LimitedRestrict.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/DEARecords[1]/DEARecord[1]/DrugSchedule[1] == '22N 33N 4 5'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/DEARecords[1]/DEARecord[1]/ExpirationDate[1] == '#notpresent'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/DEARecords[1]/DEARecord[1]/DEANumber[1] == '#notpresent'



















































