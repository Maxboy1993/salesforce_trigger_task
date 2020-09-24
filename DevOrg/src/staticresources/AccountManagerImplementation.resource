@RestResource(urlMapping='/Account/*')
global with sharing class AccountManagerImplementation {
    @HttpGet
    global static Account getAccountById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        Account result =  [SELECT Id, Name, phone 
                        FROM Account
                        WHERE Id = :accountId];
        return result;
    }
    
    @HttpPost
    global static ID createAccount(String accountName, String accontPhone) {
        Account thisAccount = new Account(Name=accountName, Phone = accontPhone);
        insert thisAccount;
        return thisAccount.Id;
    }   
    
    @HttpDelete
    global static void deleteAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account thisAccount = [SELECT Id FROM Account WHERE Id = :accountId];
        delete thisAccount;
    }
    
    @HttpPut
    global static ID upsertAccount(String accountName, String id, , String accontPhone) {
        Account thisAccount = new Account(
                Id=id,
                Phone = accontPhone,
                Name=accountName);
        // Match Account by Id, if present.
        // Otherwise, create new Account.
        upsert thisAccount;
        // Return the case ID.
        return thisAccount.Id;
    }
    
    @HttpPatch
    global static ID updateAccountFields() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Account thisAccount = [SELECT Id FROM Account WHERE Id = :accountId];
        // Deserialize the JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            thisAccount.put(fieldName, params.get(fieldName));
        }
        update thisAccount;
        return thisAccount.Id;
    }    
}