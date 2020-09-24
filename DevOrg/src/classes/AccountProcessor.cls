public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(List<Id> listAccountId){
        List<Account> accounts = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : listAccountId];
        Integer contactCounter = 0;
        
        for(Account acc : accounts){
            List<Contact> listContatcts = acc.contacts;
            acc.Number_Of_Contacts__c = listContatcts.size();
            }
            update accounts;
        }
    }