select top 1 COUNT( a.Name) as countAuthor, a.Name from BooksAtStudents bs

join AuthorsBooks ab on bs.IdBook=ab.IdBook
join Authors a on ab.IdAuthors=a.Id
where YEAR(bs.TakingBook)=2022

group by a.name
order by countAuthor desc