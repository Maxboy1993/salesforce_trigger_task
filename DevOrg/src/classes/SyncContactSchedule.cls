/**
 * Created by User on 13.09.2020.
 */

public with sharing class SyncContactSchedule implements Schedulable {

    public void execute(SchedulableContext param1) {
        SyncContactByBatchJob syncContactByBatchJob = new SyncContactByBatchJob();
        Id batchId1 = Database.executeBatch(syncContactByBatchJob);

        SyncContactByBatchJobIterable syncContactByBatchJobIterable = new SyncContactByBatchJobIterable();
        Id batchId2 = Database.executeBatch(syncContactByBatchJobIterable);
    }
}