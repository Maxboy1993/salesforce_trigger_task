/**
 * Created by User on 09.09.2020.
 */

public with sharing class AccountTaskCreator {

    @InvocableMethod(label='Creat Task' category='Account')
    public static void createTask(List<variables> vars) {
        List<Account> accounts = new List<Account>();
        List<Task> tasks = new List<Task>();
        for (variables var : vars) {
            accounts.add(new Account(Id = var.Id, Name = var.Name));
        }

        for (Account acc : accounts) {
            Task createdTask = new Task();
            createdTask.WhatId = acc.Id;
            createdTask.Subject = 'Negotiations with ' + acc.Name;
            tasks.add(createdTask);
        }
        insert tasks;
    }

    public class variables {
        @InvocableVariable(required=true)
        public String Id;
        @InvocableVariable(required=true)
        public String Name;
    }

}