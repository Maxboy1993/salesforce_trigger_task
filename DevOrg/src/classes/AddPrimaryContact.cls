public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact cont, String st){
        this.contact = cont;
        this.state = st;
    }
    
    public void execute(QueueableContext context) {
       List<Account> accounts = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE BillingState =: state LIMIT 200];
        List<Contact> contList = new List<Contact>();
        for(Account acc : accounts){
            Contact c = contact.clone();
             c.AccountId =  acc.id;
            contList.add(c);
        }
        if(contList.size() > 0){
            insert contList;
        }
    }
}