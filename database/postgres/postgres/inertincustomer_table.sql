INSERT INTO customer(
	first_name, 
	last_name,
	email,
	company,
	street,
	city,
	state,
	zip,
	phone,
	birth_date,
	sex,
	date_entered
)
VALUES(
	'John','Doe',
	'johndoe@yopmail.com',
	'BP',
	'347 sedar st',
	'lawrenceville',
	'GA',
	'30044',
	'348-848-8491',
	'1996-09-16',
	'M',
	current_timestamp);