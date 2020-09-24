@IsTest
private class AccountProcessorTest {
@IsTest
  private static void countContactsTest() {
      Account account = new Account();
      account.Name = 'Test acc';
      insert account;
      
      Contact contact1 = new Contact();
      contact1.FirstName = 'Roy';
      contact1.LastName = 'Jhonson';
      contact1.AccountId = account.Id;
      insert contact1;
      
      Contact contact2 = new Contact();
      contact2.FirstName = 'Den';
      contact2.LastName = 'Metty';
      contact2.AccountId = account.Id;
      insert contact2;
      
      List<Id> accountIds = new List<Id>();
      accountIds.add(account.Id);
 
      Test.startTest();
      AccountProcessor.countContacts(accountIds);
      Test.stopTest();
      
      Account resultAcc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id =: account.Id LIMIT 1];
      System.assertEquals ( Integer.valueOf(resultAcc.Number_of_Contacts__c) ,2);
  }
}