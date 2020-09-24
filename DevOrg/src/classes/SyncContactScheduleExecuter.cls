/**
 * Created by User on 13.09.2020.
 */

public with sharing class SyncContactScheduleExecuter {
    public static void executeSchedule() {
        String sch = '0 30 0 * *';
        SyncContactSchedule syncContactSchedule = new SyncContactSchedule();
        String jobID = System.schedule('SyncContactSchedule', sch, (Schedulable) syncContactSchedule);
    }
}