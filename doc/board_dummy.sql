insert into board(id, title, content, hit, img, created_at, created_by)
    select 
        board_seq.nextval, 
        dbms_random.string('a', 10), 
        dbms_random.string('a', 50),
        trunc(DBMS_RANDOM.value(0,100)),
        null,
        trunc(SYSDATE + DBMS_RANDOM.value(0,366)), 
        dbms_random.string('a', 5) from dual
connect by level < 99;

