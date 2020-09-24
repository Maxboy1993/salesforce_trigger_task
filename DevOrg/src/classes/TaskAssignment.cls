/**
 * Created by User on 11.09.2020.
 */

public with sharing class TaskAssignment {
    @InvocableMethod(label='Assign Task' category='Account')
    public static void assignTask(List<variables> vars) {
        List<Task> accountLinkedTasks = new List<Task>();
        List<User> users = [SELECT Id FROM User];
        Id accountId = vars[0].Id;
        Integer counter = 0;
        for (Task task : [SELECT WhatId FROM Task]) {
            if (accountId == task.WhatId) {
                accountLinkedTasks.add(task);
                counter++;
            }
        }
        if (counter > 3) {
            Integer userNumber = Integer.valueOf((Math.random() * users.size() - 1));
            for (Task t : accountLinkedTasks) {
                t.OwnerId = users.get(userNumber).Id;
            }
            update accountLinkedTasks;
        }
    }
    public class variables {
        @InvocableVariable(required=true)
        public String Id;
    }
}