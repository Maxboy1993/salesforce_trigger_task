public class AccountHandler {
    public static Account insertNewAccount(String name){
        Account acc = new Account(Name = name);
        try{
            insert acc;
        }catch (Exception e){
            return null;
        }
        return acc;
    }
}