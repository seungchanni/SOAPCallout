@isTest
public with sharing class AccountManagerTest {
    @isTest static void testAccountManager() {
        Id recordId = createTestRecord();
        
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/conatacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account thisAccount = AccountManager.getAccount();

        System.assert(thisAccount != null);
        System.assertEquals(recordId, thisAccount.Id );
    }

	static Id createTestRecord(){
        Account accountTest = new Account(Name ='Test record');
		insert accountTest;
        return accountTest.Id;
	} 
}