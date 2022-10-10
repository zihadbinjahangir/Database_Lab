REM   Script: Blood Donation
REM   Blood donation system

create table Users( 
    user_id integer not null, 
    name varchar(20) not null, 
    email varchar(30) not null, 
    password varchar(10) not null, 
    location_id integer not null, 
    primary key(user_id) 
    );

create table Donor( 
    donor_id integer not null, 
    name varchar(20) not null, 
    email varchar(30) not null, 
    password varchar(10) not null, 
    phone varchar(10) not null, 
    blood_group varchar(3) not null, 
    age numeric(2) not null check (age >= 18), 
    location_id integer not null, 
    primary key(donor_id) 
    );

create table Location( 
    location_id integer not null, 
    name varchar(20) not null,  
    primary key(location_id) 
    );


create table Blood_group( 
    blood_id integer not null, 
    blood_group varchar(3) not null,  
    donor_id integer not null,
    primary key(blood_id),
    foreign key(donor_id) references Donor(donor_id)
    );


create table Blood_request(
    request_id integer not null,
    user_id integer not null,
    blood_id integer not null,
    location_id integer not null,
    primary key(request_id),
    foreign key(user_id) references Users(user_id),
    foreign key(location_id) references Location(location_id),
    foreign key(blood_id) references Blood_group(blood_id)
);


insert into Users values(1,'A','abcd@com','1234',1);
insert into Users values(2,'B','abce@com','1234',1);
insert into Users values(3,'C','abcf@com','1234',2);
insert into Users values(4,'D','abcg@com','1234',2);
insert into Users values(5,'E','abch@com','1234',3);
insert into Users values(6,'F','abci@com','1234',3);

insert into Donor values(1,'G','abcj@com','1234','013333','A+',20,1);
insert into Donor values(2,'H','abck@com','1234','013333','B+',21,1);
insert into Donor values(3,'I','abcl@com','1234','013333','A+',25,2);
insert into Donor values(4,'J','abcm@com','1234','013333','AB+',30,2);
insert into Donor values(5,'K','abcn@com','1234','013333','AB+',18,3);
insert into Donor values(6,'L','abcp@com','1234','013333','B+',29,3);

insert into Location values(1,'Dhaka');
insert into Location values(2,'Khulna');
insert into Location values(3,'Barisal');

insert into Blood_group values(1,'A+',1);
insert into Blood_group values(2,'B+',2);
insert into Blood_group values(3,'A+',3);
insert into Blood_group values(4,'AB+',4);
insert into Blood_group values(5,'AB+',5);
insert into Blood_group values(6,'B+',6);

insert into Blood_request values(1,1,1,1);
insert into Blood_request values(2,2,3,2);
insert into Blood_request values(3,3,2,3);
insert into Blood_request values(4,4,2,3);
insert into Blood_request values(5,5,2,3);


select * from users


select Donor.name from Donor, Blood_group where Blood_group.donor_id = Donor.donor_id;


select Donor.name, Donor.phone, Donor.blood_group from Blood_group,Donor where Blood_group.blood_group = Donor.blood_group;


alter table Donor add location_name varchar(10);

select * from Donor;

update Donor set location_name = 'Dhaka' where location_id =1;
update Donor set location_name = 'Khulna' where location_id =2;
update Donor set location_name = 'Barisal' where location_id =3;
update Donor set location_name = 'Dhaka' where location_id =4;
update Donor set location_name = 'Khulna' where location_id =5;
update Donor set location_name = 'Barisal' where location_id =6;

select * from Donor;


describe Donor;


alter table Donor rename column location_name to address;


select * from Donor;


select name, age, address from Donor order by age;


select name, blood_group, age, address from Donor order by blood_group;


select count(blood_group) from Donor;


 select avg(age), blood_group from Donor group by blood_group;


 select max(age) from Donor;


 select min(age) from Donor;


select age,name from donor where donor.age <= 30 and donor.age >=20;


select users.name as user_name, users.email from users, blood_request where users.user_id = blood_request.user_id;


select Donor.name, Donor.phone, Donor.blood_group from Blood_group,Donor where Blood_group.blood_group = Donor.blood_group;


create view donor_view as select donor_id, name, age, address as location from donor;


select name, age, location from donor_view order by age;


select avg(age), location from donor_view group by location ;


drop view donor_view;


select Blood_group.blood_group, Donor.name from Blood_group join donor on Blood_group.donor_id=Donor.donor_id;


select Blood_group.blood_group, Donor.name from Blood_group left join donor on Blood_group.donor_id=Donor.donor_id;


select Blood_group.blood_group, Donor.name from Blood_group right join donor on Blood_group.donor_id=Donor.donor_id;


select Blood_group.blood_group, Donor.name from Blood_group full outer join donor on Blood_group.donor_id=Donor.donor_id;


