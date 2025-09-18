use mydb;
-- drop table user;

create table users(
  user_id int primary key auto_increment,
  username varchar(100) not null,
  email varchar(50) unique,
  phone_no bigint,
  is_valid boolean default false,
  address text,
  birthdate date 
 );
 
 insert into users(username,email,phone_no,address,birthdate)
   values("sarthak","sarthak@gmail.com",8459360294,"at post morve khndala satara",'2004-10-23'),
		 ("krushna","krushna@gmail.com",8459360295,"at post morve khndala satara india",'2004-11-23');
         
select * from users;
        
create table books(
  book_id int primary key,
  book_name varchar(255) not null,
  author varchar(100),
  price decimal(8,2) ,
  is_available boolean not null
);

insert into books(book_id,book_name,author,price,is_available)
   values(101,"shamchi aai","sane guruji",400.50,true),
         (102,"gitanjali","Rabindranath Tagore",3000.25,true),
         (103,"Malgudi Days","R.K. Narayan",40343.26,true),
         (104,"A Suitable Boy","Vikram Seth",4343.26,true);
         

create table purchase(
 transaction_id varchar(12) primary key,
 b_id int,
 u_id int,
 foreign key(b_id) references books(book_id),
 foreign key(u_id) references users(user_id)
);

insert into purchase(transaction_id,b_id,u_id)
     values("AGSA5AS7A",101,1);

select * from purchase;

-- get the error if forign key is not a primary key in another table
-- CREATE table buys(
-- b_id int primary key,
-- buyed_user varchar(100),
-- foreign key(buyed_user) references users(username)
-- );
        