trigger AccountTrigger on Account (after insert, after update) {
	
    if(!AccountTriggerHandler.isTriggerExecuted){
        AccountTriggerHandler.isTriggerExecuted = true;
        AccountTriggerHandler.addContact(Trigger.new);
    }
}