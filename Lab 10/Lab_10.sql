--Victoria Confeiteiro
--Lab 10 Yay!
--April 17, 2017

create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
	course_Num int	:=$1;
	resultset REFCURSOR	:=$2;
begin
	open resultset for
		select preReqNum
		from Prerequisites
		join courses on courses.num = Prerequisites.courseNum
		where Prerequisites.courseNum = course_Num;
	return resultset;
end;
$$
language plpgsql; 

select PreReqsFor(308, 'results');
Fetch all from results;

create or replace function IsPreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
	course_Num int	:=$1;
	resultset REFCURSOR	:=$2;
begin
	open resultset for
		select courseNum
		from Prerequisites
		where Prerequisites.preReqNum = course_Num;
	return resultset;
end;
$$
language plpgsql; 

select IsPreReqsFor(308, 'results');
Fetch all from results; 

