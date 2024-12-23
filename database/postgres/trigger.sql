create table passenger(
	id int primary key,
	name varchar(50),
	address text,
	charges int
);
select * from passenger;

insert into passenger(id,name,address,charges) 
values(2,'Jack','Bengaluru',7000);

CREATE OR REPLACE FUNCTION deduct_charges()
RETURNS TRIGGER AS $$
BEGIN
    NEW.charges := NEW.charges - 2000;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER flight
BEFORE INSERT
ON passenger
FOR EACH ROW
EXECUTE FUNCTION deduct_charges();

