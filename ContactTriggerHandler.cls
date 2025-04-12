public class ContactTriggerHandler {
    
    // Method to update the Account's last activity date when a new Contact is created
    public static void updateAccountLastActivity(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        // Collect unique Account IDs from the new Contacts
        for (Contact con : newContacts) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }
        
        // Query the related Account records
        List<Account> accountsToUpdate = [SELECT Id, Last_Activity_Date__c FROM Account WHERE Id IN :accountIds];
        
        // Update the Last_Activity_Date__c field to today's date
        for (Account acc : accountsToUpdate) {
            acc.Last_Activity_Date__c = Date.today();
        }
        
        // Update the Accounts in Salesforce
        if (!accountsToUpdate.isEmpty()) {
            try {
                update accountsToUpdate;
                System.debug('Updated Account Last Activity Date');
            } catch (DmlException e) {
                System.debug('Error updating Account: ' + e.getMessage());
            }
        }
    }
}
