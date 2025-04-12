## Account-Activity-Tracker

# Project Overview:

When a Contact is created, it will automatically update the Account's Last Activity Date to today’s date.
This ensures that the Account's last interaction is always updated whenever a new Contact is added.

# Step 1: Create the Trigger
This trigger fires after Contacts are inserted. It calls the method updateAccountLastActivity from the ContactTriggerHandler class, passing the newly inserted records.
# Step 2: Create the Handler Class
The updateAccountLastActivity method collects the Account Ids from the newly inserted Contacts.
It then queries the Account records related to those Contact records.
The method updates the Last_Activity_Date__c field of the related Account to today’s date, indicating the most recent activity.
# Step 3: Custom Field in Account Object
One need to create a custom field in the Account object called Last_Activity_Date__c (Date type). This will store the date of the last interaction.
Go to Setup in Salesforce.
Under Object Manager, search for Account.
Go to Fields & Relationships, and create a new field of type Date.
Name it Last Activity Date.
# Step 4: Testing
One can test this project by creating a new Contact related to an Account in Salesforce. After the Contact is inserted, the Account's Last_Activity_Date__c field will be automatically updated with today’s date.
The steps to test are:
1.Create a new Contact in Salesforce.
   Go to the Contacts tab and click New.
   Choose an existing Account or create a new one.
   Fill out the necessary fields and save the Contact.
2.Check the Account:
   Go to the Account record associated with the Contact.
   The Last_Activity_Date__c field should reflect today’s date.
# Optional Step 5: Create a Test Class
To ensure the trigger and handler work properly, one can create a simple Apex test class.
This test class creates a test Account and a test Contact related to that Account. After inserting the Contact, it checks if the Last Activity Date field of the Account was updated to today's date.
