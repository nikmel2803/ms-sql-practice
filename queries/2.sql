Select * FROM Complaint WHERE Classroom IN (SELECT ID FROM Classroom WHERE Building = 1)