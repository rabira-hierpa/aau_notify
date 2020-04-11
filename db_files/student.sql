CREATE TABLE IF NOT EXISTS student(
	studentId varchar(11) NOT NULL,							
	fullName varchar(50) NOT NULL,				
	courseRegistredID int NOT NULL,
	yearOfEntry int(4) NOT NULL,
	year int(4) NOT NULL,
	PRIMARY KEY(studentId)
	-- FOREIGN KEY (courseRegistredID) REFERENCES courseRegistred(courseRegistredID)
);							
CREATE TABLE IF NOT EXISTS courseRegistred(
	courseRegistredID int NOT NULL,
	studentId VARCHAR(11) NOT NULL,
	courseCode varchar(15) NOT NULL,
	seme int(1) NOT NULL,
	PRIMARY KEY(courseRegistredID),
	FOREIGN KEY (courseCode) REFERENCES allcourses(courseCode),
	FOREIGN KEY (studentId) REFERENCES student(studentId)
);
CREATE TABLE IF NOT EXISTS instructors(
	instructorID int(11) NOT NULL,
	instructorName varchar(50) NOT NULL,
	courseCode varchar(15) NOT NULL,
	FOREIGN KEY (courseCode) REFERENCES allcourses(courseCode)
);
CREATE TABLE IF NOT EXISTS courseGroupAdmins(
	courseCode varchar(15) NOT NULL,
	courseAdminID int NOT NULL,
	instructorID int(11) NOT NULL,
	PRIMARY KEY (courseAdminID),
	FOREIGN KEY (courseCode) REFERENCES allcourses(courseCode),
	FOREIGN KEY (instructorID) REFERENCES instructors(instructorID)
);
CREATE TABLE IF NOT EXISTS courseChat(
	courseChatID int NOT NULL,
	courseRegistredID INT NOT NULL,
	year int(4) NOT NULL,
	comment TEXT NOT NULL, 
	courseCOde varchar(15) NOT NULL,
	PRIMARY KEY (courseChatID),
	FOREIGN KEY (courseCode) REFERENCES allcourses(courseCode)
);

-- Constraints
ALTER TABLE courseChat 
    ADD CONSTRAINT FK_CrsRegID
    FOREIGN KEY (courseRegistredID)
        REFERENCES courseRegistred (courseRegistredID)
            ON DELETE CASCADE
            ON UPDATE CASCADE;

-- INSERT STATMENTS
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/1234/07','ABEBE KEBEDE CHANNEY','abebe.kebede',2007,3);
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/9876/07','GEZU BEZU BEZEBEZU','gezu.bezu',2007,3);
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/4321/06','BEREKET DENDENA EPHREME','bereket.dendena',2006,4);
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/3241/08','CHALTU DOGA ABENET','chaltu.doga',2008,2);
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/2134/09','EPHREME BELETE ZELALEME','ephreme.belete',2009,1);
INSERT INTO `student`(`studentId`, `fullName`, `passkey`, `yearOfEntry`, `year`) VALUES ('NSR/4567/05','FOZEYA MOHAMMED AHEMEDE','fozeya.mohammed',2005,2);

-- Registred Students
INSERT INTO `courseRegistred`(`studentId`, `courseCode`, `seme`) VALUES ('NSR/1234/07','CoSc3072',2);
INSERT INTO `courseRegistred`(`studentId`, `courseCode`, `seme`) VALUES ('NSR/4321/06','CoSc4171',2);
INSERT INTO `courseRegistred`(`studentId`, `courseCode`, `seme`) VALUES ('NSR/3241/08','CoSc3051',2);
INSERT INTO `courseRegistred`(`studentId`, `courseCode`, `seme`) VALUES ('NSR/2134/09','CoSc1013',2);
INSERT INTO `courseRegistred`(`studentId`, `courseCode`, `seme`, `courseAdminID`) VALUES ('NSR/9876/07','CoSc3072',2,1);

