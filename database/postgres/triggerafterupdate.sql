create table college_student(
	id int primary key,
	name varchar(50),
	age int,
	email varchar(100)
);
select * from college_student;

create table college_audit(
	id int primary key,
	audit_description text
)

select * from college_audit;

CREATE OR REPLACE FUNCTION audit_description()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO college_audit (id,audit_description) 
    VALUES (2,'A new row is inserted ' || to_char(NOW(), 'DD MM YY HH:MI:SS PM'));
    RETURN NULL;  -- Returning NULL because the trigger is an AFTER trigger and does not modify the data
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER afterinserttable
AFTER INSERT ON college_student
FOR EACH ROW
EXECUTE FUNCTION audit_description();
INSERT INTO college_student (id, name, age, email) VALUES (2, 'John', 20, 'john01@yopmail.com');