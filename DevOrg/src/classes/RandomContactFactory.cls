public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        List<Contact> conts = new List<Contact>();
        for(Integer i = 0; i < numContacts; i++){
            Contact cont = new Contact(LastName = lastName + ' ' + i);
            conts.add(cont);
        }
        return conts;
    }
}