-- Instructors INSERT INTO `instructors`(`instructorID`,
`instructorName`,`passkey`, `courseCode`) VALUES (1010,'AYALEW
BELETE','ayalwe.belete','Cosc3072'); INSERT INTO `instructors`(`instructorID`,
`instructorName`,`passkey`, `courseCode`) VALUES (1020,'LEYKUN
BELAYE','leykun.belaye','CoSc4171'); INSERT INTO `instructors`(`instructorID`,
`instructorName`,`passkey`,  `courseCode`) VALUES (1030,'GASHAWE
TESGAYE','gashawe.tesgaye','CoSc1013'); INSERT INTO
`instructors`(`instructorID`, `instructorName`,`passkey`,  `courseCode`)
VALUES (1040,'BETTY KEFYALEW','betty.kefyalew','CoSc3051'); -- Group Admins
INSERT INTO `courseGroupAdmins`(`courseCode`, `instructorID`) VALUES
('Cosc3072',1010); INSERT INTO `courseGroupAdmins`(`courseCode`,
`instructorID`) VALUES ('CoSc4171',1020); INSERT INTO
`courseGroupAdmins`(`courseCode`, `instructorID`) VALUES ('CoSc1013',1030);
INSERT INTO `courseGroupAdmins`(`courseCode`, `instructorID`) VALUES
('CoSc3051',1040); -- Group Chat  
INSERT INTO `courseChat`(`courseAdminID`,
`courseRegistredID`, `year`, `comment`, `courseCode`) VALUES (1,1,2006,'Lorem
ipsum dolor sit amet, consectetur adipisicing elit. Veritatis commodi ratione
dicta laborum consequatur eaque ea voluptate iure cupiditate aperiam sapiente
perspiciatis architecto qui obcaecati, perferendis distinctio non facere
hic?','CoSc3072'); INSERT INTO `courseChat`(`courseAdminID`,
`courseRegistredID`, `year`, `comment`, `courseCode`) VALUES (2,2,2007,'Lorem
ipsum dolor sit amet, consectetur adipisicing elit. Totam, ipsa vel doloribus
aliquam? Explicabo aut veniam voluptatum et nostrum dolore, autem reiciendis a
assumenda. Odio blanditiis eligendi, mollitia labore
consequuntur.','CoSc4171'); INSERT INTO `courseChat`(`courseAdminID`,
`courseRegistredID`, `year`, `comment`, `courseCode`) VALUES (3,3,2008,'Lorem
ipsum dolor sit amet, consectetur adipisicing elit. Consequatur dicta minus
tempore cum repellendus nihil dolores consectetur libero inventore obcaecati
maiores, debitis sunt, ea ipsum non magnam animi saepe, beatae.','CoSc3051');
INSERT INTO `courseChat`(`courseAdminID`, `courseRegistredID`, `year`,
`comment`, `courseCode`) VALUES (4,4,2009,'Lorem ipsum dolor sit amet,
consectetur adipisicing elit. Libero cum laborum non, labore repellendus
molestiae aperiam officia, animi inventore consequuntur reprehenderit
laboriosam adipisci vitae dicta, eligendi. Recusandae atque excepturi,
at.','CoSc1013');
INSERT INTO `courseChat`(`courseRegistredID`, `year`, `message`, `courseCode`, `date`) VALUES (5,3,'Lorem ipsum doret alar fegea dlent dmenad waes orisp oosrei tndwet ','CoSc3072','2017-05-20 20:56:29');

-- GET ALL THE COMMENTS WITH THE COURSE TITLE AND STUDENT ID
SELECT courseRegistred.courseRegistredID,courseTitle,message,date,courseChat.year FROM courseChat,courseRegistred,allcourses WHERE courseRegistred.courseCode=allcourses.courseCode and courseChat.courseRegistredID = courseRegistred.courseRegistredID;
select courseChat.courseRegistredID,message,courseChat.date from courseChat,courseRegistred WHERE courseChat.courseRegistredID = courseRegistred.courseRegistredID;