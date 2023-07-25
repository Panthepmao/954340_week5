use coffee_shop;

drop procedure if exists coffee;
delimiter //
create procedure coffee()
begin
	declare sql_error int default false;
    
    declare continue handler for sqlexception
		set sql_error = true;
        
	start transaction;
    
    insert into orders values (3, "2023-07-25", "15:00:04", 1);
    insert into order_details values (3, "150%", 4, 1, 2, 1);
    
    if sql__eror = false then commit;
		select 'The transaction was commited.';
    else rollback;
		select 'The transaction was rolled back.';
	end if;
end//
delimiter ;
call coffee();

select * from orders;


select  member_name,coffee_sweatness,count(coffee_sweatness) 
from members join orders using(member_id) 
join order_details using(order_id)
group by coffee_sweatness , member_name;
