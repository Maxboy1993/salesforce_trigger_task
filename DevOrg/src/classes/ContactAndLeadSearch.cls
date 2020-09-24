public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String word){
       List<List<sObject>> searchList = [FIND :word IN ALL FIELDS 
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
return searchList;
    }
}