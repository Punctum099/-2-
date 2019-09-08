drop database gaesipan;

create database gaesipan;

use gaesipan;

CREATE TABLE Board_TB
(
    `seq`       INT                        NOT NULL    AUTO_INCREMENT COMMENT '게시물 번호', 
    `title`     VARCHAR(255)               NOT NULL    COMMENT '글 제목', 
    `contents`  TEXT                       NOT NULL    COMMENT '본문 내용', 
    `author`    VARCHAR(64)                NOT NULL    COMMENT '작성자', 
    `hit`       INT                        NOT NULL    COMMENT '조회수', 
    `time`      DATETIME                   NOT NULL    COMMENT '게시한 시간', 
    `UPtime`    DATETIME                   NOT NULL    COMMENT '변경 된 시간', 
    `see`       ENUM('Y','N','D')          NOT NULL    DEFAULT 'Y' COMMENT '일반 사용자에게 보여질지의 여부', 
    `listType`  ENUM('Notice','Normal')    NOT NULL    DEFAULT 'Normal' COMMENT '글 종류', 
    `MTtime`    DATE                       NULL        COMMENT '유지일', 
    PRIMARY KEY (seq)
);

ALTER TABLE Board_TB COMMENT '게시된 글에 대한 테이블';

CREATE TABLE Comment_TB
(
    `seq`        INT               NOT NULL    AUTO_INCREMENT COMMENT '댓글 전체의 번호', 
    `board_seq`  INT               NOT NULL    COMMENT '부모 게시글의 seq', 
    `group_seq`  INT               NOT NULL    COMMENT '댓글 그룹 번호', 
    `level`      INT               NOT NULL    COMMENT '몇 번째 댓글인지', 
    `contents`   TEXT              NOT NULL    COMMENT '댓글 내용', 
    `author`     VARCHAR(64)       NOT NULL    COMMENT '사용자 별명', 
    `time`       DATETIME          NOT NULL    COMMENT '댓글 작성 시간', 
    `see`        ENUM('Y','N')     NOT NULL    DEFAULT 'Y' COMMENT '삭제 여부', 
    PRIMARY KEY (seq)
);

ALTER TABLE Comment_TB COMMENT '댓글 테이블';

ALTER TABLE Comment_TB
    ADD CONSTRAINT FK_Comment_TB_board_seq_Board_TB_seq FOREIGN KEY (board_seq)
        REFERENCES Board_TB (seq) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE Member_TB
(
    `seq`           INT                     NOT NULL    AUTO_INCREMENT COMMENT '회원 번호', 
    `id`            VARCHAR(64)             NOT NULL    UNIQUE COMMENT '아이디', 
    `password`      VARCHAR(64)             NOT NULL    UNIQUE COMMENT '비밀번호', 
    `local_email`   VARCHAR(64)             NOT NULL    COMMENT '이메일 로컬 파트', 
    `domain_email`  VARCHAR(255)            NOT NULL    COMMENT '이메일 도메인 파트', 
    `nickname`      VARCHAR(64)             NOT NULL    UNIQUE COMMENT '별명', 
    `name`          VARCHAR(20)             NOT NULL    COMMENT '회원이름', 
    `gender`        ENUM('남','여')          NOT NULL    COMMENT '성별', 
    `birthday`      DATE                    NOT NULL    COMMENT '생년월일', 
    `tel`           CHAR(13)                NOT NULL    UNIQUE COMMENT '휴대전화 번호', 
    `grade`         ENUM('ADMIN','USER')    NOT NULL    DEFAULT 'USER' COMMENT '회원등급', 
    `goust`         ENUM('Y','N')           NOT NULL    DEFAULT 'N' COMMENT '회원탈퇴여부', 
    `join_date`     DATE                    NOT NULL    COMMENT '가입일', 
    PRIMARY KEY (seq)
);

ALTER TABLE Member_TB COMMENT '회원 정보 관리 테이블';

