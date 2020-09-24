@isTest
private class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
           for (Integer i=0;i<200;i++) {
                Lead led = new Lead();
            led.FirstName ='FirstName ' + i;
            led.LastName ='LastName '+ i;
            led.Company ='demo ' + i;
            leads.add(led);
        }
        insert leads;
              }
    
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Web']);
    }
    
}