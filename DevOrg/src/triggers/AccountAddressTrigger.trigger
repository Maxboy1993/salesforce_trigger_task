trigger AccountAddressTrigger on Account (before insert) {
    for(Account acc : Trigger.new ){
        if(acc.Match_Billing_Address__c == true && acc.BillingPostalCode != null){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}