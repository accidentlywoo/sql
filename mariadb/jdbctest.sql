CREATE TABLE role(
	role_id int PRIMARY KEY,
	description VARCHARACTER(20)
);

desc role;

INSERT INTO role VALUES ( 1, 'Will' );
INSERT INTO role VALUES ( 2, 'Marry' ); 
INSERT INTO role VALUES ( 3, 'Dean' );

select * from role;