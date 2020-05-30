create database OnlineBanking

drop database OnlineBanking






create table account_type(
	id int primary key identity(1020,2),
	account_type_name varchar(20) NOT NULL
	);

create table branch(
	id varchar(20) primary key,
	branch_name varchar(20) NOT NULL
	);

create table customer(
	id int primary key identity(1010,1),
	customer_name varchar(20) NOT NULL,
	fathers_name varchar(20) NOT NULL,
	date_of_birth DateTime NOT NULL,
	customer_age int NOT NULL,
	martial_status varchar(10),
	customer_address varchar(100) NOT NULL,
	customer_city varchar(20) NOT NULL,
	customer_state varchar(20) NOT NULL,
	customer_country varchar(20) NOT NULL,
	pincode int NOT NULL,
	phone bigint NOT NULL,
	email_id varchar(50)

);


create table account(
	account_no bigint primary key identity(110010001111,1),
	debit_card_no bigint NOT NULL,
	branch_id varchar(20) NOT NULL,
	foreign key (branch_id) references branch (id),
	account_type_id int NOT NULL ,
	foreign key (account_type_id) references account_type (id),
	customer_id int,
	foreign key (customer_id) references customer (id),
	balance bigint NOT NULL,
	check_book_id varchar(10)

	);

create table user_details(
	id int primary key identity(100,1),
	user_name varchar(20) NOT NULL,
	user_password varchar(20)  NOT NULL,
	account_no bigint,
	foreign key (account_no) references account (account_no)
	

);



create table transaction_details(
		id int primary key identity(1050,1),
		from_account_no bigint NOT NULL ,
		foreign key (from_account_no) references account (account_no),
		ToAccountNo bigint NOT NULL,
		debit_amount int,
		credit_amount int,
		transaction_date DateTime NOT NULL,
		transaction_description varchar(50),
	);