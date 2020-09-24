/**
 * Created by User on 13.09.2020.
 */

global with sharing class SyncContactByBatchJob implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        [
                SELECT Id, BillingAddress, Updated_By_Contact__c, (
                        SELECT FirstName, LastName, Is_Synced__c, MailingAddress
                        FROM Contacts
                        WHERE Is_Synced__c = FALSE
                )
                FROM Account
        ]
        );
    }

    global void execute(Database.BatchableContext bc, List<Account> accounts) {
        List<Contact> contactsList = new List<Contact>();
        for (Account acc : accounts) {
            for (Contact cont : contactsList) {
                if (acc.Id == cont.AccountId) {
                    cont.Is_Synced__c = true;
                    cont.MailingCity = acc.BillingCity;
                    cont.MailingCountry = acc.BillingCountry;
                    cont.MailingPostalCode = acc.BillingPostalCode;
                    cont.MailingState = acc.BillingState;
                    cont.MailingStreet = acc.BillingStreet;
                }
            }
            acc.Updated_By_Contact__c = true;
        }
        update contactsList;
    }
    global void finish(Database.BatchableContext bc) {
    }
}