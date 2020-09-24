public with sharing class AccountTriggerHandler {
	 public static boolean isTriggerExecuted = false;
    
    public static void addContact(List<Account> records){
        List<Id> accountsId  = new List<Id>();     
        for(Account acc : records){
            accountsId.add(acc.Id);
        }
        
        List<Contact> contactList = new List<Contact>();
        List<Account> accounts = [SELECT ID, Name FROM Account  WHERE ID IN :accountsId AND ID NOT IN (SELECT AccountId FROM Contact)];
        
        Integer i = 0;
        for(Account acc: accounts){
            i++;
           contactList.add(new Contact(LastName = 'name ' + i, AccountId = acc.Id));
        }
        
        if(!contactList.isEmpty()){
          insert contactList;   
        }
    }
}