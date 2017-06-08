CREATE TABLE IF NOT EXISTS PUZZLE(
  "ORDER" INTEGER,
  PUZZLE_ID VARCHAR(128) PRIMARY KEY NOT NULL,
  DESCRIPTION VARCHAR(1024)
);

INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (0, '2x2x2', '2x2x2 cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (1, '3x3x3', 'Rubik''s cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (2, '4x4x4', '4x4x4 cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (3, '5x5x5', '5x5x5 cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (4, '6x6x6', '6x6x6 cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (5, '7x7x7', '7x7x7 cube');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (6, 'Clock', 'Rubik''s clock');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (7, 'Megaminx', 'Megaminx');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (8, 'Pyraminx', 'Pyraminx');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (9, 'Square-1', 'Square-1');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (10, 'Skewb', 'Skewb');
INSERT INTO PUBLIC.PUZZLE ("ORDER", PUZZLE_ID, DESCRIPTION) VALUES (11, 'EMPTY', 'Other');

CREATE TABLE IF NOT EXISTS SOLUTION(
    SOLUTION_ID UUID,
    CATEGORY_ID UUID,
    SESSION_ID UUID,
    SCRAMBLER_ID VARCHAR(128),
    SEQUENCE VARCHAR(4096),
    START TIMESTAMP,
    END TIMESTAMP,
    PENALTY VARCHAR(16),

    PRIMARY KEY(SOLUTION_ID),
);

CREATE TABLE IF NOT EXISTS CATEGORY(
  "ORDER"      INTEGER,
  CATEGORY_ID  VARCHAR(256) PRIMARY KEY NOT NULL,
  SCRAMBLER_ID VARCHAR(128),
  DESCRIPTION  VARCHAR(1024),
  FORCE_START  BOOLEAN,
  PHASES       INTEGER
);

INSERT INTO PUBLIC.CATEGORY ("ORDER", CATEGORY_ID, SCRAMBLER_ID, DESCRIPTION, FORCE_START, PHASES) VALUES (0, '01e76746-c97a-489a-a80d-84cd18b6d9e2', 'EMPTY', 'Empty', FALSE, 1);

CREATE TABLE IF NOT EXISTS TIP(
  TIP_ID VARCHAR(128) PRIMARY KEY NOT NULL,
  PUZZLE_ID VARCHAR(128),
  FOREIGN KEY (PUZZLE_ID) REFERENCES PUZZLE (PUZZLE_ID)
);

CREATE TABLE IF NOT EXISTS CATEGORY_TIPS(
  "ORDER" INTEGER,
  CATEGORY_ID VARCHAR(512) NOT NULL,
  TIP_ID VARCHAR(128) NOT NULL,
  PRIMARY KEY (CATEGORY_ID, TIP_ID),
  FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (CATEGORY_ID) ON DELETE CASCADE,
  FOREIGN KEY (TIP_ID) REFERENCES TIP (TIP_ID)
);

CREATE TABLE IF NOT EXISTS COLOR(
  PUZZLE_ID VARCHAR(128) NOT NULL,
  "ORDER" INTEGER,
  FACE_ID VARCHAR(128) NOT NULL,
  FACE_DESCRIPTION VARCHAR(1024),
  DEFAULT_R INTEGER,
  DEFAULT_G INTEGER,
  DEFAULT_B INTEGER,
  R INTEGER,
  G INTEGER,
  B INTEGER,
  PRIMARY KEY (PUZZLE_ID, FACE_ID),
  FOREIGN KEY (PUZZLE_ID) REFERENCES PUZZLE (PUZZLE_ID)
);

INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 0, 'U', 'Face U', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 1, 'D', 'Face D', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 2, 'L', 'Face L', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 3, 'R', 'Face R', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 4, 'F', 'Face F', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Square-1', 5, 'B', 'Face B', 255, 200, 0, 255, 200, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('2x2x2', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('3x3x3', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('4x4x4', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('5x5x5', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('6x6x6', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 2, 'L', 'Face L', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 3, 'R', 'Face R', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 4, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('7x7x7', 5, 'B', 'Face B', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Pyraminx', 0, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Pyraminx', 1, 'R', 'Face R', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Pyraminx', 2, 'L', 'Face L', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Pyraminx', 3, 'F', 'Face F', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 1, 'BL', 'Face BL', 255, 204, 0, 255, 204, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 2, 'BR', 'Face BR', 0, 0, 179, 0, 0, 179);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 3, 'R', 'Face R', 221, 0, 0, 221, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 4, 'F', 'Face F', 0, 102, 0, 0, 102, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 5, 'L', 'Face L', 138, 26, 255, 138, 26, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 6, 'D', 'Face D', 153, 153, 153, 153, 153, 153);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 7, 'DR', 'Face DR', 255, 255, 179, 255, 255, 179);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 8, 'DBR', 'Face DBR', 255, 153, 255, 255, 153, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 9, 'B', 'Face B', 113, 230, 0, 113, 230, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 10, 'DBL', 'Face DBL', 255, 132, 51, 255, 132, 51);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Megaminx', 11, 'DL', 'Face DL', 136, 221, 255, 136, 221, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 0, 'U', 'Face U', 255, 255, 255, 255, 255, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 1, 'D', 'Face D', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 2, 'L', 'Face L', 0, 255, 0, 0, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 3, 'R', 'Face R', 0, 0, 255, 0, 0, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 4, 'F', 'Face F', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Skewb', 5, 'B', 'Face B', 255, 128, 0, 255, 128, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 0, 'Front', 'Front', 51, 117, 178, 51, 117, 178);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 1, 'Back', 'Back', 85, 204, 255, 85, 204, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 2, 'HandBorder', 'Hand background', 255, 0, 0, 255, 0, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 3, 'Hand', 'Hand foreground', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 4, 'PinUp', 'Pin up', 255, 255, 0, 255, 255, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 5, 'PinDown', 'Pin down', 136, 85, 0, 136, 85, 0);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 6, 'FrontClock', 'Front Clock', 85, 204, 255, 85, 204, 255);
INSERT INTO PUBLIC.COLOR (PUZZLE_ID, "ORDER", FACE_ID, FACE_DESCRIPTION, DEFAULT_R, DEFAULT_G, DEFAULT_B, R, G, B) VALUES ('Clock', 7, 'BackClock', 'Back Clock', 51, 117, 178, 51, 117, 178);

DROP TABLE IF EXISTS CONFIGURATION;
CREATE TABLE IF NOT EXISTS CONFIGURATION(
    KEY VARCHAR(128),
    VALUE VARCHAR(1024),

    PRIMARY KEY(KEY)
);

INSERT INTO CONFIGURATION VALUES
    ('VERSION',                     'WCA'),
    ('CURRENT-CATEGORY',            '90dea358-e525-4b6c-8b2d-abfa61f02a9d'),
    ('TIMER-TRIGGER',               'KEYBOARD-TIMER-SPACE'),
    ('INSPECTION-TIME-ENABLED',     'TRUE'),
    ('PHASES-ENABLED',              'FALSE'),
    ('LOOK-AND-FEEL',               ''),
    ('SMOOTH-TIMING-ENABLED',       'TRUE'),
    ('STACKMAT-TIMER-INPUT-DEVICE', '');

COMMIT;