/**
 * Created by User on 13.09.2020.
 */

public with sharing class SyncContactByQueuebleJob implements Queueable {
    public void execute(QueueableContext context) {
        List<Contact> contactsList = new List<Contact>();
        for (Account acc : [
                SELECT Id, BillingAddress, (
                        SELECT FirstName, LastName, Is_Synced__c, Processed_By_Future__c
                        FROM Contacts
                )
                FROM Account
        ]) {
            if (acc.BillingAddress != null) {
                contactsList.add(acc.Contacts);
            }
        }
        if (!contactsList.isEmpty()) {
            for (Contact cont : contactsList) {
                cont.Is_Synced__c = false;
                cont.Processed_By_Future__c = true;
            }
            update contactsList;
        }
    }
}