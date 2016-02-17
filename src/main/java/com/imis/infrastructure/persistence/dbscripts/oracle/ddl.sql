--------------------------------------------------------
--  File created - Wednesday-February-17-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_AUTHORITIES
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_AUTHORITIES"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_EDUCATION
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_EDUCATION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_EMPLOY
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_EMPLOY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_EMPLOYER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_EMPLOYER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_ORGANIZATION
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ORGANIZATION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_POSITION
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_POSITION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_POSITION_GROUP
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_POSITION_GROUP"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_STUDENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_STUDENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_USERS
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_USERS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Sequence SEQ_WORK
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_WORK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE  NOPARTITION
--------------------------------------------------------
--  DDL for Table APPLICATION
--------------------------------------------------------

  CREATE TABLE "APPLICATION" 
   (	"APPLICATION_ID" NUMBER, 
	"USERNAME" VARCHAR2(20), 
	"POSITION_ID" NUMBER, 
	"APPLICAITON_STATUS" CHAR(1) DEFAULT 0, 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE
   ) 

   COMMENT ON COLUMN "APPLICATION"."APPLICAITON_STATUS" IS '1:request;2:confirm;
3:reject'
--------------------------------------------------------
--  DDL for Table AUTHORITIES
--------------------------------------------------------

  CREATE TABLE "AUTHORITIES" 
   (	"AUTHORITIES_ID" NUMBER, 
	"USERNAME" VARCHAR2(50), 
	"AUTHORITY" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table EDUCATION
--------------------------------------------------------

  CREATE TABLE "EDUCATION" 
   (	"EDUCATION_ID" NUMBER(*,0), 
	"DEGREE" VARCHAR2(500), 
	"MAJOR" VARCHAR2(200), 
	"GPA" FLOAT(126), 
	"INSTITUTION" VARCHAR2(200), 
	"COUNTRY" VARCHAR2(100), 
	"GRADUATION_DATE" VARCHAR2(5), 
	"STUDENT_ID" NUMBER(*,0), 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE
   )
--------------------------------------------------------
--  DDL for Table EMPLOYER
--------------------------------------------------------

  CREATE TABLE "EMPLOYER" 
   (	"EMPLOYER_ID" NUMBER(*,0), 
	"EMPLOYER_NAME" VARCHAR2(500), 
	"ADDRESS" VARCHAR2(1000), 
	"CITY" VARCHAR2(100), 
	"POST_CODE" VARCHAR2(10), 
	"COUNTRY" VARCHAR2(100), 
	"CONTACTOR_FIRST_NAME" VARCHAR2(50), 
	"CONTACTOR_LAST_TIME" VARCHAR2(50), 
	"CONTACTOR_POSITION" VARCHAR2(100), 
	"TELEPHONE" VARCHAR2(20), 
	"EMIAL" VARCHAR2(50), 
	"WEBSITE" VARCHAR2(100), 
	"NOTES" VARCHAR2(1000), 
	"EMPLOYER_GROUP_ID" NUMBER(*,0), 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE, 
	"USERNAME" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table EMPLOYR_GROUP
--------------------------------------------------------

  CREATE TABLE "EMPLOYR_GROUP" 
   (	"EMPLOYER_GROUP_ID" NUMBER(*,0), 
	"TYPE" VARCHAR2(200)
   )
--------------------------------------------------------
--  DDL for Table PERSISTENT_LOGINS
--------------------------------------------------------

  CREATE TABLE "PERSISTENT_LOGINS" 
   (	"USERNAME" VARCHAR2(64), 
	"SERIES" VARCHAR2(64), 
	"TOKEN" VARCHAR2(64), 
	"LAST_USED" TIMESTAMP (6) DEFAULT CURRENT_TIMESTAMP
   )
--------------------------------------------------------
--  DDL for Table POSITION
--------------------------------------------------------

  CREATE TABLE "POSITION" 
   (	"POSITION_ID" NUMBER(*,0), 
	"POSITION_NAME" VARCHAR2(500), 
	"POSITION_GROUP_ID" NUMBER, 
	"EMPLOYER_ID" NUMBER, 
	"UPDATE_TIME" DATE, 
	"CREATE_TIME" DATE
   )
--------------------------------------------------------
--  DDL for Table POSITION_GROUP
--------------------------------------------------------

  CREATE TABLE "POSITION_GROUP" 
   (	"POSITION_GROUP_ID" NUMBER, 
	"POSITION_GROUP_NAME" VARCHAR2(200)
   )
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "STUDENT" 
   (	"STUDENT_ID" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(50), 
	"MIDDLE_NAME" VARCHAR2(50), 
	"LAST_NAME" VARCHAR2(50), 
	"EMAIL" VARCHAR2(50), 
	"TELEPHONE" VARCHAR2(20), 
	"STATUS" NUMBER(*,0), 
	"GENDER" VARCHAR2(50), 
	"SEMESTER_REGISTERED" VARCHAR2(6), 
	"REGISTERED_YEAR" VARCHAR2(4), 
	"STUDENT_NO" NUMBER, 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE, 
	"USERNAME" VARCHAR2(50)
   )
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"USER_ID" NUMBER, 
	"USERNAME" VARCHAR2(50), 
	"EMAIL" VARCHAR2(50), 
	"PASSWORD" VARCHAR2(100), 
	"CREATE_TIME" DATE, 
	"ENABLED" CHAR(1) DEFAULT 1, 
	"UPDATE_TIME" DATE, 
	"SALT" VARCHAR2(45)
   )
--------------------------------------------------------
--  DDL for Table WORK
--------------------------------------------------------

  CREATE TABLE "WORK" 
   (	"WORK_ID" NUMBER(*,0), 
	"COMPANY" VARCHAR2(500), 
	"DATES" VARCHAR2(11), 
	"TITLE" VARCHAR2(100), 
	"DUTIES" VARCHAR2(500), 
	"STUDENT_ID" NUMBER(*,0), 
	"CREATE_TIME" DATE, 
	"UPDATE_TIME" DATE
   )
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "POSITION_GROUP" ("POSITION_GROUP_ID")
--------------------------------------------------------
--  DDL for Index IDX_COMPANY
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_COMPANY" ON "EMPLOYER" ("EMPLOYER_ID")
--------------------------------------------------------
--  DDL for Index IDX_EDUCATION_EDUCATION_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_EDUCATION_EDUCATION_ID" ON "EDUCATION" ("EDUCATION_ID")
--------------------------------------------------------
--  DDL for Index IDX_WORK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_WORK" ON "WORK" ("WORK_ID")
--------------------------------------------------------
--  DDL for Index IDX_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_USERS" ON "USERS" ("USER_ID")
--------------------------------------------------------
--  DDL for Index AUTHORITIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AUTHORITIES_PK" ON "AUTHORITIES" ("AUTHORITIES_ID")
--------------------------------------------------------
--  DDL for Index UK_EMAIL_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "UK_EMAIL_USERS" ON "USERS" ("EMAIL")
--------------------------------------------------------
--  DDL for Index UK_USERNAME_USERS
--------------------------------------------------------

  CREATE UNIQUE INDEX "UK_USERNAME_USERS" ON "USERS" ("USERNAME")
--------------------------------------------------------
--  DDL for Index EMPLOY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMPLOY_PK" ON "APPLICATION" ("APPLICATION_ID")
--------------------------------------------------------
--  DDL for Index IDX_EMPLOYER
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_EMPLOYER" ON "EMPLOYR_GROUP" ("EMPLOYER_GROUP_ID")
--------------------------------------------------------
--  DDL for Index IDX_POSITION
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_POSITION" ON "POSITION" ("POSITION_ID")
--------------------------------------------------------
--  DDL for Index PERSISTENT_LOGINS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSISTENT_LOGINS_PK" ON "PERSISTENT_LOGINS" ("SERIES")
--------------------------------------------------------
--  DDL for Index IDX_STUDENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "IDX_STUDENT" ON "STUDENT" ("STUDENT_ID")
--------------------------------------------------------
--  Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "AUTHORITIES" MODIFY ("AUTHORITY" NOT NULL ENABLE)
  ALTER TABLE "AUTHORITIES" ADD CONSTRAINT "AUTHORITIES_PK" PRIMARY KEY ("AUTHORITIES_ID")
  USING INDEX  ENABLE
  ALTER TABLE "AUTHORITIES" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "AUTHORITIES" MODIFY ("AUTHORITIES_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table POSITION
--------------------------------------------------------

  ALTER TABLE "POSITION" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "POSITION" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "POSITION" MODIFY ("EMPLOYER_ID" NOT NULL ENABLE)
  ALTER TABLE "POSITION" MODIFY ("POSITION_GROUP_ID" NOT NULL ENABLE)
  ALTER TABLE "POSITION" ADD CONSTRAINT "PK_POSITION" PRIMARY KEY ("POSITION_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_POSITION" ON "POSITION" ("POSITION_ID") 
  )  ENABLE
  ALTER TABLE "POSITION" MODIFY ("POSITION_NAME" NOT NULL ENABLE)
  ALTER TABLE "POSITION" MODIFY ("POSITION_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table APPLICATION
--------------------------------------------------------

  ALTER TABLE "APPLICATION" ADD CONSTRAINT "PK_APPLICATION" PRIMARY KEY ("APPLICATION_ID")
  USING INDEX (CREATE UNIQUE INDEX "EMPLOY_PK" ON "APPLICATION" ("APPLICATION_ID") 
  )  ENABLE
  ALTER TABLE "APPLICATION" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "APPLICATION" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "APPLICATION" MODIFY ("APPLICAITON_STATUS" NOT NULL ENABLE)
  ALTER TABLE "APPLICATION" MODIFY ("POSITION_ID" NOT NULL ENABLE)
  ALTER TABLE "APPLICATION" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "APPLICATION" MODIFY ("APPLICATION_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("STUDENT_NO" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" ADD CONSTRAINT "PK_STUDENT" PRIMARY KEY ("STUDENT_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_STUDENT" ON "STUDENT" ("STUDENT_ID") 
  )  ENABLE
  ALTER TABLE "STUDENT" MODIFY ("REGISTERED_YEAR" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("SEMESTER_REGISTERED" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("GENDER" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("STATUS" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("TELEPHONE" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("EMAIL" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("LAST_NAME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("MIDDLE_NAME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("FIRST_NAME" NOT NULL ENABLE)
  ALTER TABLE "STUDENT" MODIFY ("STUDENT_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table EDUCATION
--------------------------------------------------------

  ALTER TABLE "EDUCATION" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" ADD CONSTRAINT "PK_EDUCATION" PRIMARY KEY ("EDUCATION_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_EDUCATION_EDUCATION_ID" ON "EDUCATION" ("EDUCATION_ID") 
  )  ENABLE
  ALTER TABLE "EDUCATION" MODIFY ("STUDENT_ID" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("INSTITUTION" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("GPA" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("MAJOR" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("DEGREE" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("EDUCATION_ID" NOT NULL ENABLE)
  ALTER TABLE "EDUCATION" MODIFY ("GRADUATION_DATE" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table WORK
--------------------------------------------------------

  ALTER TABLE "WORK" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("DUTIES" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("COMPANY" NOT NULL ENABLE)
  ALTER TABLE "WORK" ADD CONSTRAINT "PK_WORK" PRIMARY KEY ("WORK_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_WORK" ON "WORK" ("WORK_ID") 
  )  ENABLE
  ALTER TABLE "WORK" MODIFY ("STUDENT_ID" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("TITLE" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("DATES" NOT NULL ENABLE)
  ALTER TABLE "WORK" MODIFY ("WORK_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table EMPLOYR_GROUP
--------------------------------------------------------

  ALTER TABLE "EMPLOYR_GROUP" ADD CONSTRAINT "PK_EMPLOYER_GROUP" PRIMARY KEY ("EMPLOYER_GROUP_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_EMPLOYER" ON "EMPLOYR_GROUP" ("EMPLOYER_GROUP_ID") 
  )  ENABLE
  ALTER TABLE "EMPLOYR_GROUP" MODIFY ("TYPE" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYR_GROUP" MODIFY ("EMPLOYER_GROUP_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table PERSISTENT_LOGINS
--------------------------------------------------------

  ALTER TABLE "PERSISTENT_LOGINS" ADD CONSTRAINT "PERSISTENT_LOGINS_PK" PRIMARY KEY ("SERIES")
  USING INDEX  ENABLE
  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("LAST_USED" NOT NULL ENABLE)
  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("TOKEN" NOT NULL ENABLE)
  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("SERIES" NOT NULL ENABLE)
  ALTER TABLE "PERSISTENT_LOGINS" MODIFY ("USERNAME" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table POSITION_GROUP
--------------------------------------------------------

  ALTER TABLE "POSITION_GROUP" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("POSITION_GROUP_ID")
  USING INDEX  ENABLE
  ALTER TABLE "POSITION_GROUP" MODIFY ("POSITION_GROUP_NAME" NOT NULL ENABLE)
  ALTER TABLE "POSITION_GROUP" MODIFY ("POSITION_GROUP_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table EMPLOYER
--------------------------------------------------------

  ALTER TABLE "EMPLOYER" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("EMPLOYER_NAME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("EMPLOYER_GROUP_ID" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("WEBSITE" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" ADD CONSTRAINT "PK_EMPLOYER" PRIMARY KEY ("EMPLOYER_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_COMPANY" ON "EMPLOYER" ("EMPLOYER_ID") 
  )  ENABLE
  ALTER TABLE "EMPLOYER" MODIFY ("EMIAL" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("TELEPHONE" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("CONTACTOR_POSITION" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("CONTACTOR_LAST_TIME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("CONTACTOR_FIRST_NAME" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("POST_CODE" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("CITY" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("ADDRESS" NOT NULL ENABLE)
  ALTER TABLE "EMPLOYER" MODIFY ("EMPLOYER_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" ADD CONSTRAINT "UK_EMAIL_USERS" UNIQUE ("EMAIL")
  USING INDEX  ENABLE
  ALTER TABLE "USERS" ADD CONSTRAINT "UK_USERNAME_USERS" UNIQUE ("USERNAME")
  USING INDEX  ENABLE
  ALTER TABLE "USERS" MODIFY ("CREATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "USERS" MODIFY ("UPDATE_TIME" NOT NULL ENABLE)
  ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY ("USER_ID")
  USING INDEX (CREATE UNIQUE INDEX "IDX_USERS" ON "USERS" ("USER_ID") 
  )  ENABLE
  ALTER TABLE "USERS" MODIFY ("ENABLED" NOT NULL ENABLE)
  ALTER TABLE "USERS" MODIFY ("PASSWORD" NOT NULL ENABLE)
  ALTER TABLE "USERS" MODIFY ("EMAIL" NOT NULL ENABLE)
  ALTER TABLE "USERS" MODIFY ("USERNAME" NOT NULL ENABLE)
  ALTER TABLE "USERS" MODIFY ("USER_ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table APPLICATION
--------------------------------------------------------

  ALTER TABLE "APPLICATION" ADD CONSTRAINT "FK_APPLICATION_POSITION" FOREIGN KEY ("POSITION_ID")
	  REFERENCES "POSITION" ("POSITION_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table AUTHORITIES
--------------------------------------------------------

  ALTER TABLE "AUTHORITIES" ADD CONSTRAINT "FK_AUTHORITIES_USERS" FOREIGN KEY ("USERNAME")
	  REFERENCES "USERS" ("USERNAME") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table EDUCATION
--------------------------------------------------------

  ALTER TABLE "EDUCATION" ADD CONSTRAINT "FK_EDUCATION_STUDENT" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "STUDENT" ("STUDENT_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYER
--------------------------------------------------------

  ALTER TABLE "EMPLOYER" ADD CONSTRAINT "FK_EMPLOYER_EMPLOYER_GROUP" FOREIGN KEY ("EMPLOYER_GROUP_ID")
	  REFERENCES "EMPLOYR_GROUP" ("EMPLOYER_GROUP_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table POSITION
--------------------------------------------------------

  ALTER TABLE "POSITION" ADD CONSTRAINT "FK_POSITION_EMPLOYER" FOREIGN KEY ("EMPLOYER_ID")
	  REFERENCES "EMPLOYER" ("EMPLOYER_ID") ENABLE
  ALTER TABLE "POSITION" ADD CONSTRAINT "FK_POSITION_GROUP" FOREIGN KEY ("POSITION_GROUP_ID")
	  REFERENCES "POSITION_GROUP" ("POSITION_GROUP_ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "STUDENT" ADD CONSTRAINT "FK_STUDENT_USERS" FOREIGN KEY ("USERNAME")
	  REFERENCES "USERS" ("USERNAME") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table WORK
--------------------------------------------------------

  ALTER TABLE "WORK" ADD CONSTRAINT "FK_WORK_STUDENT" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "STUDENT" ("STUDENT_ID") ENABLE