CREATE TABLE File_TB
(
    `seq`                 INT              NOT NULL    AUTO_INCREMENT COMMENT '파일 번호', 
    `board_seq`           INT              NOT NULL    COMMENT '파일이 저장된 게시물 번호', 
    `original_file_name`  VARCHAR(260)     NOT NULL    COMMENT '실제 파일 이름', 
    `stored_file_name`    VARCHAR(36)      NOT NULL    UNIQUE COMMENT '저장될 파일 이름', 
    `file_size`           INT              NOT NULL    COMMENT '파일 크기', 
    `del`                 ENUM('Y','N')    NOT NULL    DEFAULT 'N' COMMENT '삭제 여부', 
    PRIMARY KEY (seq)
);

ALTER TABLE File_TB COMMENT '파일 정보가 들어가있는 테이블';

ALTER TABLE File_TB
    ADD CONSTRAINT FK_File_TB_board_seq_Board_TB_seq FOREIGN KEY (board_seq)
        REFERENCES Board_TB (seq) ON DELETE RESTRICT ON UPDATE RESTRICT;
        
        
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 001', '내용 001', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 002', '내용 002', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 003', '내용 003', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 004', '내용 004', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 005', '내용 005', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 006', '내용 006', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 007', '내용 007', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 008', '내용 008', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 009', '내용 009', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 010', '내용 010', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 011', '내용 011', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 012', '내용 012', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 013', '내용 013', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 014', '내용 014', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 015', '내용 015', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 016', '내용 016', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 017', '내용 017', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 018', '내용 018', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 019', '내용 019', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 020', '내용 020', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 021', '내용 021', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 022', '내용 022', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 023', '내용 023', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 024', '내용 024', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 025', '내용 025', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 026', '내용 026', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 027', '내용 027', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 028', '내용 028', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 029', '내용 029', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 030', '내용 030', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 031', '내용 031', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 032', '내용 032', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 033', '내용 033', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 034', '내용 034', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 035', '내용 035', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 036', '내용 036', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 037', '내용 037', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 038', '내용 038', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 039', '내용 039', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 040', '내용 040', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 041', '내용 041', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 042', '내용 042', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 043', '내용 043', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 044', '내용 044', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 045', '내용 045', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 046', '내용 046', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 047', '내용 047', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 048', '내용 048', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 049', '내용 049', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 050', '내용 050', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 051', '내용 051', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 052', '내용 052', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 053', '내용 053', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 054', '내용 054', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 055', '내용 055', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 056', '내용 056', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 057', '내용 057', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 058', '내용 058', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 059', '내용 059', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 060', '내용 060', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 061', '내용 061', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 062', '내용 062', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 063', '내용 063', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 064', '내용 064', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 065', '내용 065', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 066', '내용 066', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 067', '내용 067', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 068', '내용 068', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 069', '내용 069', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 070', '내용 070', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 071', '내용 071', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 072', '내용 072', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 073', '내용 073', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 074', '내용 074', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 075', '내용 075', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 076', '내용 076', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 077', '내용 077', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 078', '내용 078', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 079', '내용 079', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 080', '내용 080', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 081', '내용 081', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 082', '내용 082', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 083', '내용 083', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 084', '내용 084', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 085', '내용 085', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 086', '내용 086', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 087', '내용 087', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 088', '내용 088', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 089', '내용 089', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 090', '내용 090', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 091', '내용 091', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 092', '내용 092', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 093', '내용 093', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 094', '내용 094', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 095', '내용 095', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 096', '내용 096', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 097', '내용 097', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 098', '내용 098', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 099', '내용 099', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 100', '내용 100', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 101', '내용 101', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 102', '내용 102', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 103', '내용 103', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 104', '내용 104', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 105', '내용 105', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 106', '내용 106', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 107', '내용 107', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 108', '내용 108', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 109', '내용 109', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 110', '내용 110', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 111', '내용 111', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 112', '내용 112', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 113', '내용 113', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 114', '내용 114', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 115', '내용 115', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 116', '내용 116', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 117', '내용 117', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 118', '내용 118', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 119', '내용 119', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 120', '내용 120', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 121', '내용 121', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 122', '내용 122', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 123', '내용 123', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 124', '내용 124', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 125', '내용 125', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 126', '내용 126', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 127', '내용 127', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 128', '내용 128', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 129', '내용 129', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 130', '내용 130', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 131', '내용 131', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 132', '내용 132', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 133', '내용 133', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 134', '내용 134', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 135', '내용 135', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 136', '내용 136', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 137', '내용 137', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 138', '내용 138', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 139', '내용 139', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 140', '내용 140', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 141', '내용 141', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 142', '내용 142', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 143', '내용 143', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 144', '내용 144', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 145', '내용 145', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 146', '내용 146', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 147', '내용 147', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 148', '내용 148', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 149', '내용 149', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 150', '내용 150', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 151', '내용 151', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 152', '내용 152', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 153', '내용 153', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 154', '내용 154', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 155', '내용 155', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 156', '내용 156', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 157', '내용 157', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 158', '내용 158', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 159', '내용 159', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 160', '내용 160', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 161', '내용 161', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 162', '내용 162', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 163', '내용 163', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 164', '내용 164', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 165', '내용 165', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 166', '내용 166', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 167', '내용 167', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 168', '내용 168', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 169', '내용 169', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 170', '내용 170', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 171', '내용 171', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 172', '내용 172', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 173', '내용 173', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 174', '내용 174', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 175', '내용 175', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 176', '내용 176', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 177', '내용 177', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 178', '내용 178', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 179', '내용 179', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 180', '내용 180', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 181', '내용 181', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 182', '내용 182', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 183', '내용 183', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 184', '내용 184', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 185', '내용 185', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 186', '내용 186', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 187', '내용 187', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 188', '내용 188', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 189', '내용 189', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 190', '내용 190', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 191', '내용 191', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 192', '내용 192', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 193', '내용 193', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 194', '내용 194', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 195', '내용 195', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 196', '내용 196', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 197', '내용 197', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 198', '내용 198', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 199', '내용 199', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 200', '내용 200', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 201', '내용 201', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 202', '내용 202', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 203', '내용 203', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 204', '내용 204', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 205', '내용 205', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 206', '내용 206', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 207', '내용 207', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 208', '내용 208', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 209', '내용 209', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 210', '내용 210', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 211', '내용 211', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 212', '내용 212', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 213', '내용 213', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 214', '내용 214', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 215', '내용 215', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 216', '내용 216', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 217', '내용 217', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 218', '내용 218', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 219', '내용 219', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 220', '내용 220', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 221', '내용 221', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 222', '내용 222', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 223', '내용 223', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 224', '내용 224', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 225', '내용 225', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 226', '내용 226', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 227', '내용 227', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 228', '내용 228', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 229', '내용 229', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 230', '내용 230', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 231', '내용 231', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 232', '내용 232', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 233', '내용 233', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 234', '내용 234', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 235', '내용 235', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 236', '내용 236', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 237', '내용 237', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 238', '내용 238', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 239', '내용 239', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 240', '내용 240', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 241', '내용 241', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 242', '내용 242', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 243', '내용 243', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 244', '내용 244', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 245', '내용 245', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 246', '내용 246', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 247', '내용 247', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 248', '내용 248', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 249', '내용 249', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 250', '내용 250', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 251', '내용 251', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 252', '내용 252', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 253', '내용 253', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 254', '내용 254', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 255', '내용 255', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 256', '내용 256', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 257', '내용 257', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 258', '내용 258', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 259', '내용 259', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 260', '내용 260', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 261', '내용 261', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 262', '내용 262', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 263', '내용 263', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 264', '내용 264', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 265', '내용 265', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 266', '내용 266', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 267', '내용 267', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 268', '내용 268', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 269', '내용 269', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 270', '내용 270', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 271', '내용 271', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 272', '내용 272', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 273', '내용 273', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 274', '내용 274', '전성익', 0, NOW(), NOW(), 'Y');
INSERT INTO Board_TB (title, contents, author, hit, time, UPtime, see) VALUES ('제목 275', '내용 275', '전성익', 0, NOW(), NOW(), 'Y');

INSERT INTO Member_TB (id, password, local_email, domain_email, nickname, name, gender, birthday, tel, grade, goust, join_date) VALUE ('admin', '1234', 'admin', 'naver.com', 'admin', '전성익', '남', '1996-11-17', '010-1234-6789', 'ADMIN', 'N', NOW());