Feature: fetching User Details
  Background:
    * callonce read('classpath:AccessToken/generateAccessToken_FalseFlags.feature')
    * def access_token = getToken
    * print('Access token is:', access_token)
    * configure headers = {'Authorization': #(access_token),'Content-Type': 'application/soap+xml; charset=utf-8'}
    * configure ssl = true
    * url baseUrlProviderReport

  Scenario: @ProviderProfile_GlobalsFalse_Languages
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Email.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Emails[1]/Email[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Languages
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Languages.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Languages[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_LexIDs
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_LexIDs.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/UniqueIds[1]/UniqueId[1] == '#notpresent'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/LNPID[1] == 'PIZ24XEH3H'

  Scenario: @ProviderProfile_GlobalsFalse_CoveredRecipients
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_CoveredRecipients.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/CoveredRecipientId[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_SHAId
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_SHAId.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/SHAId[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Surescripts
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Surescripts.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/SurescriptsRecords/SurescriptsRecord[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_TaxID
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_TaxID.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/TINs[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_InComplete
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_InComplete.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Complete == '1'

  Scenario: @ProviderProfile_GlobalsFalse_NonEnumerated
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_NonEnumerated.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Enumerable[1] == '1'

  Scenario: @ProviderProfile_GlobalsFalse_Sanctions
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Sanctions.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Sanctions[1]/Sanction[1]/BoardType == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Specialties
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Specialties.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Specialties[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Licenses
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Licenses.xml')
    When method POST
    Then status 200
    And print response
    * def Count = /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/Licenses
    * match karate.sizeOf(Count) == -1

  Scenario: @ProviderProfile_GlobalsFalse_DOB
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_DOB.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/DOBs[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_DOD
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_DOD.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/DODs[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_FEIN
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_FEIN.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Feins[1] == '#notpresent'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/TINs[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_DEA
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_DEA.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/DEARecords[1]/DEARecord[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_NPI
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_NPI.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/NPIRecords[1]/NPIRecord[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_UPIN
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_UPIN.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/UPINS[1]/UPIN[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Taxonomy
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Taxonomy.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Taxonomies[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_MedSchool
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_MedSchool.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/MedSchools[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Medicaid
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Medicaid.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/MedicaidRecords[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_CSR
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_CSR.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/StateControlledSubstanceRecords[1]/StateControlledSubstanceRecord[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Affiliations
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Affiliations.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Affiliations[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_ABMSBoardCertified
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_ABMSBoardCertified.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/ABMSRecords[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_MedicareEnrollment
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_MedicareEnrollment.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/MedicarePartDEnrollments[1] == '#notnull'

  Scenario: @ProviderProfile_GlobalsFalse_MedicareOrderReferring
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_MedicareOrderReferring.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/MedicarePartBOrderingAndReferringRecords[1] == <MedicarePartBOrderingAndReferringRecords><MedicarePartBOrderingAndReferringRecord><Name><Full>MS KATHLEEN EFFLER</Full><First>KATHLEEN</First><Last>EFFLER</Last><Prefix>MS</Prefix></Name><OrderingReferringIndicator>Y</OrderingReferringIndicator></MedicarePartBOrderingAndReferringRecord></MedicarePartBOrderingAndReferringRecords>

  Scenario: @ProviderProfile_GlobalsFalse_Email2
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Email2.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Emails[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsFalse_Email2
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsFalse_Email2.xml')
    When method POST
    Then status 200
    And print response
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Emails[1] == '#notpresent'












































