@isTest
public class ContactTriggerHandlerTest {
    
    @isTest
    public static void testUpdateAccountLastActivity() {
        // Create a test Account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        // Create a test Contact related to the test Account
        Contact testContact = new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount.Id);
        insert testContact;
        
        // Retrieve the updated Account
        testAccount = [SELECT Last_Activity_Date__c FROM Account WHERE Id = :testAccount.Id];
        
        // Assert that the Last Activity Date is updated
        System.assertEquals(Date.today(), testAccount.Last_Activity_Date__c, 'The Last Activity Date should be today');
    }
}
