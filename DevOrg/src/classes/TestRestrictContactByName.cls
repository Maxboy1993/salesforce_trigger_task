@isTest
public class TestRestrictContactByName {

    @isTest static void TestNewOrUpdatedContatctWithWrongLastName() {
        Contact contact = new Contact(LastName = 'INVALIDNAME');
        insert contact;
        
         Test.startTest();
        Database.SaveResult result = Database.insert(contact);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }
    
     @isTest static void TestNewOrUpdatedContatctWithCorrectLastName() {
        Contact contact = new Contact(LastName = 'SomeLastName');
        insert contact;
        
         Test.startTest();
        Database.SaveResult result = Database.insert(contact);
        Test.stopTest();
        
        System.assert(result.isSuccess());
        System.assert(result.getErrors().isEmpty());
    }

}