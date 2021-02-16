--SELECT 'DROP TABLE ' || table_name || ' CASCADE CONSTRAINTS;' FROM user_Tables;

DROP TABLE FORMAT CASCADE CONSTRAINTS;
DROP TABLE VERTEILER CASCADE CONSTRAINTS;
DROP TABLE PFANNE CASCADE CONSTRAINTS;
DROP TABLE KOKILLE CASCADE CONSTRAINTS;
DROP TABLE AREA CASCADE CONSTRAINTS;
DROP TABLE SUBAREA CASCADE CONSTRAINTS;
DROP TABLE EZV_GRUPPE CASCADE CONSTRAINTS;
DROP TABLE EZV CASCADE CONSTRAINTS;
DROP TABLE PARAMETER CASCADE CONSTRAINTS;
DROP TABLE PARAMETER_EZV CASCADE CONSTRAINTS;
DROP TABLE TEXT_PARAM CASCADE CONSTRAINTS;
DROP TABLE PATTERN_PARAM CASCADE CONSTRAINTS;
DROP TABLE CHARGE CASCADE CONSTRAINTS;
DROP TABLE TIME_JUNCTION;
DROP TABLE TIME_TABLE;


CREATE TABLE FORMAT(
    ID NUMBER,
    HOEHE NUMBER,
    BREITE NUMBER,
    CONSTRAINT PK_FORMAT PRIMARY KEY (ID)
);

CREATE TABLE VERTEILER (
    ID NUMBER,
    NAME VARCHAR2(100),
    AGE NUMBER,
    CONSTRAINT PK_VERTEILER PRIMARY KEY (ID)
);

CREATE TABLE PFANNE (
    ID NUMBER,
    NAME VARCHAR2(100),
    AGE NUMBER,
    CONSTRAINT PK_PFANNE PRIMARY KEY (ID)
);

CREATE TABLE KOKILLE (
    ID NUMBER,
    FORMAT_ID NUMBER,
    NAME VARCHAR2(100),
    AGE NUMBER,
    CONSTRAINT PK_KOKILLE PRIMARY KEY (ID),
    CONSTRAINT FK_KOKILLE_FORMAT FOREIGN KEY (FORMAT_ID) REFERENCES FORMAT(ID)
);


CREATE TABLE AREA(
    ID NUMBER,
    NAME VARCHAR2(100),
    CONSTRAINT PK_AREA PRIMARY KEY (ID)
);

CREATE TABLE SUBAREA(
    ID NUMBER,
    AREA_ID NUMBER,
    NAME VARCHAR2(100),
    CONSTRAINT PK_SUBAREA PRIMARY KEY (ID),
    CONSTRAINT FK_SUBAREA_AREA FOREIGN KEY (AREA_ID) REFERENCES AREA(ID)
);


CREATE TABLE EZV_GRUPPE(
    ID NUMBER,
    NAME varchar2(100),
    CONSTRAINT PK_EZV_GRUPPE PRIMARY KEY (ID)
);

CREATE TABLE EZV(
    ID NUMBER,
    EZV_GRUPPE_ID NUMBER,
    NAME VARCHAR2(100),
    CONSTRAINT PK_EZV PRIMARY KEY (ID),
    CONSTRAINT FK_EZV_EZV_GRUPPE FOREIGN KEY (EZV_GRUPPE_ID) REFERENCES EZV_GRUPPE(ID)
);

CREATE TABLE PARAMETER(
    ID NUMBER,
    NAME VARCHAR2(100),
    ISTEXT NUMBER(1),
    ISPATTERN NUMBER (1),
    EINHEIT VARCHAR2(100),
    MESSZEITPUNKT timestamp,
    STANDARDWERT NUMBER,
    MAXIMUM NUMBER,
    MINIMUM NUMBER,
    AREA NUMBER,
    CONSTRAINT PK_PARAMETER PRIMARY KEY (ID),
    CONSTRAINT FK_PARAMETER_SUBAREA FOREIGN KEY (AREA) REFERENCES SUBAREA(ID)
);

CREATE TABLE PARAMETER_EZV(
    ID NUMBER,
    EZV_ID NUMBER,
    PARAMETER_ID NUMBER,
    MIN NUMBER,
    AIM NUMBER,
    MAX NUMBER,
    CONSTRAINT PK_PARAMETER_EZV PRIMARY KEY (ID),
    CONSTRAINT FK_PARAMETER_EZV_EZV FOREIGN KEY (EZV_ID) REFERENCES EZV(ID),
    CONSTRAINT FK_PARAMETER_EZV_PARAMETER FOREIGN KEY (PARAMETER_ID) REFERENCES PARAMETER(ID)
);

CREATE TABLE PATTERN_PARAM(
    ID NUMBER,
    PATTERN_NO NUMBER,
    PATTERN_ID NUMBER,
    CONSTRAINT PK_PATTERN_PARAM PRIMARY KEY (ID),
    CONSTRAINT FK_PATTERN_PARAM_PARAMETER FOREIGN KEY (ID) REFERENCES PARAMETER(ID)
);


CREATE TABLE TEXT_PARAM(
    ID NUMBER,
    PARAMETER_NO NUMBER,
    TEXT VARCHAR2(100),
    CONSTRAINT PK_TEXT_PARAM PRIMARY KEY (ID),
    CONSTRAINT FK_TEXT_PARAM_PARAMETER FOREIGN KEY (ID) REFERENCES PARAMETER(ID)
);

CREATE TABLE CHARGE(
    ID NUMBER,
    EZV_ID NUMBER,
    VERTEILER_ID NUMBER,
    PFANNE_ID NUMBER,
    KOKILLE_ID NUMBER,
    NAME VARCHAR2(100),
    CONSTRAINT PK_CHARGE PRIMARY KEY (ID),
    CONSTRAINT FK_CHARGE_EZV FOREIGN KEY (EZV_ID) REFERENCES EZV(ID),
    CONSTRAINT FK_CHARGE_VERTEILER FOREIGN KEY (VERTEILER_ID) REFERENCES VERTEILER(ID),
    CONSTRAINT FK_CHARGE_PFANNE FOREIGN KEY (PFANNE_ID) REFERENCES PFANNE(ID),
    CONSTRAINT FK_CHARGE_KOKILLE FOREIGN KEY (KOKILLE_ID) REFERENCES KOKILLE(ID)
);

create Table Time_Table(
id number,
strangStart TIMESTAMP,
strangENd TIMESTAMP,
pfanneStart TIMESTAMP,
pfanneEnd TIMESTAMP,
VerteilerStart TIMESTAMP,
VerteilerEnd TIMESTAMP,
KokileStart TIMESTAMP,
KokileEnd TIMESTAMP
);

--Time Junction

create Table TIME_JUNCTION(
id number,
EZV_ID number,
weight number,
TIME_TABLE_ID number
);



