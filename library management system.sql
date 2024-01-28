create database if not exists library_management_system;
use library_management_system;
create table author(
author_id int primary key,
author_name varchar(70)
);
create table book(
book_id int primary key,
book_name varchar(100),
published_year int not null,
isbn int unique not null,
author_id int,
foreign key(author_id) references author(author_id)
on delete cascade
on update cascade
);
create table borrower(
borrower_id int primary key,
first_name varchar(30),
last_name varchar(30),
borrower_email varchar(70)
);
create table loan(
loan_id int primary key,
book_id int ,
borrower_id int,
loan_date date,
return_date date,
foreign key(book_id) references book(book_id),
foreign key(borrower_id) references borrower(borrower_id)
on update cascade
on delete cascade
);
insert into author
(author_id, author_name)
values
(1, "chetan bhagat"),
(2, "balwant gargi"),
(3, "v.s. naipaul"),
(4, "satish gujral"),
(5, "nirad c. chaudhary"),
(6, "L.K. Advani"),
(7, "gita mehta"),
(8, "jaswant singh"),
(9, "H.S. Vatsyayan"),
(10, "Amit chaudhary"),
(11, "Vikram seth"),
(12, "Anita desai"),
(13, "rabindranath tagore"),
(14, "kushwant singh"),
(15, "maithili saran gupt"),
(16, "sarojni naidu"),
(17, "amrita pritam"),
(18, "prem chand"),
(19, "R.K. Narayan"),
(20, "Satyajeet ray");
select* from author;
alter table book
modify isbn bigint not null;
insert into book
(book_id, book_name, published_year, isbn, author_id)
values
(1, "one indian girl", 2016, 978132678943, 1),
(2, "five point someone", 2004, 9788129121387, 1),
(3, "a suitable boy", 1993, 4859503058532, 11),
(4, "train to pakistan", 1956, 5720465820573, 14),
(5, "two states", 2009, 8365939475639, 1),
(6, "the guide", 1958, 8374920479477, 19),
(7, "A house for mr. biswas", 1961, 4829465923576, 3),
(8, "in custody", 1984, 6849679375567, 12),
(9, "delhi: a novel", 1990, 6783057869365, 14),
(10, "a bend in the river", 1979, 4658395738657, 3),
(11, "a suitable girl", 2024, 8395639567205, 11),
(12, "loha kutt", 1940, 8674658395678, 2),
(13, "a maverick heart", 2018, 9375783758396, 4),
(14, "a river sutra", 1993, 8465780348673, 7),
(15, "my take", 2006, 5673956784936, 6),
(16, "neela ankh", 1965, 9465782349856, 2),
(17, "defending india", 1999, 856378694356, 8),
(18, "my country my life", 2008, 4562975939567, 6),
(19, "the immortals", 2009, 7573975684793, 10),
(20, "tatsat", 1940, 8576483967843, 9),
(21, "godan", 1936, 759374939753, 18),
(22, "The Golden Threshold", 1905, 7564896738519, 16),
(23, "afternoon raag", 1993, 165783564829, 10),
(24, "gaban", 1931, 6578493675813, 18),
(25, "Joy Baba Felunath", 1979, 7684975679457, 20),
(26, "rang me bhang", 1917, 8736589469056, 15),
(27, "nirmala", 1928, 9405673856835, 18),
(28, "Sonar Kella", 1971, 4675839056739, 20),
(29, "Gandhi Ke Baare Mein", 1948, 4780946728945, 15),
(30, "The Autobiography of an Unknown Indian", 1951, 6737568406712, 5),
(31, "geetanjali", 1910, 465787609846, 13),
(32, "dr. dev", 1960, 4563719056737, 17);
insert into borrower
(borrower_id, first_name, last_name, borrower_email)
values
(1, "varnika", "khandelwal", "varnika@gmail.com"),
(2, "tanu", "sharma", "tanu00@gmail.com"),
(3, "neha", "mishra", "neha@gmail.com"),
(4, "arjun", "gandhi", "arjun@gmail.com"),
(5, "vikas", "sharma", "vikas@gmail.com"),
(6, "aaditya", "rawat", "aaditya@gmail.com"),
(7, "vani", "gupta", "vani@gmail.com");
select* from loan;
insert into loan
(loan_id, book_id, borrower_id, loan_date, return_date)
values
(1, 14, 4, "2024-01-06", "2024-02-06"),
(2, 12, 5, "2024-01-09", "2024-03-09"),
(3, 17, 3, "2024-01-11", "2024-03-11"),
(4, 14, 7, "2024-01-25", "2024-02-25"),
(5, 23, 2, "2024-01-22", "2024-02-22"),
(6, 32, 1, "2024-01-16", "2024-02-16"),
(7, 18, 7, "2024-01-14", "2024-03-14"),
(8, 5, 6, "2024-01-16", "2024-03-16");

select book_id, book_name
from book
inner join author
on book.author_id = author.author_id
where author.author_name = "chetan bhagat";

select book_name, count(loan.loan_id)
from book
left join loan
on book.book_id = loan.book_id
group by book.book_id
order by count(loan.loan_id) desc
limit 1;

select borrower.first_name, borrower.last_name, book.book_name
from borrower
join loan
on borrower.borrower_id = loan.borrower_id
join book
on book.book_id = loan.book_id;

select book_name
from book
where published_year > 1950;

select book.book_name
from borrower
join loan
on borrower.borrower_id = loan.borrower_id
join book
on book.book_id = loan.book_id
where borrower.first_name = "neha" and borrower.last_name = "mishra";