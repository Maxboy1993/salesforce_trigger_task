trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    // Get the related opportunities for the accounts in this trigger
    for (Account a: [SELECT Id,Name FROM Account
                     WHERE Id IN :Trigger.New AND
                       Id NOT IN (SELECT AccountId FROM Opportunity)]){
                          oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                       StageName='Prospecting',
                                        Discount_Percent__c = 20,
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=a.Id)); 
                       }
    if (oppList.size() > 0) {
        insert oppList;
    }
}