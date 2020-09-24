trigger ClosedOpportunityTrigger on Opportunity (after  insert, after  update) {
    List<Task> taskList = new List<Task>();
    for(Opportunity opp: Trigger.new){//[SELECT ID FROM Opportunity WHERE StageName = 'Closed Won']){
        if(opp.StageName=='Closed Won'){
            taskList.add(new Task(WhatId =  opp.Id, Subject = 'Follow Up Test Task'));
        }
                           
    }
    if(!taskList.isEmpty()){
         insert taskList;
    }
   
}