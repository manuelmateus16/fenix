select concat('update CURRICULAR_COURSE set CURRICULAR_COURSE.KEY_COURSE_HISTORIC = ',
	COURSE_HISTORIC.ID_INTERNAL, 
	' where CURRICULAR_COURSE.ID_INTERNAL = ', 
	COURSE_HISTORIC.KEY_CURRICULAR_COURSE, ';') 
as "" from COURSE_HISTORIC;