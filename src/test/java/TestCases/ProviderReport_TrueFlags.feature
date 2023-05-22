Feature: fetching User Details
  Background:
    * callonce read('classpath:AccessToken/generateAccessToken_TrueFlags.feature')
    * def access_token = getToken
    * print('Access token is:', access_token)
    * configure headers = {'Authorization': #(access_token),'Content-Type': 'application/soap+xml; charset=utf-8'}
    * configure ssl = true
    * url baseUrlProviderReport

  Scenario: @ProviderProfile_Name
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Name.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 60000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/ProviderNames[1]/ProviderName[1]/Name[1] == <Name><Full>MR DAVID RALPH FERRELL</Full><First>DAVID</First><Middle>RALPH</Middle><Last>FERRELL</Last><Prefix>MR</Prefix><ProfessionalSuffix>MD</ProfessionalSuffix></Name>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/Gender[1] == 'M'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/Locations[1]/Location[1]/Address[1]/StreetAddress1[1] == '423 FORTRESS BLVD'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/NPIRecords[1]/NPIRecord[1] == '#notnull'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/LegacyIds[1] == <LegacyIds><LegacyId><Id>PIZ223ZXJ9</Id><Source>ExternalID</Source></LegacyId><LegacyId><Id>1844662</Id><Source>LNPID</Source></LegacyId><LegacyId><Id>PI68BPK1T0</Id><Source>HMS</Source></LegacyId><LegacyId><Id>11769174470279800000000193447330865148</Id><Source>GroupKey</Source></LegacyId></LegacyIds>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/MedicarePartDEnrollments[1] == <MedicarePartDEnrollments><MedicarePartDEnrollment><NPI>1376542290</NPI><Name><Full>David Ferrell</Full><First>David</First><Last>Ferrell</Last></Name><EffectiveDate><Year>2014</Year><Month>11</Month><Day>01</Day></EffectiveDate><OptOutFlag>N</OptOutFlag></MedicarePartDEnrollment></MedicarePartDEnrollments>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/MedicarePartBOrderingAndReferringRecords[1] == <MedicarePartBOrderingAndReferringRecords><MedicarePartBOrderingAndReferringRecord><Name><Full>MR DAVID FERRELL</Full><First>DAVID</First><Last>FERRELL</Last><Prefix>MR</Prefix></Name><OrderingReferringIndicator>Y</OrderingReferringIndicator></MedicarePartBOrderingAndReferringRecord></MedicarePartBOrderingAndReferringRecords>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/Complete[1] == '1'

  Scenario: @ProviderProfile_Address
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Address.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 60000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ222S4EG'
    * def ProviderCount = /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider
    * match karate.sizeOf(ProviderCount) == 50
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[2]/LegacyIds[1] == <LegacyIds><LegacyId><Id>PIZ2239H45</Id><Source>ExternalID</Source></LegacyId><LegacyId><Id>1146538</Id><Source>LNPID</Source></LegacyId><LegacyId><Id>PING5HRRP1</Id><Source>HMS</Source></LegacyId><LegacyId><Id>11825416970379000000000002249030859291</Id><Source>GroupKey</Source></LegacyId></LegacyIds>

  Scenario: @ProviderProfile_TIN
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_TIN.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 60000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ222ZQRP'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Status[1] == 'Active'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name[1]/First[1] == 'ELIZABETH'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name[1]/Last[1] == 'FABENS'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name[1]/ProfessionalSuffix[1] == 'MD'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/TINs[1]/TIN[1] == '232706792'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/LegacyIds[1] == <LegacyIds><LegacyId><Id>PIZ222ZQRP</Id><Source>ExternalID</Source></LegacyId><LegacyId><Id>914613</Id><Source>LNPID</Source></LegacyId><LegacyId><Id>PI6XET3PU2</Id><Source>HMS</Source></LegacyId><LegacyId><Id>11769172260279800000000154907230865148</Id><Source>GroupKey</Source></LegacyId></LegacyIds>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider[1]/Locations[1] == <Locations><Location><Address><StreetNumber>345</StreetNumber><StreetPreDirection>E</StreetPreDirection><StreetName>MOUNT AIRY</StreetName><StreetSuffix>AVE</StreetSuffix><StreetAddress1>345 E MOUNT AIRY AVE</StreetAddress1><City>PHILADELPHIA</City><State>PA</State><Zip5>19119</Zip5><Zip4>1114</Zip4><County>Philadelphia Count</County><PostalCode>19119</PostalCode><StateCityZip>PA PHILADELPHIA              19119</StateCityZip><Latitude>40.064574</Latitude><Longitude>-75.186389</Longitude><GeoMatch>0</GeoMatch><AddressType>BUSN</AddressType><RecordType>BU</RecordType><ErrorCode>S800</ErrorCode><FIPSCode>42101</FIPSCode><FIPSState>42</FIPSState><FIPSCounty>101</FIPSCounty><CBSACode>37980</CBSACode><CBSAType>Metro</CBSAType><LegacyLocationId>5661777</LegacyLocationId><LegacyAggregateId>5661774</LegacyAggregateId><FirmName>GREENHOUSE INTERNISTS</FirmName></Address><Phones><Phone><Number>2152425000</Number></Phone><Phone><Number>2156879437</Number></Phone></Phones><Faxes><Fax><Number>2152425086</Number></Fax><Fax><Number>2157545331</Number></Fax><Fax><Number>2152423951</Number></Fax></Faxes></Location></Locations>

  Scenario: @ProviderProfile_UPIN
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_UPIN.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 60000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ22222K5'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Status[1] == 'Active'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UPINs[1]/UPIN[1] == <UPIN><ProviderName><Full>KATHLEEN L. WYNE</Full><First>KATHLEEN</First><Middle>L.</Middle><Last>WYNE</Last></ProviderName><Practice><City>Dallas</City><State>TX</State><Zip5>75235</Zip5><LegacyLocationId>351260804</LegacyLocationId><LegacyAggregateId>350916313</LegacyAggregateId></Practice><Billing><LegacyLocationId>0</LegacyLocationId><LegacyAggregateId>0</LegacyAggregateId></Billing><Gender>5</Gender><UPIN>G77365</UPIN><Specialty>46</Specialty><UniqueId>0</UniqueId><LegacyBusinessId>0</LegacyBusinessId><BusinessIds><DotID>0</DotID><EmpID>0</EmpID><POWID>0</POWID><ProxID>0</ProxID><SeleID>0</SeleID><OrgID>0</OrgID><UltID>0</UltID></BusinessIds><LNFID>0</LNFID><LNPID>530</LNPID></UPIN>

  Scenario: @ProviderProfile_Licenses
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Licenses.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Status[1] == 'Active'
    * def LicenseCount = /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/Licenses/License
    * match karate.sizeOf(LicenseCount) == 57

  Scenario: @ProviderProfile_NPI
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_NPI.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ244WJ3N'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Status[1] == 'Active'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/NPIRecords/NPIRecord == <NPIRecord><EntityInformation><EntityName><Full>GERARDO                                   GOMEZ</Full><First>GERARDO</First><Last>GOMEZ</Last><Prefix>MR</Prefix></EntityName><Sex>M</Sex><SoleProprietor>0</SoleProprietor></EntityInformation><NPIInformation><NPINumber>1003000100</NPINumber><EntityType>1</EntityType><EnumDate><Year>2007</Year><Month>08</Month><Day>31</Day></EnumDate><LastUpdateDate><Year>2007</Year><Month>08</Month><Day>31</Day></LastUpdateDate><Status>A</Status></NPIInformation><ProviderMailingAddress><StreetNumber>680</StreetNumber><StreetPreDirection>S</StreetPreDirection><StreetName>WILTON</StreetName><StreetSuffix>PL</StreetSuffix><StreetAddress1>680 S WILTON PL</StreetAddress1><City>LOS ANGELES</City><State>CA</State><Zip5>90005</Zip5><Zip4>3200</Zip4><PostalCode>900053200</PostalCode><StateCityZip>CA                                       LOS ANGEL</StateCityZip><FaxNumber>2133831280</FaxNumber><PhoneNumber>2133657400</PhoneNumber></ProviderMailingAddress><ProviderPracticeAddress><StreetNumber>680</StreetNumber><StreetPreDirection>S</StreetPreDirection><StreetName>WILTON</StreetName><StreetSuffix>PL</StreetSuffix><StreetAddress1>680 S WILTON PL</StreetAddress1><City>LOS ANGELES</City><State>CA</State><Zip5>90005</Zip5><Zip4>3200</Zip4><PostalCode>900053200</PostalCode><StateCityZip>CA                                       LOS ANGEL</StateCityZip><FaxNumber>2133831280</FaxNumber><PhoneNumber>2133657400</PhoneNumber></ProviderPracticeAddress><ProviderTaxonomies><ProviderTaxonomies><PrimaryTaxonomy>Y</PrimaryTaxonomy><SelectedTaxonomyCode>171M00000X</SelectedTaxonomyCode><Type>Other Service Providers</Type><Classification>Case Manager/Care Coordinator</Classification></ProviderTaxonomies></ProviderTaxonomies></NPIRecord>

  Scenario: @ProviderProfile_DEA
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_DEA.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ22223PZ'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Status[1] == 'Active'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers/Provider/DEARecords[1]/DEARecord[1] ==   <DEARecord><Address><StreetNumber>1</StreetNumber><StreetName>ROBERT WOOD JOHNSON</StreetName><StreetSuffix>PL</StreetSuffix><StreetAddress1>1 ROBERT WOOD JOHNSON PL</StreetAddress1><City>NEW BRUNSWICK</City><State>NJ</State><Zip5>08901</Zip5><Zip4>1928</Zip4><PostalCode>08901</PostalCode><LegacyLocationId>4762752</LegacyLocationId><LegacyAggregateId>4762751</LegacyAggregateId><VanityCity>NEW BRUNSWICK</VanityCity></Address><BusinessActivityCode>C</BusinessActivityCode><BusinessActivityCodeDesc>Practitioner</BusinessActivityCodeDesc><BusinessActivitySubCode>0</BusinessActivitySubCode><BusinessActivitySubCodeDesc>Practitioner</BusinessActivitySubCodeDesc><XDEAIndicator>0</XDEAIndicator><ExpirationDate><Year>2025</Year><Month>12</Month><Day>31</Day></ExpirationDate><DEANumber>FO4163440</DEANumber><DrugSchedule>22N 33N 4 5</DrugSchedule><Status>1</Status><Name><Full>ANUPAM                                    OHRI</Full><First>ANUPAM</First><Last>OHRI</Last></Name></DEARecord>

  Scenario: @ProviderProfile_Specialties
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Specialties.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx[1]/response[1]/Providers[1]/Provider[1]/Specialties[1]/Specialty[1]/PractitionerType[1] == 'Physician'
    * match /Envelope/Body/ProviderReportResponseEx[1]/response[1]/Providers[1]/Provider[1]/Specialties[1]/Specialty[1]/Specialty[1] == 'Psychiatry & Neurology'
    * match /Envelope/Body/ProviderReportResponseEx[1]/response[1]/Providers[1]/Provider[1]/Specialties[1]/Specialty[1]/SubSpecialty[1] == 'Psychiatry'

  Scenario: @ProviderProfile_MedicaidNumber
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_MedicaidNumber.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ23GVASP'
    * match /Envelope/Body/ProviderReportResponseEx[1]/response[1]/Providers[1]/Provider[1]/MedicaidRecords[1] == <MedicaidRecords><MedicaidRecord><State>VT</State><Number>F156174</Number><Status>ACTIVE</Status></MedicaidRecord></MedicaidRecords>

  Scenario: @ProviderProfile_CSR
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_CSR.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ224R7JT'

  Scenario: @ProviderProfile_Surescripts
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Surescripts.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ2228PTE'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name == <Name><Full>MR ROBERT WILLIAM MURRAY</Full><First>ROBERT</First><Middle>WILLIAM</Middle><Last>MURRAY</Last><Prefix>MR</Prefix><ProfessionalSuffix>MD</ProfessionalSuffix></Name>

  Scenario: @ProviderProfile_CoveredRecipient
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_CoveredRecipient.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ25W3N9U'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name == <Name><Full>MS BETTY BARRETT</Full><First>BETTY</First><Last>BARRETT</Last><Prefix>MS</Prefix></Name>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/CoveredRecipientIds[1]/CoveredRecipientId[1] == '120478'

  Scenario: @ProviderProfile_LegacyIDs
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_LegacyIDs.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ2255YEE'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name ==   <Name><Full>MR CONRAD ROBERT MURRAY</Full><First>CONRAD</First><Middle>ROBERT</Middle><Last>MURRAY</Last><Prefix>MR</Prefix><ProfessionalSuffix>MD</ProfessionalSuffix></Name>
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Locations[1]/Location[1]/Address ==   <Address><StreetName>PO BOX 72216</StreetName><StreetAddress1>PO BOX 72216</StreetAddress1><City>LAS VEGAS</City><State>NV</State><Zip5>89170</Zip5><Zip4>2216</Zip4><County>Clark County</County><PostalCode>89170</PostalCode><StateCityZip>NV LAS VEGAS                 89170</StateCityZip><Latitude>36.105130</Latitude><Longitude>-115.137150</Longitude><GeoMatch>5</GeoMatch><AddressType>MAIL</AddressType><RecordType>MA</RecordType><ErrorCode>S800</ErrorCode><FIPSCode>32003</FIPSCode><FIPSState>32</FIPSState><FIPSCounty>003</FIPSCounty><CBSACode>29820</CBSACode><CBSAType>Metro</CBSAType><LegacyLocationId>12363820</LegacyLocationId><LegacyAggregateId>12363819</LegacyAggregateId></Address>

  Scenario: @ProviderProfile_Pagination
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Pagination.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ223PAWH'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ProviderNames[1]/ProviderName[1]/Name ==    <Name><Full>MR MARK JOHN SCHULTZ</Full><First>MARK</First><Middle>JOHN</Middle><Last>SCHULTZ</Last><Prefix>MR</Prefix><ProfessionalSuffix>MD</ProfessionalSuffix></Name>

  Scenario: @ProviderProfile_VerifiedSecureFax
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_VerifiedSecureFax.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ2222338'

  Scenario: @ProviderProfile_Sanctions_OIG
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_OIG.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ22298VV'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1]/BoardDescription[1] == 'OFFICE OF PERSONNEL MANAGEMENT'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[2]/SanctionType[1] == 'OIG'

  Scenario: @ProviderProfile_Sanctions_OPM
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_OPM.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1]/SanctionType[1] == 'OPM'

  Scenario: @ProviderProfile_Sanctions_GSA
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_GSA.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/GSASanctions == <GSASanctions><GSASanction><Name><First>PATRICK</First><Middle>CLAY</Middle><Last>WALLACE</Last></Name><SanctionId>S4MR3P71X-20050512</SanctionId><Address><City>ABINGDON</City><State>VA</State><Zip5>24210</Zip5></Address><Agency>OPM</Agency><ActionDate><Year>2005</Year><Month>05</Month><Day>12</Day></ActionDate><ConfidenceLevel>2</ConfidenceLevel></GSASanction><GSASanction><Name><First>PATRICK</First><Middle>CLAY</Middle><Last>WALLACE</Last></Name><SanctionId>S4MR3N05P-20050320</SanctionId><Address><City>ABINGDON</City><State>VA</State><Zip5>24210</Zip5></Address><Agency>HHS</Agency><ActionDate><Year>2005</Year><Month>03</Month><Day>20</Day></ActionDate><ConfidenceLevel>1</ConfidenceLevel></GSASanction></GSASanctions>

  Scenario: @ProviderProfile_Sanctions_MedicaidSanctions
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_MedicaidSanctions.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1] == <Sanction><SanctionId>a54f377115fbd8549b83497ede6eb87b</SanctionId><UniqueId>0</UniqueId><Address><LegacyLocationId>254898705</LegacyLocationId><LegacyAggregateId>248004721</LegacyAggregateId></Address><SanctionCode>111L</SanctionCode><BoardType>STATE</BoardType><OffenseCode>OFF05U</OffenseCode><OffenseDescription>Professional Misconduct, Otherwise Undefined</OffenseDescription><OffenseCategory>LICENSE</OffenseCategory><ActionCode>ACT05A</ActionCode><ActionDescription>Surrender of License</ActionDescription><ActionDate><Year>2010</Year><Month>12</Month><Day>27</Day></ActionDate><SanctionDate><Year>2010</Year><Month>12</Month><Day>27</Day></SanctionDate><BoardDescription>Kentucky Board of Medical Licensure</BoardDescription><SanctionType>STATE</SanctionType><Name><Full>Augusto T. Abad</Full><First>Augusto</First><Middle>T.</Middle><Last>Abad</Last></Name></Sanction>

  Scenario: @ProviderProfile_Sanctions_StateSanctions
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_StateSanctions.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1] == <Sanction><SanctionId>a54f377115fbd8549b83497ede6eb87b</SanctionId><UniqueId>0</UniqueId><Address><LegacyLocationId>254898705</LegacyLocationId><LegacyAggregateId>248004721</LegacyAggregateId></Address><SanctionCode>111L</SanctionCode><BoardType>STATE</BoardType><OffenseCode>OFF05U</OffenseCode><OffenseDescription>Professional Misconduct, Otherwise Undefined</OffenseDescription><OffenseCategory>LICENSE</OffenseCategory><ActionCode>ACT05A</ActionCode><ActionDescription>Surrender of License</ActionDescription><ActionDate><Year>2010</Year><Month>12</Month><Day>27</Day></ActionDate><SanctionDate><Year>2010</Year><Month>12</Month><Day>27</Day></SanctionDate><BoardDescription>Kentucky Board of Medical Licensure</BoardDescription><SanctionType>STATE</SanctionType><Name><Full>Augusto T. Abad</Full><First>Augusto</First><Middle>T.</Middle><Last>Abad</Last></Name></Sanction>

  Scenario: @ProviderProfile_Sanctions_DEA
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_DEA.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ22P2H4N'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1]/BoardDescription[1] == 'Virginia Department of Health ProfessionsBoard of Medicine'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[4]/SanctionType[1] == 'OIG'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[5] == <Sanction><SanctionId>ecf0b1b7b688196a2b695316f5ef85e3</SanctionId><UniqueId>0</UniqueId><Address><StreetNumber>2004</StreetNumber><StreetName>BREMO</StreetName><StreetSuffix>RD</StreetSuffix><UnitDesignation>STE</UnitDesignation><UnitNumber>200</UnitNumber><City>Richmond</City><State>VA</State><Zip5>23226</Zip5><LegacyLocationId>9711592</LegacyLocationId><LegacyAggregateId>4684835</LegacyAggregateId></Address><SanctionCode>280151</SanctionCode><BoardType>STATE</BoardType><OffenseCode>OFF00A</OffenseCode><OffenseDescription>Not Available, Offense Otherwise Undefined</OffenseDescription><OffenseCategory>Rx</OffenseCategory><ActionCode>ACT03A</ActionCode><ActionDescription>Revocation of License</ActionDescription><ActionDate><Year>2021</Year><Month>01</Month><Day>11</Day></ActionDate><SanctionDate><Year>2021</Year><Month>01</Month><Day>11</Day></SanctionDate><BoardDescription>Drug Enforcement Administration (DEA)</BoardDescription><SanctionType>DEA</SanctionType><Name><Full>Zeljko Stjepanovic</Full><First>Zeljko</First><Last>Stjepanovic</Last></Name><SanctionState>VA</SanctionState></Sanction>

  Scenario: @ProviderProfile_DEA_False
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_DEA_False.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ22DK38F'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/DEARecords[1] == '#notpresent'

  Scenario: @ProviderProfile_Specialties_False
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Specialties_False.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Specialties[1] == '#notpresent'

  Scenario: @ProviderProfile_Sanctions_OIG_Exclude
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_OIG_Exclude.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1] == '#notpresent'

  Scenario: @ProviderProfile_Sanctions_OPM_Exclude
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_OPM_Exclude.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1] == <Sanction><SanctionId>52d6be7a9a7dfa1b796bebd5eaec555e</SanctionId><UniqueId>0</UniqueId><Address><City>Abingdon</City><State>VA</State><Zip5>24210</Zip5><LegacyLocationId>351281940</LegacyLocationId><LegacyAggregateId>350931327</LegacyAggregateId></Address><SanctionCode>B5</SanctionCode><BoardType>FEDERAL</BoardType><OffenseCode>OFF99A</OffenseCode><OffenseDescription>Any and All Other Offenses</OffenseDescription><OffenseCategory>PROGRAM</OffenseCategory><ActionCode>ACT07F</ActionCode><ActionDescription>Exclusion by Office of Personnel Management</ActionDescription><ActionDate><Year>2005</Year><Month>05</Month><Day>12</Day></ActionDate><SanctionDate><Year>2005</Year><Month>05</Month><Day>12</Day></SanctionDate><BoardDescription>OFFICE OF PERSONNEL MANAGEMENT</BoardDescription><SanctionType>OPM</SanctionType><Name><Full>Patrick Clay Wallace</Full><First>Patrick</First><Middle>Clay</Middle><Last>Wallace</Last></Name><SanctionState>VA</SanctionState></Sanction>

  Scenario: @ProviderProfile_Sanctions_GSA_Exclude
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_OIG_Exclude.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider/GSASanctions == '#notpresent'

  Scenario: @ProviderProfile_Sanctions_Medicaid_Exclude
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_Medicaid_Exclude.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[3]/SanctionType[1] == 'Medicaid'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[3]/SanctionCode[1] == 'SME'

  Scenario: @ProviderProfile_Sanctions_StateSanctions_Exclude
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_StateSanctions_Exclude.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1]/SanctionType[1] == 'STATE'

  Scenario: @ProviderProfile_Sanctions_TIN_False
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Sanctions_TIN_False.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/LNPID[1] == 'PIZ2228RHJ'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/TINS == '#notpresent'

  Scenario: @ProviderProfile_GlobalsTrue_Languages
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_Languages.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Languages[1] == <Languages><Language><Description>English</Description></Language><Language><Description>Russian</Description></Language><Language><Description>Spanish</Description></Language></Languages>

  Scenario: @ProviderProfile_GlobalsTrue_LexIDs
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_LexIDs.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UniqueIds[1]/UniqueId[1] == '90'

  Scenario: @ProviderProfile_GlobalsTrue_CoveredRecipients
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_CoveredRecipients.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/CoveredRecipientIds[1] == <CoveredRecipientIds xmlns="urn:lnrisk:ws:wshealthcare:(internal)@ver=${#Project#ver}" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><CoveredRecipientId>21453</CoveredRecipientId></CoveredRecipientIds>

  Scenario: @ProviderProfile_GlobalsTrue_SHAId
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_SHAId.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/SHAs[1] == '#notpresent'

  Scenario: @ProviderProfile_GlobalsTrue_SureScripts
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_SureScripts.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/SurescriptsRecords[1]/SurescriptsRecord[1]/SurescriptsProviderId[1] == '6937664608004'

  Scenario: @ProviderProfile_GlobalsTrue_TaxID
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_TaxID.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/TINs[1] == <TINs xmlns="urn:lnrisk:ws:wshealthcare:(internal)@ver=${#Project#ver}" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><TIN>200582661</TIN><TIN>463969536</TIN></TINs>

  Scenario: @ProviderProfile_GlobalsTrue_InComplete
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_InComplete.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'

  Scenario: @ProviderProfile_GlobalsTrue_Sanctions
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_Sanctions.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Sanctions[1]/Sanction[1] == <Sanction><SanctionId>ebb23a215b2498ba5cbaab9fe157e61d</SanctionId><UniqueId>0</UniqueId><Address><LegacyLocationId>254898705</LegacyLocationId><LegacyAggregateId>248004721</LegacyAggregateId></Address><SanctionCode>111L</SanctionCode><BoardType>STATE</BoardType><OffenseCode>OFF05U</OffenseCode><OffenseDescription>Professional Misconduct, Otherwise Undefined</OffenseDescription><OffenseCategory>LICENSE</OffenseCategory><ActionCode>ACT05A</ActionCode><ActionDescription>Surrender of License</ActionDescription><ActionDate><Year>2007</Year><Month>10</Month><Day>29</Day></ActionDate><SanctionDate><Year>2007</Year><Month>10</Month><Day>29</Day></SanctionDate><BoardDescription>Medical Board of California</BoardDescription><SanctionType>STATE</SanctionType><Name><Full>Charles Howard Dickerson</Full><First>Charles</First><Middle>Howard</Middle><Last>Dickerson</Last></Name></Sanction>

  Scenario: @ProviderProfile_GlobalsTrue_Specialties
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_Specialties.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Specialties[1]/Specialty[1] == <Specialty><PractitionerType>Physician</PractitionerType><Specialty>Internal Medicine</Specialty><SubSpecialty>Geriatric Medicine</SubSpecialty></Specialty>
#
  Scenario: @ProviderProfile_GlobalsTrue_Licenses
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_Licenses.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Licenses[1]/License[1]/LicenseNumber[1] == 'DR.0046733'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Licenses[1]/License[1]/LicenseType[1] == 'MDU'

  Scenario: @ProviderProfile_GlobalsTrue_DOB
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_NPI.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/DOBs[1]/DOB[1] == <DOB><Year>1952</Year><Month>03</Month><Day>25</Day></DOB>

  Scenario: @ProviderProfile_GlobalsTrue_DOD
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_DOD.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/DODs[1]/DOD[1] == <DOD><Year>2010</Year><Month>09</Month><Day>22</Day></DOD>

  Scenario: @ProviderProfile_GlobalsTrue_NPI
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_NPI.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/NPIRecords[1]/NPIRecord[1] == <NPIRecord><EntityInformation><EntityName><Full>DAVID                B                    PEISNER</Full><First>DAVID</First><Middle>B</Middle><Last>PEISNER</Last><Prefix>MR</Prefix></EntityName><Sex>M</Sex><SoleProprietor>0</SoleProprietor></EntityInformation><NPIInformation><NPINumber>1124095443</NPINumber><EntityType>1</EntityType><EnumDate><Year>2006</Year><Month>03</Month><Day>06</Day></EnumDate><LastUpdateDate><Year>2020</Year><Month>05</Month><Day>23</Day></LastUpdateDate><Status>A</Status></NPIInformation><ProviderMailingAddress><StreetNumber>869</StreetNumber><StreetName>BEAVER</StreetName><StreetSuffix>DR</StreetSuffix><StreetAddress1>869 BEAVER DR</StreetAddress1><City>DUBOIS</City><State>PA</State><Zip5>15801</Zip5><Zip4>2511</Zip4><PostalCode>15801</PostalCode><StateCityZip>PA                                       DUBOIS</StateCityZip><FaxNumber>8143716504</FaxNumber><PhoneNumber>8143716501</PhoneNumber></ProviderMailingAddress><ProviderPracticeAddress><StreetNumber>869</StreetNumber><StreetName>BEAVER</StreetName><StreetSuffix>DR</StreetSuffix><StreetAddress1>869 BEAVER DR</StreetAddress1><City>DUBOIS</City><State>PA</State><Zip5>15801</Zip5><Zip4>2511</Zip4><PostalCode>15801</PostalCode><StateCityZip>PA                                       DUBOIS</StateCityZip><FaxNumber>8143716504</FaxNumber><PhoneNumber>8143716501</PhoneNumber></ProviderPracticeAddress><ProviderTaxonomies><ProviderTaxonomies><PrimaryTaxonomy>Y</PrimaryTaxonomy><SelectedTaxonomyCode>207VM0101X</SelectedTaxonomyCode><Type>Allopathic &amp; Osteopathic Physicians</Type><Classification>Obstetrics &amp; Gynecology</Classification><Specialization>Maternal &amp; Fetal Medicine</Specialization><LicenseNumber>MD433961</LicenseNumber><State>PA</State></ProviderTaxonomies></ProviderTaxonomies></NPIRecord>

  Scenario: @ProviderProfile_GlobalsTrue_DEA
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_DEA.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/DEARecords[1]/DEARecord[1] == <DEARecord><Address><StreetNumber>1</StreetNumber><StreetName>ROBERT WOOD JOHNSON</StreetName><StreetSuffix>PL</StreetSuffix><StreetAddress1>1 ROBERT WOOD JOHNSON PL</StreetAddress1><City>NEW BRUNSWICK</City><State>NJ</State><Zip5>08901</Zip5><Zip4>1928</Zip4><PostalCode>08901</PostalCode><LegacyLocationId>4762752</LegacyLocationId><LegacyAggregateId>4762751</LegacyAggregateId><VanityCity>NEW BRUNSWICK</VanityCity></Address><BusinessActivityCode>C</BusinessActivityCode><BusinessActivityCodeDesc>Practitioner</BusinessActivityCodeDesc><BusinessActivitySubCode>0</BusinessActivitySubCode><BusinessActivitySubCodeDesc>Practitioner</BusinessActivitySubCodeDesc><XDEAIndicator>0</XDEAIndicator><ExpirationDate><Year>2025</Year><Month>12</Month><Day>31</Day></ExpirationDate><DEANumber>FO4163440</DEANumber><DrugSchedule>22N 33N 4 5</DrugSchedule><Status>1</Status><Name><Full>ANUPAM                                    OHRI</Full><First>ANUPAM</First><Last>OHRI</Last></Name></DEARecord>

  Scenario: @ProviderProfile_GlobalsTrue_UPIN
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_UPIN.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UPINs[1]/UPIN[1]/ProviderName[1]/Full[1] == 'DAVID B. PEISNER'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UPINs[1]/UPIN[1]/ProviderName[1]/First[1] == 'DAVID'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UPINs[1]/UPIN[1]/UPIN[1] == 'A60312'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/UPINs[1]/UPIN[1]/LNPID[1] == '1120804'

  Scenario: @ProviderProfile_GlobalsTrue_Taxonomy
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_Taxonomy.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/Taxonomies[1] == <Taxonomies><Taxonomy><Code>2084P0800X</Code><Type>Allopathic &amp; Osteopathic Physicians</Type><Classification>Psychiatry &amp; Neurology</Classification><Specialization>Psychiatry</Specialization><PrimaryIndicator>Y</PrimaryIndicator></Taxonomy><Taxonomy><Code>200000000X</Code><Type>Allopathic &amp; Osteopathic Physicians</Type></Taxonomy></Taxonomies>

  Scenario: @ProviderProfile_GlobalsTrue_MedSchool
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_MedSchool.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/MedSchools[1] == <MedSchools><MedSchool><SchoolName>LOUISIANA STATE UNIVERSITY / SCHOOL OF MEDICINE IN NEW ORLEANS</SchoolName></MedSchool><MedSchool><SchoolName>LOUISIANA STATE UNIVERSITY / ALEXANDRIA CAMPUS</SchoolName></MedSchool><MedSchool><SchoolName>STATE UNIVERSITY OF NEW YORK / HEALTH SCIENCE CENTER AT BROOKLYN / COLLEGE OF MEDICINE</SchoolName><GraduationYear>1991</GraduationYear></MedSchool><MedSchool><SchoolName>CRIMEA MEDICAL INSTITUTE</SchoolName><GraduationYear>1991</GraduationYear></MedSchool><MedSchool><SchoolName>UNIVERSITY OF RAJASTHAN / SAWAI MAN SINGH MEDICAL COLLEGE</SchoolName></MedSchool></MedSchools>

  Scenario: @ProviderProfile_GlobalsTrue_Medicaid
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_Medicaid.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/MedicaidRecords[1] == <MedicaidRecords><MedicaidRecord><State>VT</State><Number>1019824</Number><Status>ACTIVE</Status></MedicaidRecord></MedicaidRecords>

  Scenario: @ProviderProfile_GlobalsTrue_CSR
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_CSR.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/StateControlledSubstanceRecords[1]/StateControlledSubstanceRecord[1]/CSRNumber[1] == 'DR-0011487'

  Scenario: @ProviderProfile_GlobalsTrue_ABMS
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_ABMS.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/ABMSRecords[1]/ABMSRecord[1] == <ABMSRecord><BoardCode>15</BoardCode><BoardName>Psychiatry &amp; Neurology</BoardName></ABMSRecord>

  Scenario: @ProviderProfile_GlobalsTrue_MedicareEnrollment
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_MedicareEnrollment.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/MedicarePartDEnrollments[1] == <MedicarePartDEnrollments><MedicarePartDEnrollment><NPI>1326332339</NPI><Name><Full>Kathleen Effler</Full><First>Kathleen</First><Last>Effler</Last></Name><EffectiveDate><Year>2016</Year><Month>08</Month><Day>01</Day></EffectiveDate><OptOutFlag>N</OptOutFlag></MedicarePartDEnrollment></MedicarePartDEnrollments>

  Scenario: @ProviderProfile_GlobalsTrue_MedicareEnrollment
    Given url baseUrlProviderReport
    And request read('classpath:DataFiles/ProviderProfile_GlobalsTrue_MedicareOrderReferring.xml')
    When method POST
    Then status 200
    And print response
    * assert responseTime < 500000
    * def RecCount = /Envelope/Body/ProviderReportResponseEx/response/RecordCount[1]
    * assert RecCount >= '0'
    * match /Envelope/Body/ProviderReportResponseEx/response/Providers[1]/Provider[1]/MedicarePartBOrderingAndReferringRecords[1] == <MedicarePartBOrderingAndReferringRecords><MedicarePartBOrderingAndReferringRecord><Name><Full>MS KATHLEEN EFFLER</Full><First>KATHLEEN</First><Last>EFFLER</Last><Prefix>MS</Prefix></Name><OrderingReferringIndicator>Y</OrderingReferringIndicator></MedicarePartBOrderingAndReferringRecord></MedicarePartBOrderingAndReferringRecords>




















