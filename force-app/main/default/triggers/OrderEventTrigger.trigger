trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasksToCreate = new List<Task>();
    
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            Task newTask = new Task(
                Priority = 'Medium',
                Subject = 'Follow up on shipped order 105',
                OwnerId = event.CreatedById
            );
            tasksToCreate.add(newTask);
        }
    }
    
    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}