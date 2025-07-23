USE student_housing;
SELECT contract_id,
       student_id,
       room_id,
       end_date
FROM Contracts
WHERE end_date
  BETWEEN CURRENT_DATE()
       AND DATE_ADD(cURRENT_DATE(), INTERVAL 30 DAY);