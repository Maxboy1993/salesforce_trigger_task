@isTest
private class TestVerifyDate {
    //1
    @isTest static void testCheckDatesWhithin30Days(){
        Date date1 = Date.newInstance(2020, 9, 10);
        Date date2 = Date.newInstance(2020, 9, 15);
        Date actual = VerifyDate.CheckDates(date1, date2);
        Date expected = date2;
         System.assertEquals(expected, actual);
    }
          
    @isTest static void testCheckDatesMoreThan30Days(){
        Date date1 = Date.newInstance(2020, 9, 10);
        Date date2 = Date.newInstance(2020, 10, 15);
        Date actual = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2020, 9, 30) ;
         System.assertEquals(expected, actual);
    }
    
    @isTest static void testCheckDatesDate2LessThanDate1(){
        Date date1 = Date.newInstance(2020, 9, 10);
        Date date2 = Date.newInstance(2020, 9, 5);
        Date actual = VerifyDate.CheckDates(date1, date2);
        Date expected = Date.newInstance(2020, 9, 30) ;
         System.assertEquals(expected, actual);
    }  
    
}