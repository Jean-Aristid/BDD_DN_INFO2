/*Question 1 */
desc section ;
select * from section ;


/*Question 2*/
select * from course ; 


/*Question 3*/
select title, dept_name from course ; 


/*Question 4*/
select dept_name, budget from department ; 


/*Question 5*/
select name, dept_name from teacher ; 


/*Question 6*/
select name from teacher 
where salary > 65000 ;

/*Question 7*/
select name from teacher 
where salary between 55000 and 85000 ; 


/*Question 8*/
select department.dept_name 
from department join teacher on department.dept_name = teacher.dept_name
;


/*Question 9*/
select name 
from teacher 
where dept_name = 'Comp. Sci.' and salary > 65000
;

/*Question 10*/
select distinct course.course_id, course.title, course.dept_name, course.credits
from course join section on section.course_id = course.course_id
where semester = 'Spring' and year = 2010 
;

/*Question 11*/
select title 
from course 
where dept_name = 'Comp. Sci.' and credits > 3
;


/*Question 12*/
select teacher.name , teacher.dept_name , department.building
from teacher join department on teacher.dept_name = department.dept_name 
;  


/*Question 13*/

select student.ID, student.name
from student join takes join course on student.dept_name = course.dept_name
and takes.course_id = course.course_id 
where course.dept_name = 'Comp. Sci.'
;


/*Question 14*/

select distinct s.name 
from student s 
JOIN takes tk ON s.ID = tk.ID
JOIN teaches te ON tk.course_id = te.course_id
                AND tk.sec_id = te.sec_id
                AND tk.semester = te.semester
                AND tk.year = te.year
JOIN teacher t ON te.ID = t.ID
WHERE t.name = 'Einstein';


/*Question 15*/


select te.course_id ,t.name

from teaches te  

join teacher t ON TE.ID = t.id 

;

/*Question 16*/

SELECT tk.course_id, tk.sec_id, COUNT(*) AS nb_inscrits 

FROM takes tk 

WHERE tk.semester = 'Spring' AND tk.year = 2010

GROUP BY tk.course_id, tk.sec_id ; 

/*Question 17*/


SELECT dept_name, MAX(salary) AS salaire_max
FROM teacher
GROUP BY dept_name; 


/*Question 18*/

SELECT course_id, sec_id, semester, year, COUNT(*) AS nb_inscrits
FROM takes
GROUP BY course_id, sec_id, semester, year;


/*Question 19 */

SELECT s.building, COUNT(*) AS nb_cours
FROM section s
WHERE (s.semester = ’Fall’
AND s.year = 2009)
OR (s.semester = ’Spring’ AND s.year = 2010)
GROUP BY s.building;


/*Question 20 */

SELECT d.dept_name, COUNT(*) AS nb_cours
FROM teaches te 
JOIN section s
ON te.course_id = s.course_id AND te.sec_id = s.sec_id
AND te.semester = s.semester
AND te.year = s.year
JOIN teacher t
ON te.ID = t.ID
JOIN department d 
ON t.dept_name = d.dept_name
WHERE s.building = d.building
GROUP BY d.dept_name;





/*Question 21 */

SELECT DISTINCT c.title, t.name
FROM course c
JOIN teaches te ON c.course_id = te.course_id
JOIN teacher t ON te.ID = t.ID;


/*Question 22 */

SELECT semester, COUNT(*) AS nb_cours
FROM section
WHERE semester IN (’Summer’, ’Fall’, ’Spring’)
GROUP BY semester;


/*Question 23*/

SELECT s.ID, s.name, SUM(c.credits) AS credits_hors_dept
FROM student s
JOIN takes tk ON s.ID = tk.ID
JOIN course c ON tk.course_id = c.course_id
WHERE c.dept_name <> s.dept_name
GROUP BY s.ID, s.name;


/*Question 24 */

SELECT d.dept_name, SUM(c.credits) AS total_credits
FROM department d
JOIN course c
ON c.dept_name = d.dept_name
JOIN section s
ON s.course_id = c.course_id
JOIN classroom cl ON s.building = cl.building
AND s.room_number = cl.room_number
WHERE s.building = d.building
GROUP BY d.dept_name;


